// reads analog input from the five inputs from your arduino board 
// and sends it out via serial



void setup()
{
 
    pinMode(5, OUTPUT);  
  }



void loop()
{

   
     digitalWrite(5,LOW); 
     delay(2000);
     digitalWrite(5,HIGH); 
     delay(2000);
}


