void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

void drawInterface() {
  fill(ink);
  square(0, drawingSurfaceHeight, height-drawingSurfaceHeight);
  fill(255);
  square((height-drawingSurfaceHeight)*1.5, drawingSurfaceHeight, height-drawingSurfaceHeight);
  interfaceShape();
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
