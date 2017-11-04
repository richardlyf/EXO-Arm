// reads analog input from the five inputs from your arduino board 
// and sends it out via serial

// variables for input pins and
int analogInput[6];
  
// variable to store the value 
int value[6]; 
int val = 0;

void setup()
{
  // declaration of pin modes
  for(int i=0;i<6;i++)
  {
    analogInput[i] = i+1;
    value[i] = 0;     
    pinMode(analogInput[i], INPUT);  
      
  }
  
  // begin sending over serial port
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
     getMuscle();
     Serial.println(value[2]);
   } 
  }
  delay(10);
}


int getMuscle()
{

    value[2] = analogRead(analogInput[2]);

    return value[2];

}


