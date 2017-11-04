#include <dht.h>

dht DHT;

#define DHT22_PIN 2

float Temp; 
int val = 0;

void setup() 
{
  Serial.begin(9600);
  Serial.println('a');
  char a = 'b';
  while (a != 'a')
  {
    a = Serial.read();
  }
}

void loop() 
{
  while (Serial.available() == 0)
  {
  }
  
  if (Serial.available() > 0)
  {
   val = Serial.read();
   if (val == 'R')
   {
     getTemperature();
     Serial.println(Temp);
   } 
  }
  delay(20);
}

/////////////////////////////////////////////////////////////////////////
int getTemperature()
{
  int chk = DHT.read22(DHT22_PIN);
  
  Temp = DHT.temperature; 
  return Temp;
}
