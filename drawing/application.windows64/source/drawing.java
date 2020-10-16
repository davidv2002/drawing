import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class drawing extends PApplet {

// global variables
int ink, black, red, green, blue, exitButtonXColor, quitButtonRed;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter, heightOffset;
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest;
int colorNumber, brushSizeNumber, shape, shapeCount;
String title;
PFont quitButtonFont;
int[] colors = new int[4];
float[] brushSizes = new float[4];

public void setup() {
  
  population();
  quitButtonRect();
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
}

public void draw() {
  populationDraw();
  quitButtonDraw();
  drawInterface();
  if (draw == true && drawTest == true) {
    switch(shape){
      case 0:
      dot();
      break;
      case 1:
      square();
      break;
    }
  } else {
    draw = false;
  }
}

public void mousePressed() {
  quitButtonMouseClicked();
  interfaceClicked();
  drawLatch();
  /*
  if (drawTest == true) {
    draw = true;
  }
  */
}

public void mouseReleased() {
  //draw = false;
}

public void keyPressed() {
  if (key == CODED) {
    cycling();
  }
}
public void quitButtonRect() {
  rect(width*19/20, 0, width*1/20, height*1/20);
}

public void quitButtonDraw() {
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

public void quitButtonMouseClicked() {
  if (quitButtonTest == true) {
    exit();
  }
}

public void interfaceClicked() {
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
public void cycling() {
  switch(keyCode) {
  case UP:
    cycleColorUp();
    break;
  case DOWN:
    cycleColorDown();
    break;
  case LEFT:
    cycleSizeLeft();
    break;
  case RIGHT:
    cycleSizeRight();
    break;
  }
}

public void cycleColorUp() {
  if (colorNumber == colors.length-1) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  ink = colors[colorNumber];
}

public void cycleColorDown() {
  if (colorNumber == 0) { 
    colorNumber = colors.length-1;
  } else { 
    colorNumber--;
  }
  ink = colors[colorNumber];
}

public void cycleSizeLeft() {
  if (brushSizeNumber == 0) { 
    brushSizeNumber = brushSizes.length-1;
    shapeDown();
  } else { 
    brushSizeNumber--;
  }
  drawingDiameter = brushSizes[brushSizeNumber];
}

public void cycleSizeRight() {
  if (brushSizeNumber == brushSizes.length-1) { 
    brushSizeNumber = 0;
    shapeUp();
  } else { 
    brushSizeNumber++;
  }
  drawingDiameter = brushSizes[brushSizeNumber];
}
public void population() {
  // fonts
  quitButtonFont = createFont ("Microsoft Sans Serif", 55);
  // floats
  drawingSurfaceX = 0;
  drawingSurfaceY = 0;
  drawingSurfaceWidth = width;
  drawingSurfaceHeight = height*4/5;
  heightOffset = height-drawingSurfaceHeight;
  // colors
  exitButtonXColor = 0xff9B5454;
  quitButtonRed = red = 0xffED2626;
  black = 0xff000000;
  green = 0xff15D113;
  blue = 0xff4C47F2;
  // booleans
  draw = false;
  // strings
  title = "X";
  // arrays
  // colors
  colors[0] = black;
  colors[1] = red;
  colors[2] = green;
  colors[3] = blue;
  // sizes
  brushSizes[0] = width*1/150;
  brushSizes[1] = width*1/100;
  brushSizes[2] = width*1/75;
  brushSizes[3] = width*1/50;
  // ints
  shapeCount = 1;
  // intal state
  ink =  colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
}

public void populationDraw() {
  drawTest = (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight);
  quitButtonTest = (mouseX >= width*19/20 && mouseX <= width && mouseY >= 0 && mouseY <= height*1/20);
  upTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  downTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  leftTest = (mouseX>(heightOffset)*2.5f && mouseX<(heightOffset)*2.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  rightTest = (mouseX>(heightOffset)*2.5f && mouseX<(heightOffset)*2.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
}

public void dot() {
  fill(ink);
  noStroke();
  ellipse(mouseX, mouseY, drawingDiameter, drawingDiameter);
  stroke(black);
}

public void square() {
  rectMode(CENTER);
  fill(ink);
  noStroke();
  square(mouseX, mouseY, drawingDiameter);
  stroke(black);
  rectMode(CORNER);
}

public void shapeDown() {
  if (shape == 0) { 
    shape = shapeCount;
  } else { 
    shape--;
  }
}

public void shapeUp() {
  if (shape == shapeCount) { 
    shape = 0;
  } else { 
    shape++;
  }
}
public void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

public void drawInterface() {
  // color
  fill(ink);
  square(0, drawingSurfaceHeight, heightOffset);
  fill(255);
  square(heightOffset, drawingSurfaceHeight, (heightOffset)/2);
  square(heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // shape and size
  square((heightOffset)*1.5f, drawingSurfaceHeight, heightOffset);
  interfaceShape();
  square((heightOffset)*2.5f, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*2.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
}

public void interfaceShape() {
  switch(shape) {
  case 0:
    fill(0);
    ellipse((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter, drawingDiameter);
    fill(255);
    break;
  case 1:
    rectMode(CENTER);
    fill(0);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "drawing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
