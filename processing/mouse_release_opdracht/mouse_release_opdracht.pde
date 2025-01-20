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
    
    
    
    }
  
  void draw(){
    background(100, 100, 100);
    fill(200, 100, 0);
    rect(mouseX, mouseY, 100, 100);
     if (mousePressed == false){
       fill(200, 100, 0);
    rect(mouseX, mouseY, 100, 100);
    if (mousePressed == true){
    }
     }
  }
  
