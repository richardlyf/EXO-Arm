#include <Mindwave.h>                   //import the library
Mindwave mindwave;                      //start using it

void setup() {
  Serial.begin(MINDWAVE_BAUDRATE);      //setup serial communication (MindWave mobile is set to 57600 baud rate)
}
//create a function to received new values as soon as they're avaialble
void onMindwaveData(){
  Serial.print("attention: ");
  Serial.println(mindwave.attention()); //access attention value
}
void loop() {
  mindwave.update(Serial,onMindwaveData);//update using the data input(Serial in this case) and the function to call when data is ready
}
