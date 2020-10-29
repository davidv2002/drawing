void basicPen() {
  ink = colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
}

void eraser() {
  ink = backgroundColor;
  drawingDiameter = brushSizes[brushSizes.length-1];
  shape = 0;
}

void clearDraw() {
  backgroundColor = ink;
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
}

void coloringPage() {
  ink = white;
  clearDraw();
  basicPen();
  image(pic, drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
}
