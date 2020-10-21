void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

void basicPen() {
  ink = colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
}

void eraser() {
  ink = backgroundColor;
  drawingDiameter = brushSizes[brushSizes.length-1];
  shape = 0;
  update = true;
}

void clearDraw() {
  backgroundColor = ink;
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
};

void coloringPage() {
  ink = white;
  clearDraw();
  ink = black;
  image(pic, drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
};
