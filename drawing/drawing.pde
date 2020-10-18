// global variables
color ink, black, red, green, blue, exitButtonXColor, quitButtonRed;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter, heightOffset;
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest, pageUpTest, pageDownTest, update;
int colorNumber, brushSizeNumber, shape, shapeCount;
String title;
PFont buttonFont;
color[] colors = new color[4];
float[] brushSizes = new float[4];

void setup() {
  size(1280, 720);
  //fullScreen();
  population();
  quitButtonRect();
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
}

void draw() {
  tests();
  drawQuitButton();
  drawInterface();
  if (draw == true && drawTest == true) {
    switch(shape) {
    case 0:
      dot();
      break;
    case 1:
      square();
      break;
    case 2:
      airBrush();
      break;
    }
  } else {
    draw = false;
  }
}

void mousePressed() {
  quitButtonMouseClicked();
  interfaceClicked();
  drawLatch();
}

void mouseReleased() {
  draw = false;
}

void keyPressed() {
  if (key == CODED) {
    cycling();
  }
}
