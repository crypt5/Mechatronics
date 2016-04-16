#include "RF24.h"

RF24 radio(7,8);
byte addresses[2][6]={"MOSI1","MISO1"};
byte buffer[32];

void setup() {
  Serial.begin(115200);//Communication with Computer
  
  radio.begin(); // Communication with Robot
  radio.openReadingPipe(1,addresses[1]);
  radio.openWritingPipe(addresses[0]);
  radio.startListening();
}

void loop() {
  if(Serial.available()>0){
    Serial.readBytes(buffer,32);
    radio.stopListening();
    radio.write(buffer,32);
    radio.startListening();
  }
  if(radio.available()){
    radio.read(buffer,32);
    Serial.write(buffer,32);
  }
}
