void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

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
}

void interfaceShape() {
  switch(shape) {
  case 0:
    fill(0);
    ellipse((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter, drawingDiameter);
    fill(255);
    break;
  case 1:
    rectMode(CENTER);
    fill(0);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  }
}
