void mousePressed() {
  println("Mouse Pressed At");
  println(mouseX);
  println(mouseY);
}

  void mouseReleased() {
    println("Mouse Released");
    println(mouseX);
    println(mouseY);
  }
  
  void setup(){
    background(100, 100, 100);
    size(1000,1000);
    background(100, 100, 100);
    
  }
  
  void draw(){
    background(100, 100, 100);
    fill(0, 255, 0);
    rect(0, 660, 300, 1000);
    fill(0, 0, 0);
    rect(300, 800, 800, 900);
    fill(0, 0, 0);
    rect(430, 550,450, 110);
    fill(0, 0, 0);
    rect(0, 150, 600, 510);
    fill(0, 0, 0);
    rect(750, 0, 400, 400);
    fill(0, 255, 0);
    rect(mouseX, mouseY, 100, 100);
     if (mousePressed == false){
       fill(255, 0, 0);
    rect(mouseX, mouseY, 100, 100);
    if (mousePressed == true){
    }
     }
  }
  
