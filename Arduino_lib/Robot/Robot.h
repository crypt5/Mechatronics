#ifndef _ROBOT_H_
#define _ROBOT_H_

#include "Arduino.h"
#include "Servo.h"
#include "RF24.h"
#include "Defs.h"

class Robot
{
public:
	Robot();

	// Sensor Functions
	float readSideUltra();
	float readFrontUltra();
	float readIR();

	// Read switches
	int isLiftUp();
	int isLiftDown();
	int isButtonPressed();
	int isDrivePowered();
	int isLiftPowered();
	int readSwitch(int num);

	// LED Functions
	void setRedLED(int times);
	void setYellowLED(int times);
	void setGreenLED(int times);

	// Accelerameter
	int readAcclX();
	int readAcclY();
	int readAcclZ();

	// Drive Wheels
	void setLeftDrive(int speed);
	void setRightDrive(int speed);
	
	// Lift functions
	void raiseLift(); 
	void lowerLift(); 

	// IR Sensor Motor control
	void setIRAngle(int angle);

	// Radio Functions
	void setUpRadio(RF24 radio);
	void commitToRadio(RF24 radio,byte type, int data);
	int isCommandAvailable(RF24 radio);
	int getNextCommandType();
	int getNextCommandValue();

private:	
	void pulse(int pin, int wait, int times);
	float readUltra(int trig, int ping);
	Servo servo;
	int inputBuffer[8];
	int outputBuffer[8];
	byte inputPos;
	byte haveCommands;
	byte addresses[2][6]={"MOSI1","MISO1"};
};

#endif