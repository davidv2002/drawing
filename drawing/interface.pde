void drawInterface() {
  // color
  fill(ink);
  square(0, drawingSurfaceHeight, heightOffset);
  fill(255);
  square(heightOffset, drawingSurfaceHeight, (heightOffset)/2);
  square(heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // shape and size
  square((heightOffset)*1.5, drawingSurfaceHeight, heightOffset);
  interfaceShape();
  square((heightOffset)*2.5, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*2.5, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  update = false;
}

void interfaceShape() {
  switch(shape) {
  case 0:
    fill(0);
    circle((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    fill(255);
    break;
  case 1:
    rectMode(CENTER);
    fill(0);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  case 2:
    for ( int i= 0; i < 50; i++) {
      float X = ( randomGaussian() * (drawingDiameter/1.5)) + (heightOffset)*2;
      float Y = ( randomGaussian() * (drawingDiameter/1.5)) + (drawingSurfaceHeight+height)/2;
      fill(0);
      noStroke();
      circle(X, Y, 3);
      stroke(0);
      fill(255);
    }
    break;
  }
}
