int x = 50;
int y = 50;
int speed1 = 6;
int speed2 = 6;
 
void setup(){
size(700, 900);
}
 
void draw(){
  background(255);
  ellipse(x, y, 20, 20);
  x+= speed1;
  y+= speed2;
  if(x >700){
    speed1 = speed1 - 6;}
    if(y > 900){
   speed2 = speed2 - 6;}
    if(y < 0 ){
      speed2 = speed2 + 6;}
      if(x < 0 ){
      speed1 = speed1 + 6;}
}
