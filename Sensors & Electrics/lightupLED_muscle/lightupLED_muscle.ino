// reads analog input from the five inputs from your arduino board 
// and sends it out via serial

// variables for input pins and
int analogInput[6];
  
// variable to store the value 
int value[6]; 
int led = 13;
int counter = 0;

void setup()
{
  // declaration of pin modes
  for(int i=0;i<6;i++)
  {
    analogInput[i] = i+1;
    value[i] = 0;     
    pinMode(analogInput[i], INPUT);  
    pinMode(led, OUTPUT);  
  }
  
  // begin sending over serial port
  Serial.begin(9600);
}

void loop()
{

    value[1] = analogRead(analogInput[1]);

    Serial.println(value[1]);
    
    if(value[1]> 600){
    digitalWrite(led,HIGH);  
    counter = 1;  
    }
    
    else{
      if (counter == 0){
     digitalWrite(led,LOW); 
      }
      
    }
    
    if (counter == 1 ){
       if(value[1]<150){
        counter = 0;
       } 
    }

  delay(10);
}


