// Global Variables
String title= "X";
PFont quitButtonFont;
color purple = #2C08FF;
color purpleQuitButton = #FFDBFB;
color yellowQuitButton = #FEFFDB;

void quitButtonRect() {
  rect(width*19/20, height*0, width*1/20, height*1/20);
}
void quitButtonSetup() {
  quitButtonFont = createFont ("Microsoft Sans Serif", 55);
  quitButtonRect();
}

void quitButtonDraw() {
  if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*0 && mouseY <= height*1/20) {
    fill(yellowQuitButton);
    quitButtonRect();
  } else {
    fill(purpleQuitButton);
    quitButtonRect();
  }
  fill(purple);
  textAlign (CENTER, CENTER);
  textFont(quitButtonFont, 20);
  text(title, width*19/20, height*0, width*1/20, height*1/20);
  fill(255);
}

void quitButtonMouseClicked() {
  if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*0 && mouseY <= height*1/20) {
    exit();
  }
}
