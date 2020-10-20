// global variables
color ink, black, red, green, blue, white, backgroundColor;
float drawingSurfaceStart, drawingSurfaceHeight, drawingDiameter, heightOffset, halfOffset;
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest, pageUpTest, pageDownTest, penTest, eraserTest, clearTest, update;
int colorNumber, brushSizeNumber, shape, shapeCount;
PFont buttonFont;
color[] colors = new color[5];
float[] brushSizes = new float[6];

void setup() {
  orientation(LANDSCAPE);
  size(1280, 720);
  //fullScreen();
  population();
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
}

void draw() {
  tests();
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
  drawInterface();
}

void mousePressed() {
  drawLatch();
  interfaceClicked();
}

void mouseReleased() {
  draw = false;
}

void keyPressed() {
  if (key == CODED) {
    cycling();
  }
}
