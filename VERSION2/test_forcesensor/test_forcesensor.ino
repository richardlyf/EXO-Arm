int f_up = A1;
int f_down = A2;

void setup() {
  pinMode(f_up, INPUT);
  pinMode(f_down, INPUT);
  Serial.begin(9600);
}

void loop() {
  int r_up = analogRead(f_up);
  int r_down = analogRead(f_down);
  Serial.print(r_up);
  Serial.print("   ");
  Serial.println(r_down);
  delay(50);
}
