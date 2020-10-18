void drawInterface() {
  // color
  fill(ink);
  square(0, drawingSurfaceHeight, heightOffset);
  fill(white);
  // color buttons
  square(heightOffset, drawingSurfaceHeight, (heightOffset)/2);
  square(heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // shape and size
  if (update == true) {
    square((heightOffset)*1.5, drawingSurfaceHeight, heightOffset);
    fill(black);
    interfaceShape();
    fill(white);
  }
  // shape buttons
  square((heightOffset)*2.5, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*2.5, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // size buttons
  square((heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // text on buttons
  interfaceText();
  update = false;
}

void interfaceShape() {
  switch(shape) {
  case 0:
    // dot
    circle((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    break;
  case 1:
    // square
    rectMode(CENTER);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    break;
  case 2:
    // airbrush
    for ( int i= 0; i < 25; i++) {
      float X = ( randomGaussian() * (drawingDiameter/1.5)) + (heightOffset)*2;
      float Y = ( randomGaussian() * (drawingDiameter/1.5)) + (drawingSurfaceHeight+height)/2;
      noStroke();
      circle(X, Y, height/720*3);
      stroke(black);
    }
    break;
  }
}

void interfaceText() {
  fill(black);
  textAlign (CENTER, CENTER);
  textFont(buttonFont, height/30);
  text("color up", heightOffset, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("color down", heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("size up", (heightOffset)*2.5, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("size down", (heightOffset)*2.5, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("shape up", (heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("shape down", (heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  fill(white);
}
