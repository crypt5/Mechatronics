#include "Robot.h"
#include "Defs.h"
#include "RF24.h"


Robot::Robot()
{
	inputPos=0;
	haveCommands=0;

	outputBuffer[0]=0;
outputBuffer[1]=0;
outputBuffer[2]=0;
outputBuffer[3]=0;
outputBuffer[4]=0;
outputBuffer[5]=0;
outputBuffer[6]=0;
outputBuffer[7]=0;
	

	pinMode(LEFT_DRIVE_0,OUTPUT);
	pinMode(LEFT_DRIVE_1,OUTPUT);
	pinMode(RIGHT_DRIVE_0,OUTPUT);
	pinMode(RIGHT_DRIVE_1,OUTPUT);
	pinMode(FORK_LIFT_0,OUTPUT);
	pinMode(FORK_LIFT_1,OUTPUT);
	pinMode(ACCL_X,INPUT);
	pinMode(ACCL_Y,INPUT);
	pinMode(ACCL_Z,INPUT);
	pinMode(SWITCH_BANK_1,INPUT);
	pinMode(SWITCH_BANK_2,INPUT);
	pinMode(SWITCH_BANK_3,INPUT);
	pinMode(SWITCH_BANK_4,INPUT);
	pinMode(BUTTON,INPUT);
	pinMode(DRIVE_MOT_POWER,INPUT);
	pinMode(LIFT_MOT_POWER,INPUT);
	pinMode(RED_LED,OUTPUT);
	pinMode(YELLOW_LED,OUTPUT);
	pinMode(GREEN_LED,OUTPUT);
	pinMode(LIFT_TOP_SENSOR,INPUT);
	pinMode(LIFT_BOT_SENSOR,INPUT);
	pinMode(IR_SENSOR_MOTOR,OUTPUT);
	pinMode(FRONT_ULTRA_TRIG,OUTPUT);
	pinMode(FRONT_ULTRA_PING,INPUT);
	pinMode(SIDE_ULTRA_TRIG,OUTPUT);
	pinMode(SIDE_ULTRA_PING,INPUT);
	pinMode(IR_SENSOR_PING,INPUT);

	digitalWrite(LEFT_DRIVE_0,LOW);
	digitalWrite(LEFT_DRIVE_1,LOW);
	digitalWrite(RIGHT_DRIVE_0,LOW);
	digitalWrite(RIGHT_DRIVE_1,LOW);
	digitalWrite(FORK_LIFT_0,LOW);
	digitalWrite(FORK_LIFT_1,LOW);
	digitalWrite(RED_LED,LOW);
	digitalWrite(YELLOW_LED,LOW);
	digitalWrite(GREEN_LED,LOW);
	digitalWrite(FRONT_ULTRA_TRIG,LOW);
	digitalWrite(SIDE_ULTRA_TRIG,LOW);

	analogReadResolution(12);
	servo.attach(IR_SENSOR_MOTOR);
	


}

int Robot::readUltra(int trig, int ping)
{
long duration;
digitalWrite(trig, LOW);
delayMicroseconds(2); 
digitalWrite(trig, HIGH);
delayMicroseconds(10); 
digitalWrite(trig, LOW);
duration = pulseIn(ping, HIGH);
  	return duration/58.2;
}

int Robot::readSideUltra()
{
	return readUltra(SIDE_ULTRA_TRIG,SIDE_ULTRA_PING);
}

int Robot::readFrontUltra()
{
	return readUltra(FRONT_ULTRA_TRIG,FRONT_ULTRA_PING);
}

int Robot::readIR()
{
	
	float val=analogRead(IR_SENSOR_PING);
val=val+analogRead(IR_SENSOR_PING);
val=val+analogRead(IR_SENSOR_PING);
val=val+analogRead(IR_SENSOR_PING);
val=val+analogRead(IR_SENSOR_PING);
val=val/5;
	val=map(val,0,4096,0,5000);
	return (int)(61.573 * pow(val/1000.0, -1.16));
}

int Robot::isLiftUp()
{
	if(digitalRead(LIFT_TOP_SENSOR)==1)
		return 1;
	else 
		return 0;
}

int Robot::isLiftDown()
{
	if(digitalRead(LIFT_BOT_SENSOR)==1)
		return 1;
	else 
		return 0;
}

void Robot::raiseLift()
{
	while(isLiftUp()==0)
	{
		analogWrite(FORK_LIFT_0,120);
		analogWrite(FORK_LIFT_1,0);
	}
	digitalWrite(FORK_LIFT_0,0);
	digitalWrite(FORK_LIFT_1,0);
}

