// global variables
color ink, black, red, green, blue;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
Boolean draw;
color[] colors = new color[4];
float[] brushSizes = new float[4];
int colorNumber, brushSizeNumber;

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
  if (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight && draw == false) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

void mouseReleased() {
  //draw = false;
}
void keyPressed() {
  cycling();
}
