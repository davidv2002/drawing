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
  switch(shape) {
  case 0:
    fill(0);
    ellipse((height-drawingSurfaceHeight)*1.5, (drawingSurfaceHeight+height)/2, drawingDiameter, drawingDiameter);
    fill(255);
    break;
  case 1:
    rectMode(CENTER);
    fill(0);
    square((height-drawingSurfaceHeight)*1.5, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  }
}

void dot() {
  fill(ink);
  noStroke();
  ellipse(mouseX, mouseY, drawingDiameter, drawingDiameter);
  stroke(black);
}

void square() {
  rectMode(CENTER);
  fill(ink);
  noStroke();
  square(mouseX, mouseY, drawingDiameter);
  stroke(black);
  rectMode(CORNER);
}
