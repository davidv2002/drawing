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
int ink, black, red, green, blue, white, backgroundColor;
float drawingSurfaceStart, drawingSurfaceHeight, drawingDiameter, heightOffset;
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest, pageUpTest, pageDownTest, penTest, eraserTest, update;
int colorNumber, brushSizeNumber, shape, shapeCount;
PFont buttonFont;
int[] colors = new int[5];
float[] brushSizes = new float[4];

public void setup() {
  //size(1280, 720);
  
  population();
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
}

public void draw() {
  tests();
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
  square(drawingSurfaceStart, drawingSurfaceHeight, heightOffset);
  fill(white);
  // color buttons
  square(heightOffset, drawingSurfaceHeight, (heightOffset)/2);
  square(heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // shape and size
  if (update == true) {
    square((heightOffset)*1.5f, drawingSurfaceHeight, heightOffset);
    fill(black);
    interfaceShape();
    fill(white);
    update = false;
  }
  // shape buttons
  square((heightOffset)*2.5f, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*2.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // size buttons
  square((heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2);
  square((heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);
  // basic pen
  square((heightOffset)*3.5f, drawingSurfaceHeight, (heightOffset)/2);
  // eraser
  square((heightOffset)*3.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2);

  // quit 
  square(width-heightOffset, drawingSurfaceHeight, heightOffset);
  // text on buttons
  interfaceText();
}

public void interfaceShape() {
  switch(shape) {
  case 0:
    // dot
    circle((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    break;
  case 1:
    // square
    rectMode(CENTER);
    square((heightOffset)*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    break;
  case 2:
    // airbrush
    for ( int i= 0; i < 25; i++) {
      float X = ( randomGaussian() * (drawingDiameter/1.5f)) + (heightOffset)*2;
      float Y = ( randomGaussian() * (drawingDiameter/1.5f)) + (drawingSurfaceHeight+height)/2;
      noStroke();
      circle(X, Y, height/720*3);
      stroke(black);
    }
    break;
  }
}

public void interfaceText() {
  fill(black);
  textAlign (CENTER, CENTER);
  textFont(buttonFont, height/30);
  text("color up", heightOffset, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("color down", heightOffset, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("size up", (heightOffset)*2.5f, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("size down", (heightOffset)*2.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("shape up", (heightOffset)*3, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("shape down", (heightOffset)*3, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  text("basic pen", (heightOffset)*3.5f, drawingSurfaceHeight, (heightOffset)/2, (heightOffset)/2);
  text("big eraser", (heightOffset)*3.5f, drawingSurfaceHeight+(heightOffset)/2, (heightOffset)/2, (heightOffset)/2);
  textFont(buttonFont, height/20);
  text("quit drawing", width-heightOffset, drawingSurfaceHeight, heightOffset, heightOffset); 
  fill(white);
}

public void interfaceClicked() {
  if (quitButtonTest == true) {
    exit();
  }
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
  if (penTest == true) {
    println("basic pen");
    basicPen();
  }
  if (eraserTest == true) {
    println("big eraser");
    eraser();
  }
}
public void population() {
  // fonts
  buttonFont = createFont ("Microsoft Sans Serif", 55);
  // floats
  drawingSurfaceStart = 0;
  drawingSurfaceHeight = height*4/5;
  heightOffset = height-drawingSurfaceHeight;
  // arrays
  // colors
  colors[0] = black = 0xff000000;
  colors[1] = red = 0xffED2626;
  colors[2] = green = 0xff15D113;
  colors[3] = blue = 0xff4C47F2;
  colors[4] = white = 0xffFFFFFF;
  // sizes
  brushSizes[0] = width*1/150;
  brushSizes[1] = width*1/100;
  brushSizes[2] = width*1/75;
  brushSizes[3] = width*1/50;
  // ints
  shapeCount = 2;
  // intal states
  ink = colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
  draw = false;
  backgroundColor = white;
}

public void tests() {
  // drawing test
  drawTest = (mouseX>drawingSurfaceStart && mouseX<drawingSurfaceStart+width && mouseY>drawingSurfaceStart && mouseY<drawingSurfaceStart+drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (mouseX >= width-heightOffset && mouseX <= width && mouseY >= drawingSurfaceHeight && mouseY <= height);
  upTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  downTest = (mouseX>heightOffset && mouseX<heightOffset+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  rightTest = (mouseX>(heightOffset)*2.5f && mouseX<(heightOffset)*2.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  leftTest = (mouseX>(heightOffset)*2.5f && mouseX<(heightOffset)*2.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  pageUpTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  pageDownTest = (mouseX>(heightOffset)*3 && mouseX<(heightOffset)*3+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
  penTest = (mouseX>(heightOffset)*3.5f && mouseX<(heightOffset)*3.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight && mouseY<drawingSurfaceHeight+(heightOffset)/2);
  eraserTest = (mouseX>(heightOffset)*3.5f && mouseX<(heightOffset)*3.5f+(heightOffset)/2 && mouseY>drawingSurfaceHeight+(heightOffset)/2 && mouseY<height);
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
public void drawLatch() {
  if (draw == false && drawTest == true) {
    draw = true;
  } else if (draw == true) {
    draw = false;
  }
}

public void basicPen() {
  ink = colors[0];
  drawingDiameter = brushSizes[0];
  shape = 0;
  update = true;
}

public void eraser() {
  ink = backgroundColor;
  drawingDiameter = brushSizes[brushSizes.length-1];
  shape = 0;
  update = true;
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "drawing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
