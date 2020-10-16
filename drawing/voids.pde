void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } //else if (draw == true) {
  // draw = false;
  //}
}

void drawInterface() {
  fill(ink);
  rect(0, drawingSurfaceHeight, height-drawingSurfaceHeight, height);
  fill(255);
}
