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
  brushSizes[0] = width*1/200;
  brushSizes[1] = width*1/175;
  brushSizes[2] = width*1/150;
  brushSizes[3] = width*1/125;
  brushSizes[4] = width*1/100;
  brushSizes[5] = width*1/75;
  brushSizes[6] = width*1/50;
  brushSizes[7] = width*1/25;
  // ints
  shapeCount = 2;
  // pics
  pic = loadImage("carriage.png");
  // intal states
  intalStates();
}
