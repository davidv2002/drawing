void population() {
  // fonts
  buttonFont = createFont ("Microsoft Sans Serif", 55);
  // floats
  drawingSurfaceStart = 0;
  drawingSurfaceHeight = height*4/5;
  heightOffset = height-drawingSurfaceHeight;
  // arrays
  // colors
  colors[0] = black = #000000;
  colors[1] = red = #ED2626;
  colors[2] = green = #15D113;
  colors[3] = blue = #4C47F2;
  colors[4] = white = #FFFFFF;
  // sizes
  brushSizes[0] = width*1/150;
  brushSizes[1] = width*1/100;
  brushSizes[2] = width*1/75;
  brushSizes[3] = width*1/50;
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
  drawTest = (mouseX>drawingSurfaceStart && mouseX<drawingSurfaceStart+width && mouseY>drawingSurfaceStart && mouseY<drawingSurfaceStart+drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (mouseX >= width-heightOffset && mouseX <= width && mouseY >= drawingSurfaceHeight && mouseY <= height);
  upTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  downTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  rightTest = (mouseX>(heightOffset)*2.5 && mouseX<(heightOffset)*2.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  leftTest = (mouseX>(heightOffset)*2.5 && mouseX<(heightOffset)*2.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  pageUpTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  pageDownTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  penTest = (mouseX>(heightOffset)*3.5 && mouseX<(heightOffset)*3.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  eraserTest = (mouseX>(heightOffset)*3.5 && mouseX<(heightOffset)*3.5+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
}
