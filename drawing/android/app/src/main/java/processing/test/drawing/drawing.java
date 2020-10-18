package processing.test.drawing;

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
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest, pageUpTest, pageDownTest, update;
int colorNumber, brushSizeNumber, shape, shapeCount;
String title;
PFont buttonFont;
int[] colors = new int[4];
float[] brushSizes = new float[4];

public void setup() {
  //size(1280, 720);
  
  population();
  quitButtonRect();
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
}

public void draw() {
  tests();
  drawQuitButton();
  drawInterface();
  if (draw == true && drawTest == true) {
    switch(shape) {
    case 0:
      dot();
      break;
    case 1:
      square();
      break;
    case 2:
      airBrush();
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
}

public void mouseReleased() {
  draw = false;
}

public void keyPressed() {
  if (key == CODED) {
    cycling();
  }
}
public void quitButtonRect() {
  rect(width*19/20, 0, width*1/20, height*1/20);
}

public void drawQuitButton() {
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
public void cycling() {
  switch(keyCode) {
  case UP:
    cycleColorUp();
    break;
  case DOWN:
    cycleColorDown();
    break;
  case LEFT:
    cycleSizeDown();
    break;
  case RIGHT:
    cycleSizeUp();
    break;
  case 33: // page up
    shapeUp();
    break;
  case 34: // page down
    shapeDown();
    break;
  }
}

public void cycleColorUp() {
  if (colorNumber == colors.length-1) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  update = true;
  ink = colors[colorNumber];
}

public void cycleColorDown() {
  if (colorNumber == 0) { 
    colorNumber = colors.length-1;
  } else { 
    colorNumber--;
  }
  update = true;
  ink = colors[colorNumber];
}

public void cycleSizeDown() {
  if (brushSizeNumber == 0) { 
    brushSizeNumber = brushSizes.length-1;
  } else { 
    brushSizeNumber--;
  }
  update = true;
  drawingDiameter = brushSizes[brushSizeNumber];
}

public void cycleSizeUp() {
  if (brushSizeNumber == brushSizes.length-1) { 
    brushSizeNumber = 0;
  } else { 
    brushSizeNumber++;
  }
  update = true;
  drawingDiameter = brushSizes[brushSizeNumber];
}

public void shapeDown() {
  if (shape == 0) { 
    shape = shapeCount;
  } else { 
    shape--;
  }
  update = true;
}

public void shapeUp() {
  if (shape == shapeCount) { 
    shape = 0;
  } else { 
    shape++;
  }
  update = true;
}
public void drawInterface() {
  // color
  fill(ink);
  square(0, drawingSurfaceHeight, heightOffset);
  fill(255);
  // color buttons
  square(heightOffset, drawingSurfaceHeight, (heightOffset)/2);
  square(heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // shape and size
  if (update == true) {
    square((heightOffset)*1.5f, drawingSurfaceHeight, heightOffset);
    interfaceShape();
  }
  // shape buttons
  square((heightOffset)*2.5f, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*2.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // size buttons
  square((heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // text on buttons
  interfaceText();
  update = false;
}

public void interfaceShape() {
  switch(shape) {
  case 0:
    // dot
    fill(0);
    circle((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    fill(255);
    break;
  case 1:
    // square
    rectMode(CENTER);
    fill(0);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    fill(255);
    break;
  case 2:
    // airbrush
    for ( int i= 0; i < 25; i++) {
      float X = ( randomGaussian() * (drawingDiameter/1.5f)) + (heightOffset)*2;
      float Y = ( randomGaussian() * (drawingDiameter/1.5f)) + (drawingSurfaceHeight+height)/2;
      fill(0);
      noStroke();
      circle(X, Y, height/720*3);
      stroke(0);
      fill(255);
    }
    break;
  }
}

public void interfaceText() {
  fill(0);
  textAlign (CENTER, CENTER);
  textFont(buttonFont, height/30);
  text("color up", heightOffset, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("color down", heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("size up", (heightOffset)*2.5f, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("size down", (heightOffset)*2.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("shape up", (heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("shape down", (heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  fill(255);
}
public void population() {
  // fonts
  buttonFont = createFont ("Microsoft Sans Serif", 55);
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
  shapeCount = 2;
  // intal states
  ink =  colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
  draw = false;
}

public void tests() {
  // drawing test
  drawTest = (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (mouseX >= width*19/20 && mouseX <= width && mouseY >= 0 && mouseY <= height*1/20);
  upTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  downTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  rightTest = (mouseX>(heightOffset)*2.5f && mouseX<(heightOffset)*2.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  leftTest = (mouseX>(heightOffset)*2.5f && mouseX<(heightOffset)*2.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  pageUpTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  pageDownTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
}
public void dot() {
  fill(ink);
  noStroke();
  circle(mouseX, mouseY, drawingDiameter);
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

public void airBrush() {
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
public void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}
  public void settings() {  fullScreen(); }
}
