// global variables
color ink, black;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
Boolean draw;

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
    ellipse(mouseX, mouseY, drawingDiameter, drawingDiameter);
  } else {
    draw = false;
  }
}

void mousePressed() {
  quitButtonMouseClicked();
  if ( mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight) {
    draw = true;
  }
  ink = black;
  drawingDiameter = width*1/100;
}

void mouseReleased() {
  draw = false;
}