void Robot::lowerLift()
{
	while(isLiftDown()==0)
	{
		analogWrite(FORK_LIFT_0,0);
		analogWrite(FORK_LIFT_1,60);
	}
	digitalWrite(FORK_LIFT_0,0);
	digitalWrite(FORK_LIFT_1,0);
}


int Robot::isButtonPressed()
{
	if(digitalRead(BUTTON)==1)
		return 1;
	else
		return 0;
}

int Robot::isDrivePowered()
{
	if(digitalRead(DRIVE_MOT_POWER)==1)
		return 1;
	else
		return 0;
}

int Robot::isLiftPowered()
{
	if(digitalRead(LIFT_MOT_POWER)==1)
		return 1;
	else
		return 0;
}

int Robot::readSwitch(int num)
{
switch(num){
	case 1:
		return digitalRead(SWITCH_BANK_1);
	case 2:
		return digitalRead(SWITCH_BANK_2);
	case 3:
		return digitalRead(SWITCH_BANK_3);
	case 4:
		return digitalRead(SWITCH_BANK_4);
	default:
		return -1;	
}
}

void Robot::pulse(int pin,int wait,int times)
{
	if(times<0){
		digitalWrite(pin,HIGH);
		return;
	} else if(times==0) {
		digitalWrite(pin,LOW);
		return;
 	}
	int i=0;
	for(i=0;i<times;i++){
		digitalWrite(pin,HIGH);
		delay(wait);
		digitalWrite(pin,LOW);
		delay(wait);
	}
}

void Robot::setRedLED(int times)
{
	pulse(RED_LED,200,times);
}

void Robot::setYellowLED(int times)
{
	pulse(YELLOW_LED,200,times);
}

void Robot::setGreenLED(int times)
{
	pulse(GREEN_LED,200,times);
}

int Robot::readAcclX()
{
	return analogRead(ACCL_X);
}

int Robot::readAcclY()
{
	return analogRead(ACCL_Y);
}

int Robot::readAcclZ()
{
	return analogRead(ACCL_Z);
}

void Robot::setLeftDrive(int speed)
{
	if(speed>0){
		analogWrite(LEFT_DRIVE_0,0);
		analogWrite(LEFT_DRIVE_1,speed);
 	} else if(speed<0) {
		analogWrite(LEFT_DRIVE_0,speed*-1);
		analogWrite(LEFT_DRIVE_1,0);
	} else {
		analogWrite(LEFT_DRIVE_0,0);
		analogWrite(LEFT_DRIVE_1,0);
	}
}

void Robot::setRightDrive(int speed)
{
	if(speed>0){
		analogWrite(RIGHT_DRIVE_0,speed);
		analogWrite(RIGHT_DRIVE_1,0);
 	} else if(speed<0) {
		analogWrite(RIGHT_DRIVE_0,0);
		analogWrite(RIGHT_DRIVE_1,speed*-1);
	} else {
		analogWrite(RIGHT_DRIVE_0,0);
		analogWrite(RIGHT_DRIVE_1,0);
	}
}

void Robot::setIRAngle(int angle)
{
	servo.write(angle);
}

void Robot::setUpRadio(RF24 radio)
{
	radio.begin();
	radio.openReadingPipe(1,addresses[0]);
	radio.openWritingPipe(addresses[1]);
	radio.startListening();
}

void Robot::commitToRadio(RF24 radio,byte type, int data)
{
	data=data&0x00FFFFFF;
	data=data|(type<<24);
	inputBuffer[inputPos]=data;
	inputPos++;
	if(inputPos==8){
		radio.stopListening();
		radio.write(inputBuffer,32);
		radio.startListening();
		inputPos=0;
	}
}

int Robot::isCommandAvailable(RF24 radio)
{
	if(haveCommands==0){
		if(radio.available()){
			radio.read(outputBuffer,32);
			haveCommands=8;
		} 
		return haveCommands;
	} else {
		return haveCommands;
	}
}

int Robot::getNextCommandType()
{
	int val=outputBuffer[haveCommands-1];
	return ((val&0xFF000000)>>24);
}

int Robot::getNextCommandValue()
{
	int val=outputBuffer[haveCommands-1];
	val=(val&0x00FFFFFF);
	outputBuffer[haveCommands-1]=0;
	haveCommands--;
	return val;
}