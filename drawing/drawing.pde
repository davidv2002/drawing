// global variables
color ink, black, red, green, blue, exitButtonXColor, quitButtonRed;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
Boolean draw, drawTest, quitButtonTest;
int colorNumber, brushSizeNumber;
String title;
PFont quitButtonFont;
color[] colors = new color[4];
float[] brushSizes = new float[4];

void setup() {
  size(1280, 720);
  population();
  quitButtonRect();
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
}

void draw() {
  populationDraw();
  quitButtonDraw();
  if (draw == true && drawTest == true) {
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
  drawLatch();
}

void mouseReleased() {
  //draw = false;
}

void keyPressed() {
  cycling();
}
