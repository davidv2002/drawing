void dot() {
  fill(ink);
  noStroke();
  circle(pmouseX, pmouseY, drawingDiameter);
  stroke(black);
}

void square() {
  rectMode(CENTER);
  fill(ink);
  noStroke();
  square(pmouseX, pmouseY, drawingDiameter);
  stroke(black);
  rectMode(CORNER);
}

void airBrush() {
  for ( int i= 0; i < 25; i++) {
    // setup
    float X = ( randomGaussian() * (drawingDiameter/2)) + pmouseX;
    float Y = ( randomGaussian() * (drawingDiameter/2)) + pmouseY;
    // safety
    if ( Y > drawingSurfaceHeight) {
      X = drawingSurfaceStart;
      Y = height;
    }
    // draw
    noStroke();
    fill(ink);
    circle(X, Y, height/720);
    stroke(black);
  }
}
