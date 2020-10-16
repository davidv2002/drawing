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
  square(0, drawingSurfaceHeight, height-drawingSurfaceHeight);
  fill(255);
  square(height-drawingSurfaceHeight, drawingSurfaceHeight, (height-drawingSurfaceHeight)/2);
  square(height-drawingSurfaceHeight, drawingSurfaceHeight+(height-drawingSurfaceHeight)/2, (height-drawingSurfaceHeight)/2);
  // shape and size
  square((height-drawingSurfaceHeight)*1.5, drawingSurfaceHeight, height-drawingSurfaceHeight);
  interfaceShape();
  square((height-drawingSurfaceHeight)*2.5, drawingSurfaceHeight, (height-drawingSurfaceHeight)/2);
  square((height-drawingSurfaceHeight)*2.5, drawingSurfaceHeight+(height-drawingSurfaceHeight)/2, (height-drawingSurfaceHeight)/2);
}

void interfaceShape() {
  switch(shape) {
  case 0:
    fill(0);
    ellipse((height-drawingSurfaceHeight)*2, (drawingSurfaceHeight+height)/2, drawingDiameter, drawingDiameter);
    fill(255);
    break;
  case 1:
    rectMode(CENTER);
    fill(0);
    square((height-drawingSurfaceHeight)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  }
}
