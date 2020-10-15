// global variables
color ink, black, red, green, blue;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
Boolean draw;
color[] colors = new color[4];
int colorNumber;

void setup() {
  size(1280, 720);
  population();
  quitButtonRect();
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
}

void draw() {
  quitButtonDraw();
  if (draw == true && mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight) {
    fill(ink);
    noStroke();
    ellipse(mouseX, mouseY, drawingDiameter, drawingDiameter);
    stroke(black);
  } else {
    draw = false;
  }
}

void mousePressed() {
  quitButtonMouseClicked();
  if (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight) {
    draw = true;
  }
  drawingDiameter = width*1/100;
}

void mouseReleased() {
  draw = false;
}
void keyPressed() {
  if (key == CODED) {
  if (keyCode == UP) {
      cycleUp();
    } else if (keyCode == DOWN) {
      cycleDown();
    } 
  }
}
