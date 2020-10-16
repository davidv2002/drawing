void quitButtonRect() {
  rect(width*19/20, 0, width*1/20, height*1/20);
}

void quitButtonDraw() {
  if (quitButtonTest == true) {
    fill(quitButtonRed);
    quitButtonRect();
  } else {
    fill(black);
    quitButtonRect();
  }
  fill(exitButtonXColor);
  textAlign (CENTER, CENTER);
  textFont(quitButtonFont, height/36);
  text(title, width*19/20, 0, width*1/20, height*1/20); 
  fill(255);
}

void quitButtonMouseClicked() {
  if (quitButtonTest == true) {
    exit();
  }
}

void interfaceClicked() {
  if (upTest == true) {
    println("up");
    cycleColorUp();
  }
  if (downTest == true) {
    println("down");
    cycleColorDown();
  }
    if (leftTest == true) {
    println("left");
    cycleSizeLeft();
  }
  if (rightTest == true) {
    println("right");
    cycleSizeRight();
  }
}
