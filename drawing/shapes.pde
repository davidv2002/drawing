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
