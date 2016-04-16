#include <Scheduler.h>
#include "Robot.h"
#include "Defs.h"
#include "RF24.h"


Robot robot;
RF24 radio(RF_RADIO_PIN_0,RF_RADIO_PIN_1);

#define STATE_SETUP 0
#define STATE_DRIVING 1
#define STATE_LOCATING 2
#define STATE_PICKUP 3
#define STATE_REVERSE 4
#define STATE_TURNING 5
#define STATE_DROPOFF 6
#define STATE_RETURN 7
#define STATE_DONE 8

#define ERR_DRIVE 1 // 1
#define ERR_LIFT 1<<1 // 2
#define ERR_ACCL 1<<2 // 3
#define ERR_ULTRA_FRONT 1<<3 // 4
#define ERR_ULTRA_SIDE 1<<4 // 5
#define ERR_IR 1<<5 // 6

byte state=STATE_SETUP;
byte IRVals[37];
byte IRAngle=0;
byte IRDir=0;
volatile byte ButtonPressed=0;
int leftDrive,rightDrive;
byte redLED=0,yellowLED=0,greenLED=0;
byte manual=0;
byte liftMot=0;

void setup() {
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
}

void loop() {
 yield();
}

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
        toSend=0;
        if(leftDrive<0){
          toSend=256;
          toSend=toSend|(leftDrive%0x000000FF);
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
        toSend=0;
        if(leftDrive<0){
          toSend=256;
          toSend=toSend|(rightDrive%0x000000FF);
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
        } else {
          manual=0;
          robot.setGreenLED(-1);
          greenLED=1;
          robot.setYellowLED(0);
          yellowLED=0;
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
        IRAngle=value;
        break;
      case 18: // Read IR Angle
        robot.commitToRadio(radio,17,IRAngle);
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
        for(int i=0;i<37;i++){
          toSend=0;
          toSend=(i*5)<<8;
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

void IRLoop(){
  robot.setIRAngle(IRAngle);
  delay(100);
  IRVals[IRAngle/5]=robot.readIR();
  if(IRDir==0){
    IRAngle=IRAngle+5;
    if(IRAngle==185){
      IRAngle=175;
      IRDir=1;
    }
  } else {
    IRAngle=IRAngle-5;
    if(IRAngle==0){
      IRAngle=0;
      IRDir=0;
    }
  }
  yield();
}

void buttonISR(){
  ButtonPressed=robot.isButtonPressed();
}

