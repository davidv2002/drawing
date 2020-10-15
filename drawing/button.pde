// global variables
String title;
PFont quitButtonFont;
color exitButtonXColor, quitButtonRed;

void quitButtonRect() {
  rect(width*19/20, height*0, width*1/20, height*1/20);
}

void quitButtonDraw() {
  if (mouseX >= width*19/20 && mouseX <= width && mouseY >= height*0 && mouseY <= height*1/20) {
    fill(quitButtonRed);
    quitButtonRect();
  } else {
    fill(black);
    quitButtonRect();
  }
  fill(exitButtonXColor);
  textAlign (CENTER, CENTER);
  textFont(quitButtonFont, 20);
  text(title, width*19/20, height*0, width*1/20, height*1/20); 
  fill(255);
}

void quitButtonMouseClicked() {
  if (mouseX >= width*19/20 && mouseX <= width && mouseY >= height*0 && mouseY <= height*1/20) {
    exit();
  }
}
