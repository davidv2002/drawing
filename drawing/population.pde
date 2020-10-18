void population() {
  // fonts
  quitButtonFont = createFont ("Microsoft Sans Serif", 55);
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
  // booleans
  draw = false;
  // strings
  title = "X";
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
  // intal state
  ink =  colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
}

void populationDraw() {
  drawTest = (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight);
  quitButtonTest = (mouseX >= width*19/20 && mouseX <= width && mouseY >= 0 && mouseY <= height*1/20);
  upTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  downTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  leftTest = (mouseX>(heightOffset)*2.5 && mouseX<(heightOffset)*2.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  rightTest = (mouseX>(heightOffset)*2.5 && mouseX<(heightOffset)*2.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
}
