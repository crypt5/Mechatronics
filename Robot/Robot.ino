#include <Scheduler.h>
#include <math.h>
#include "Robot.h"
#include "Defs.h"
#include "RF24.h"


Robot robot;
RF24 radio(RF_RADIO_PIN_0,RF_RADIO_PIN_1);

// State Defs
#define STATE_SETUP 0
#define STATE_DRIVING 1
#define STATE_LOCATING 2
#define STATE_PICKUP 3
#define STATE_REVERSE 4
#define STATE_TURNING 5
#define STATE_DROPOFF 6
#define STATE_RETURN 7
#define STATE_DONE 8

// Error defs
#define ERR_DRIVE 1 // 1
#define ERR_LIFT 1<<1 // 2
#define ERR_ACCL 1<<2 // 3
#define ERR_ULTRA_FRONT 1<<3 // 4
#define ERR_ULTRA_SIDE 1<<4 // 5
#define ERR_IR 1<<5 // 6

// Corrected Servo angles
#define IR_0 5
#define IR_10 16
#define IR_20 24
#define IR_30 32
#define IR_40 41
#define IR_50 49
#define IR_60 57
#define IR_70 65
#define IR_80 74
#define IR_90 84
#define IR_100 96
#define IR_110 106
#define IR_120 116
#define IR_130 126
#define IR_140 136
#define IR_150 143
#define IR_160 150
#define IR_170 156
#define IR_180 164

#define DESIRED_SIDE_DIST 30 // Distance to stay from wall (about the center)

// PID Gains
#define KP 1.0
#define KD 1.2
#define KI 0.2

byte state=STATE_SETUP;

// Data needed by the IR Sweeping function
byte IRVals[19];
byte IRAngle[]={IR_0,IR_10,IR_20,IR_30,IR_40,IR_50,IR_60,IR_70,IR_80,IR_90,IR_100,IR_110,IR_120,IR_130,IR_140,IR_150,IR_160,IR_170,IR_180};
byte IRCount=0;
byte IRDir=0;
byte IR_Override=0;

volatile byte ButtonPressed=0;

// Varibles needed by the Comm system
int leftDrive=0,rightDrive=0;
byte redLED=0,yellowLED=0,greenLED=0;
byte manual=0;
byte liftMot=0;
byte loaded=0;
byte stateSave;
byte IROverrideSave;
int compoundErr=0;

// Correction factors to account for 
// Sensors not working right
float ultraCorrect=0;
float irCorrect=0;
byte hyp=22;

void setup() {
  //Serial.begin(115200);
  robot.setUpRadio(radio);
  attachInterrupt(digitalPinToInterrupt(BUTTON),buttonISR,RISING);
  byte errCode=0;
  Scheduler.startLoop(commLoop);

  // System Check
  if(robot.isDrivePowered()==0)
    errCode=ERR_DRIVE;
  if(robot.isLiftPowered()==0)
    errCode=errCode|ERR_LIFT;
  if(robot.readAcclX()==0)
    errCode=errCode|ERR_ACCL;
  if(robot.readFrontUltra()==0)
    errCode=errCode|ERR_ULTRA_FRONT;
  if(robot.readSideUltra()==0)
    errCode=errCode|ERR_ULTRA_SIDE;
  if(robot.readIR()==0)
    errCode=errCode|ERR_IR;

   robot.raiseLift();

  // Wait for Override/Start Button
  int errNum=0;
  while(ButtonPressed==0){
    if(errCode==0){
      robot.setGreenLED(-1);
      greenLED=1;
    }
    else{
      flashError(errCode,errNum);
    }
    if(errNum==7)
      errNum=0;
    else
      errNum=errNum+1;  
    delay(100);
  }

  // If the IR Subsystem is enabled
  if(robot.readSwitch(1)==1)
    Scheduler.startLoop(IRLoop);

  delay(100);
  // Prepare for the First State
  IR_Override=1;
  robot.setIRAngle(IR_180);
  
  // Get correction factors from 30 Samplings
  ultraCorrect+=robot.readSideUltra();
  ultraCorrect+=robot.readSideUltra();
  ultraCorrect+=robot.readSideUltra();
  ultraCorrect=((ultraCorrect/3.0)-30.0);
  irCorrect+=robot.readIR();
  irCorrect+=robot.readIR();
  irCorrect+=robot.readIR();
  irCorrect=((irCorrect/3.0)-30.0);
  state=STATE_DRIVING;
}

