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

void tests() {
  // drawing test
  drawTest = (pmouseY < drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (pmouseX > heightOffset*8 && pmouseY > drawingSurfaceHeight);
  fillTest = (pmouseX > heightOffset*4 && pmouseX < heightOffset*5 && pmouseY > drawingSurfaceHeight);
  resetTest = (pmouseX > heightOffset*7 && pmouseX < heightOffset*8 && pmouseY > drawingSurfaceHeight);
  pageTest = (pmouseX > heightOffset*6 && pmouseX < heightOffset*7 && pmouseY > drawingSurfaceHeight);
  upTest = (pmouseX > heightOffset && pmouseX < heightOffset+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  downTest = (pmouseX > heightOffset && pmouseX < heightOffset+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  rightTest = (pmouseX > heightOffset*2.5 && pmouseX < heightOffset*2.5+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  leftTest = (pmouseX > heightOffset*2.5 && pmouseX < heightOffset*2.5+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  pageUpTest = (pmouseX > heightOffset*3 && pmouseX < heightOffset*3+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  pageDownTest = (pmouseX > heightOffset*3 && pmouseX < heightOffset*3+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  penTest = (pmouseX > heightOffset*3.5 && pmouseX < heightOffset*3.5+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  eraserTest = (pmouseX > heightOffset*3.5 && pmouseX < heightOffset*3.5+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
}

void intalStates() {
  ink = colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
  draw = false;
  backgroundColor = white;
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
}
