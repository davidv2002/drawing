void drawInterface() {
  // color
  fill(ink);
  square(0, drawingSurfaceHeight, heightOffset);
  fill(255);
  // color buttons
  square(heightOffset, drawingSurfaceHeight, (heightOffset)/2);
  square(heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // shape and size
  if (update == true) {
    square((heightOffset)*1.5, drawingSurfaceHeight, heightOffset);
    interfaceShape();
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
    fill(0);
    circle((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    fill(255);
    break;
  case 1:
    // square
    rectMode(CENTER);
    fill(0);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  case 2:
    // airbrush
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

void interfaceText() {
  fill(0);
  textAlign (CENTER, CENTER);
  textFont(buttonFont, height/30);
  text("color up", heightOffset, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("color down", heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("size up", (heightOffset)*2.5, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("size down", (heightOffset)*2.5, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("shape up", (heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("shape down", (heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  fill(255);
}
