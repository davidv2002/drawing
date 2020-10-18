void dot() {
  fill(ink);
  noStroke();
  circle(mouseX, mouseY, drawingDiameter);
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

void airBrush() {
  for ( int i= 0; i < 25; i++) {
    float X = ( randomGaussian() * (drawingDiameter/2)) + mouseX;
    float Y = ( randomGaussian() * (drawingDiameter/2)) + mouseY;
    if ( Y > drawingSurfaceHeight) {
      X = 0;
      Y = height;
    }
    noStroke();
    fill(ink);
    circle(X, Y, 1);
    stroke(black);
  }
}

void shapeDown() {
  if (shape == 0) { 
    shape = shapeCount;
  } else { 
    shape--;
  }
  update = true;
}

void shapeUp() {
  if (shape == shapeCount) { 
    shape = 0;
  } else { 
    shape++;
  }
  update = true;
}