void loop() {
  // Main control loop
  switch(state){

    //Varibles needed for the PID and other control
    float side_ultra,front_ultra,side_ir,front_ir;
    float err1,err2;
    int change;
    float angle;

    // Driving, PID to follow a wall at 33 cm away. 
    case STATE_DRIVING:
      if(loaded==0){
        leftDrive=220;
        rightDrive=220;
      } else {
        leftDrive=110;
        rightDrive=110;
        //robot.raiseLift();
      }
      IR_Override=1;
      robot.setIRAngle(IR_180);
      side_ultra=robot.readSideUltra()-ultraCorrect;
      side_ir=robot.readIR()-irCorrect;
      if(side_ultra>0&&side_ultra<60&&side_ir>0&&side_ir<60){
        err1=side_ir-side_ultra; // Angle err
        angle=asin((double)err1/(double)hyp)*57.2958;
        err2=DESIRED_SIDE_DIST-(side_ir+side_ultra)/2.0;
        compoundErr+=err2;
        change=(KP*err2)+(KI*compoundErr)-(KD*angle);
        rightDrive=rightDrive+change;
      } else {
        rightDrive=rightDrive-40;
      }
      robot.setRightDrive(rightDrive);
      robot.setLeftDrive(leftDrive);
      if(robot.readFrontUltra()<55&&loaded==0){
        if(robot.readFrontUltra()<55)
          state=STATE_LOCATING;
      }
      else if(robot.readFrontUltra()<35&&loaded==1){
        state=STATE_DROPOFF;
      }
      break;

    // Locating the Load and aligning for pickup
    case STATE_LOCATING:
      IR_Override=1;
      robot.setIRAngle(IR_90);
      delay(200);
      leftDrive=0;
      rightDrive=0;
      robot.setRightDrive(rightDrive);
      robot.setLeftDrive(leftDrive);
      front_ultra=robot.readFrontUltra();
      front_ir=robot.readIR();
      robot.setIRAngle(IR_40);
      delay(200);

      if(abs((front_ir-1)-front_ultra)<5){ // Load is centered
        leftDrive=100;
        rightDrive=100;
      } else if((front_ir-1)<front_ultra){ // Load is to the right 
        leftDrive=80;
        rightDrive=30;
      } else { // Load is to the left
        leftDrive=30;
        rightDrive=80;
      }
      
      side_ir=robot.readIR();
      if(side_ir<16){ // Load is centered and in the rght spot to be picked up
        leftDrive=0;
        rightDrive=0;
        state=STATE_PICKUP;
      }
   
      robot.setLeftDrive(leftDrive);
      robot.setRightDrive(rightDrive);
      delay(175);
      break;

    // Sequence to prep the lift and position the robot
    case STATE_PICKUP:
      robot.setIRAngle(IR_90);
      robot.setLeftDrive(0);
      robot.setRightDrive(0);
      robot.lowerLift();
      delay(500);
      robot.setLeftDrive(80);
      robot.setRightDrive(80);
      while(robot.readFrontUltra()>22||robot.readIR()>22)
        delay(10);
      robot.setRightDrive(0);
      robot.setLeftDrive(0);
      robot.raiseLift();
      state=STATE_REVERSE;
      loaded=1;
      break;

    // Back up a bit to avoid the walls and prep for turn
    case STATE_REVERSE:
      robot.setRightDrive(-100);
      robot.setLeftDrive(-100);
      delay(1000);
      state=STATE_TURNING;
      break;

    // Turn around (Not functioning very well, Sensor issues)
    case STATE_TURNING:
      IR_Override=1;
      robot.setIRAngle(IR_180);
      robot.setRightDrive(90);
      robot.setLeftDrive(-90);
      delay(2000);
      side_ir=robot.readIR()-irCorrect;
      side_ultra=robot.readSideUltra()-ultraCorrect;
      while(abs(side_ir-side_ultra)>15){ // Are we straignt with the wall
        side_ir=robot.readIR()-irCorrect;
        side_ultra=robot.readSideUltra()-ultraCorrect;
        delay(10);
      }
      robot.setRightDrive(0);
      robot.setLeftDrive(0);
      compoundErr=0;
      if(loaded==1)
        state=STATE_DRIVING;
      else
        state=STATE_RETURN;
      break;

    // Prep and position the robot to off load the package
    case STATE_DROPOFF:
      robot.setRightDrive(60);
      robot.setLeftDrive(60);
      delay(300);
      robot.setRightDrive(0);
      robot.setLeftDrive(0);
      robot.lowerLift();
      delay(500);
      loaded=0;
      state=STATE_RETURN;
      break;

    // Follows the wall like the PID, but stops about half way. 
    // Doesn't work really well. 
    case STATE_RETURN:
      robot.setLeftDrive(-255);
      robot.setRightDrive(-255);
      delay(2250);
      state=STATE_DONE;
      break;

    // We are centered and the load has been moved. Relax
    case STATE_DONE:
      robot.setRightDrive(0);
      robot.setLeftDrive(0);
      delay(1000);
      break;
  }
 yield();
}

