// global variables
color ink, black, red, green, blue, exitButtonXColor, quitButtonRed;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
Boolean draw, drawTest, quitButtonTest;
int colorNumber, brushSizeNumber, shape;
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
  drawInterface();
  if (draw == true && drawTest == true) {
    switch(shape){
      case 0:
      dot();
      break;
      case 1:
      square();
      break;
    }
  } else {
    draw = false;
  }
}

void mousePressed() {
  quitButtonMouseClicked();
  //drawLatch();
  if (drawTest == true) {
    draw = true;
  }
}

void mouseReleased() {
  draw = false;
}

void keyPressed() {
  if (key == CODED) {
    cycling();
  } else {
  }
}
