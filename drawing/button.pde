void quitButtonRect() {
  rect(width*19/20, 0, width*1/20, height*1/20);
}

void drawQuitButton() {
  // hover over
  if (quitButtonTest == true) {
    fill(quitButtonRed);
    quitButtonRect();
  } else {
    fill(black);
    quitButtonRect();
  }
  // button text
  fill(exitButtonXColor);
  textAlign (CENTER, CENTER);
  textFont(buttonFont, height/36);
  text("X", width*19/20, 0, width*1/20, height*1/20); 
  fill(white);
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
  if (rightTest == true) {
    println("right");
    cycleSizeUp();
  }
  if (leftTest == true) {
    println("left");
    cycleSizeDown();
  }
  if (pageUpTest == true) {
    println("page up");
    shapeUp();
  }
  if (pageDownTest == true) {
    println("page down");
    shapeDown();
  }
}
