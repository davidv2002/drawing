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
    // setup
    float X = ( randomGaussian() * (drawingDiameter/2)) + mouseX;
    float Y = ( randomGaussian() * (drawingDiameter/2)) + mouseY;
    // safety
    if ( Y > drawingSurfaceHeight) {
      X = 0;
      Y = height;
    }
    // draw
    noStroke();
    fill(ink);
    circle(X, Y, height/720);
    stroke(black);
  }
}
