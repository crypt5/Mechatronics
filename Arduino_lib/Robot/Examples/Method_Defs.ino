  //Init
  Robot();

  // Sensor Functions (return value in cm)
  int readSideUltra();
  int readFrontUltra();
  int readIR();

  // Read switches (return 0 or 1)
  int isLiftUp();
  int isLiftDown();
  int isButtonPressed();
  int isDrivePowered();
  int isLiftPowered();
  int readSwitch(int num);

  // LED Functions (-1 in ON, 0 is OFF, anything else is flashing)
  void setRedLED(int times);
  void setYellowLED(int times);
  void setGreenLED(int times);

  // Accelerameter (returns 0-4096)
  int readAcclX();
  int readAcclY();
  int readAcclZ();

  // Drive Wheels (- is backward, 0 is off, + is forward)
  void setLeftDrive(int speed);
  void setRightDrive(int speed);
  
  // Lift functions
  void raiseLift(); 
  void lowerLift(); 

  // IR Sensor Motor control (0-180 degrees)
  void setIRAngle(int angle);

  // Radio Functions
  void setUpRadio(RF24 radio);
  void commitToRadio(RF24 radio,byte type, int data);
  int isCommandAvailable(RF24 radio);
  int getNextCommandType();
  int getNextCommandValue();


