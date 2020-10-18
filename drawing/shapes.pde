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

void airBrush() {
  for ( int i= 0; i < 5; i++) {
    float X = ( randomGaussian() * (drawingDiameter/2)) + mouseX;
    float Y = ( randomGaussian() * (drawingDiameter/2)) + mouseY;
    noStroke();
    fill(ink);
    ellipse(X, Y, 3, 3);
    stroke(black);
  }
}
void shapeDown() {
  if (shape == 0) { 
    shape = shapeCount;
  } else { 
    shape--;
  }
}

void shapeUp() {
  if (shape == shapeCount) { 
    shape = 0;
  } else { 
    shape++;
  }
}
