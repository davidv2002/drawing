void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

void drawInterface() {
  fill(ink);
  rect(0, drawingSurfaceHeight, height-drawingSurfaceHeight, height);
  fill(255);
  rect(height-drawingSurfaceHeight, drawingSurfaceHeight, height-drawingSurfaceHeight, height);
  fill(0);
  ellipse((height-drawingSurfaceHeight)*1.5, (drawingSurfaceHeight+height)/2, drawingDiameter, drawingDiameter);
  fill(255);
}
