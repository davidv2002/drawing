// global variables
color ink, black, red, green, blue, white, backgroundColor;
float drawingSurfaceStart, drawingSurfaceHeight, drawingDiameter, heightOffset, halfOffset;
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest, pageUpTest, pageDownTest, penTest, eraserTest, fillTest, pageTest, update, resetTest;
int colorNumber, brushSizeNumber, shape, shapeCount;
PFont buttonFont;
color[] colors = new color[5];
float[] brushSizes = new float[8];
PImage pic;

void setup() {
  size(1024, 768);
  population();
  tests();
}

void draw() {
  tests();
  if (draw && drawTest) {
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
  tests();
  if (drawTest) {
    draw = true;
    return;
  }
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
