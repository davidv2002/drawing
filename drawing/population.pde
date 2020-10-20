void population() {
  // fonts
  buttonFont = createFont ("Microsoft Sans Serif", 55);
  // floats
  drawingSurfaceStart = 0;
  drawingSurfaceHeight = height*4/5;
  heightOffset = height-drawingSurfaceHeight;
  halfOffset = heightOffset/2;
  // arrays
  // colors
  colors[0] = black = #000000;
  colors[1] = red = #ED2626;
  colors[2] = green = #15D113;
  colors[3] = blue = #4C47F2;
  colors[4] = white = #FFFFFF;
  // sizes
  brushSizes[0] = width*1/150;
  brushSizes[1] = width*1/125;
  brushSizes[2] = width*1/100;
  brushSizes[3] = width*1/75;
  brushSizes[4] = width*1/50;
  brushSizes[5] = width*1/25;
  // ints
  shapeCount = 2;
  // intal states
  ink = colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
  draw = false;
  backgroundColor = white;
}

void tests() {
  // drawing test
  drawTest = (pmouseY < drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (pmouseX > width-heightOffset && pmouseY > drawingSurfaceHeight);
  clearTest = (pmouseX > width-heightOffset*2 && pmouseX < width-heightOffset && pmouseY > drawingSurfaceHeight);
  upTest = (pmouseX > heightOffset && pmouseX < heightOffset+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  downTest = (pmouseX > heightOffset && pmouseX < heightOffset+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  rightTest = (pmouseX > heightOffset*2.5 && pmouseX < heightOffset*2.5+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  leftTest = (pmouseX > heightOffset*2.5 && pmouseX < heightOffset*2.5+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  pageUpTest = (pmouseX > heightOffset*3 && pmouseX < heightOffset*3+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  pageDownTest = (pmouseX > heightOffset*3 && pmouseX < heightOffset*3+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  penTest = (pmouseX > heightOffset*3.5 && pmouseX < heightOffset*3.5+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  eraserTest = (pmouseX > heightOffset*3.5 && pmouseX < heightOffset*3.5+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
}
