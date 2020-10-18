void population() {
  // fonts
  buttonFont = createFont ("Microsoft Sans Serif", 55);
  // floats
  drawingSurfaceX = 0;
  drawingSurfaceY = 0;
  drawingSurfaceWidth = width;
  drawingSurfaceHeight = height*4/5;
  heightOffset = height-drawingSurfaceHeight;
  // colors
  exitButtonXColor = #9B5454;
  quitButtonRed = red = #ED2626;
  black = #000000;
  green = #15D113;
  blue = #4C47F2;
  // arrays
  // colors
  colors[0] = black;
  colors[1] = red;
  colors[2] = green;
  colors[3] = blue;
  // sizes
  brushSizes[0] = width*1/150;
  brushSizes[1] = width*1/100;
  brushSizes[2] = width*1/75;
  brushSizes[3] = width*1/50;
  // ints
  shapeCount = 2;
  // intal states
  ink =  colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
  draw = false;
}

void tests() {
  // drawing test
  drawTest = (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (mouseX >= width*19/20 && mouseX <= width && mouseY >= 0 && mouseY <= height*1/20);
  upTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  downTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  rightTest = (mouseX>(heightOffset)*2.5 && mouseX<(heightOffset)*2.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  leftTest = (mouseX>(heightOffset)*2.5 && mouseX<(heightOffset)*2.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  pageUpTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  pageDownTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
}
