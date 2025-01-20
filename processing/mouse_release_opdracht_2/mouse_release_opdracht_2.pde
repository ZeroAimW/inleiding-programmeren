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

float X = 500;
float Y = 500;

void setup() {
  background(100, 100, 100);
  size(1000, 1000);
}

void draw() {
  background(100, 100, 100);
  fill(200, 100, 0);

  if (mousePressed == true) {
    fill(200, 100, 200);
    //rect(mouseX, mouseY, 100, 100);
    X = mouseX;
    Y = mouseY;
    if (mousePressed == false) {
    }
  }
    rect(X, Y, 100, 100);
}