// Function to flash the error codes
void flashError(byte errCode,int num){
  int flashed=0;
  switch(num){
    case 0:
    if((errCode&ERR_DRIVE)>0){
      robot.setRedLED(1);
      flashed=1;
    }
    break;
    case 1:
    if((errCode&ERR_LIFT)>0){
      robot.setRedLED(2);
      flashed=1;
    }
    break;
    case 2:
    if((errCode&ERR_ACCL)>0){
      robot.setRedLED(3);
      flashed=1;
    }
    break;
    case 3:
    if((errCode&ERR_ULTRA_FRONT)>0){
      robot.setRedLED(4);
      flashed=1;
    }
    break;
    case 4:
    if((errCode&ERR_ULTRA_SIDE)>0){
      robot.setRedLED(5);
      flashed=1;
    }
    break;
    case 5:
    if((errCode&ERR_IR)>0){
      robot.setRedLED(6);
      flashed=1;
    }
    break;
    default:
    ;
  }
  if(flashed==1)
    delay(2000);
}

// Loop the handles the wireless communication and 
// Implements the communication commands
void commLoop(){
  if(robot.isCommandAvailable(radio)>0){
    byte type=robot.getNextCommandType();
    int value = robot.getNextCommandValue();
    int toSend=0;
    switch(type){
      case 0: // NO-OP
        break;
      case 1: // SET LEFT DRIVE
        if(value>255){ //Reverse
          value=(value&0x000000FF)*-1;
        }
        robot.setLeftDrive(value);
        leftDrive=value;
        break;
      case 2: // READ Left DRIVE
        toSend=leftDrive;
        if(leftDrive<0){
          toSend=toSend|0x00000100;
        }
        robot.commitToRadio(radio,1,toSend);
        break;
      case 3: // Set Right drive
        if(value>255){ //Reverse
          value=(value&0x000000FF)*-1;
        }
        robot.setRightDrive(value);
        rightDrive=value;
        break;
      case 4: // Read Right Drive
        toSend=rightDrive;
        if(rightDrive<0){
          toSend=toSend|0x00000100;
        }
        robot.commitToRadio(radio,3,toSend);
        break;
      case 5: // SET lift
        if(value==1){
          robot.raiseLift();
        } else {
          robot.lowerLift();
        }
        break;
      case 6: // Send Lift
        toSend=robot.isLiftUp();
        robot.commitToRadio(radio,5,toSend);
        break;
      case 7: // Set Red LED
        break;
      case 8: // Read Red LED
        robot.commitToRadio(radio,7,redLED);
        break;
      case 9: // Set Yellow LED
        break;
      case 10:
        robot.commitToRadio(radio,9,yellowLED);
        break;
      case 11: // Set Green LED
        break;
      case 12: // Read green LED
        robot.commitToRadio(radio,11,greenLED);
        break;
      case 13: // Set Manual Control
        if(value==1){
          manual=1;
          robot.setGreenLED(0);
          greenLED=0;
          robot.setYellowLED(-1);
          yellowLED=1;
          stateSave=state;
          state=STATE_SETUP;
          IROverrideSave=IR_Override;
          IR_Override=0;
        } else {
          manual=0;
          robot.setGreenLED(-1);
          greenLED=1;
          robot.setYellowLED(0);
          yellowLED=0;
          state=stateSave;
          IR_Override=IROverrideSave;
        }
        break;
      case 14: // Read Manual Control
        robot.commitToRadio(radio,13,manual);
        break;
      case 15: // Set State
        state=value;
        break;
      case 16: // Read State 
        robot.commitToRadio(radio,15,state);
        break;
      case 17: // SET IR Angle
        IRCount=value/10;
      case 18: // Read IR Angle
        robot.commitToRadio(radio,17,IRCount*10);
        break;
      case 19: // Set Front Ultra
      case 20: // Read Front Ultra
        robot.commitToRadio(radio,19,robot.readFrontUltra());
        break;
      case 21: // Set Side Ultra
      case 22: // Read Side Ultra
        robot.commitToRadio(radio,21,robot.readSideUltra());
        break;
      case 23: // SET ACCL X
      case 24: // Read Accl X
        robot.commitToRadio(radio,23,robot.readAcclX());
        break;
      case 25: // set Accl Y 
      case 26: // Read Accl Y
        robot.commitToRadio(radio,25,robot.readAcclY());
        break;
      case 27: // Set Accl Z
      case 28: // Read Accl Z
        robot.commitToRadio(radio,27,robot.readAcclZ());
        break;
      case 29: // Set Switch 1
      case 30: // Read Switch 1
        robot.commitToRadio(radio,29,robot.readSwitch(1));
        break;
      case 31: // Set Switch 2
      case 32: // Read Switch 2
        robot.commitToRadio(radio,31,robot.readSwitch(2));
        break;
      case 33: // Set Switch 3
      case 34: // Read Switch 3
        robot.commitToRadio(radio,33,robot.readSwitch(3));
        break;
      case 35: // Set Switch 4
      case 36: // Read Switch 4
        robot.commitToRadio(radio,35,robot.readSwitch(4));
        break;
      case 37: // Set Button
      case 38: // Read Button
        robot.commitToRadio(radio,37,robot.isButtonPressed());
        break;
      case 39: // Set Lift Top Switch
      case 40: // Read Lift Top Switch
        robot.commitToRadio(radio,39,robot.isLiftUp());
        break;
      case 41: // Set Lift Bot Switch
      case 42: // Read Lift Bot Switch
        robot.commitToRadio(radio,41,robot.isLiftDown());
        break;
      case 43: // Set Drive Bridge Power
      case 44: // Read Bridge Drive Power
        robot.commitToRadio(radio,43,robot.isDrivePowered());
        break;
      case 45: // Set Lift Powered
      case 46: // Read lift Powered
        robot.commitToRadio(radio,45,robot.isLiftPowered());
        break;
      case 47: // Set IR Reading
      case 48: // Read IR Sensor
        for(int i=0;i<19;i++){
          toSend=0;
          toSend=(i*10)<<8;
          toSend=toSend|IRVals[i];
          robot.commitToRadio(radio,47,toSend);
        }
        break;  
        default: // NO-OP
          break;
    }
  }
  yield();
}

// Loop to sweep with the Servo and IR sensor to get a 
// Dynamic look at the objects in front of the bot
void IRLoop(){
  if(IR_Override==0){
    robot.setIRAngle(IRAngle[IRCount]);
    delay(100);
    IRVals[IRCount]=robot.readIR();
    if(IRDir==0){
      IRCount=IRCount+1;
      if(IRCount==18)
        IRDir=1;
    } else {
      IRCount=IRCount-1;
      if(IRCount==0)
        IRDir=0;
    }
  }
  
  yield();
}

// Simple ISR to set a flag and start the main control loop
void buttonISR(){
  ButtonPressed=robot.isButtonPressed();
}

