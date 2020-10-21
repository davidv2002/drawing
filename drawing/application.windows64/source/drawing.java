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
float drawingSurfaceStart, drawingSurfaceHeight, drawingDiameter, heightOffset, halfOffset;
Boolean draw, drawTest, quitButtonTest, upTest, downTest, leftTest, rightTest, pageUpTest, pageDownTest, penTest, eraserTest, clearTest, pageTest, update;
int colorNumber, brushSizeNumber, shape, shapeCount;
PFont buttonFont;
int[] colors = new int[5];
float[] brushSizes = new float[8];
PImage pic;

public void setup() {
  orientation(LANDSCAPE);
  
  //fullScreen();
  population();
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
}

public void draw() {
  tests();
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
  drawInterface();
}

public void mousePressed() {
  drawLatch();
  interfaceClicked();
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
  square(heightOffset, drawingSurfaceHeight, halfOffset);
  square(heightOffset, drawingSurfaceHeight+halfOffset, halfOffset);
  // shape and size
  if (update == true) {
    square(heightOffset*1.5f, drawingSurfaceHeight, heightOffset);
    fill(black);
    interfaceShape();
    fill(white);
    update = false;
  }
  // shape buttons
  square(heightOffset*2.5f, drawingSurfaceHeight, halfOffset);
  square(heightOffset*2.5f, drawingSurfaceHeight+halfOffset, halfOffset);
  // size buttons
  square(heightOffset*3, drawingSurfaceHeight, halfOffset);
  square(heightOffset*3, drawingSurfaceHeight+halfOffset, halfOffset);
  // basic pen
  square(heightOffset*3.5f, drawingSurfaceHeight, halfOffset);
  // eraser
  square(heightOffset*3.5f, drawingSurfaceHeight+halfOffset, halfOffset);
  // coloring page
  square(width-heightOffset*3, drawingSurfaceHeight, heightOffset);
  // background
  square(width-heightOffset*2, drawingSurfaceHeight, heightOffset);
  // quit 
  square(width-heightOffset, drawingSurfaceHeight, heightOffset);
  // text on buttons
  interfaceText();
}

public void interfaceShape() {
  switch(shape) {
  case 0:
    // dot
    circle(heightOffset*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    break;
  case 1:
    // square
    rectMode(CENTER);
    square(heightOffset*2, (drawingSurfaceHeight+height)/2, drawingDiameter);
    rectMode(CORNER);
    break;
  case 2:
    // airbrush
    for ( int i= 0; i < 25; i++) {
      float X = ( randomGaussian() * (drawingDiameter/2)) + heightOffset*2;
      float Y = ( randomGaussian() * (drawingDiameter/2)) + (drawingSurfaceHeight+height)/2;
      noStroke();
      if ( Y < drawingSurfaceHeight) {
        X = heightOffset*2;
        Y = (drawingSurfaceHeight+height)/2;
      }
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
  text("color up", heightOffset, drawingSurfaceHeight, halfOffset, halfOffset);
  text("color down", heightOffset, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("size up", heightOffset*2.5f, drawingSurfaceHeight, halfOffset, halfOffset);
  text("size down", heightOffset*2.5f, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("shape up", heightOffset*3, drawingSurfaceHeight, halfOffset, halfOffset);
  text("shape down", heightOffset*3, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("basic pen", heightOffset*3.5f, drawingSurfaceHeight, halfOffset, halfOffset);
  text("big eraser", heightOffset*3.5f, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  textFont(buttonFont, height/20);
  text("coloring page", width-heightOffset*3, drawingSurfaceHeight, heightOffset, heightOffset);
  text("start again", width-heightOffset*2, drawingSurfaceHeight, heightOffset, heightOffset);
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
  if (clearTest == true) {
    println("clear");
    clearDraw();
  }
  if (pageTest == true) {
    println("coloring page");
    coloringPage();
  }
}
/**
 i do not know how this next bit works, i found it on the  Processing Forum and it works
 what it does is hide the menu bar in android. do not ask me how it does that
 */

/**
 import android.os.Bundle; 
 import android.view.WindowManager;
 import android.view.*;
 
 void onCreate(Bundle bundle) { 
 super.onCreate(bundle);
 View decorView = getActivity().getWindow().getDecorView();
 decorView.setSystemUiVisibility(0);
 int uiOptions = View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
 | View.SYSTEM_UI_FLAG_FULLSCREEN;
 decorView.setSystemUiVisibility(uiOptions);
 }
 */
// end of bit that i do not know about
public void population() {
  // fonts
  buttonFont = createFont ("Microsoft Sans Serif", 55);
  // floats
  drawingSurfaceStart = 0;
  drawingSurfaceHeight = height*4/5;
  heightOffset = height-drawingSurfaceHeight;
  halfOffset = heightOffset/2;
  // arrays
  // colors
  colors[0] = black = 0xff000000;
  colors[1] = red = 0xffED2626;
  colors[2] = green = 0xff15D113;
  colors[3] = blue = 0xff4C47F2;
  colors[4] = white = 0xffFFFFFF;
  // sizes
  brushSizes[0] = width*1/200;
  brushSizes[1] = width*1/175;
  brushSizes[2] = width*1/150;
  brushSizes[3] = width*1/125;
  brushSizes[4] = width*1/100;
  brushSizes[5] = width*1/75;
  brushSizes[6] = width*1/50;
  brushSizes[7] = width*1/25;
  // ints
  shapeCount = 2;
  // pics
  pic = loadImage("carriage.png");
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
  drawTest = (pmouseY < drawingSurfaceHeight);
  // interface tests
  quitButtonTest = (pmouseX > width-heightOffset && pmouseY > drawingSurfaceHeight);
  clearTest = (pmouseX > width-heightOffset*2 && pmouseX < width-heightOffset && pmouseY > drawingSurfaceHeight);
  pageTest = (pmouseX > width-heightOffset*3 && pmouseX < width-heightOffset*2 && pmouseY > drawingSurfaceHeight);
  upTest = (pmouseX > heightOffset && pmouseX < heightOffset+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  downTest = (pmouseX > heightOffset && pmouseX < heightOffset+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  rightTest = (pmouseX > heightOffset*2.5f && pmouseX < heightOffset*2.5f+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  leftTest = (pmouseX > heightOffset*2.5f && pmouseX < heightOffset*2.5f+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  pageUpTest = (pmouseX > heightOffset*3 && pmouseX < heightOffset*3+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  pageDownTest = (pmouseX > heightOffset*3 && pmouseX < heightOffset*3+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
  penTest = (pmouseX > heightOffset*3.5f && pmouseX < heightOffset*3.5f+halfOffset && pmouseY > drawingSurfaceHeight && pmouseY < drawingSurfaceHeight+halfOffset);
  eraserTest = (pmouseX > heightOffset*3.5f && pmouseX < heightOffset*3.5f+halfOffset && pmouseY > drawingSurfaceHeight+halfOffset);
}
public void dot() {
  fill(ink);
  noStroke();
  circle(pmouseX, pmouseY, drawingDiameter);
  stroke(black);
}

public void square() {
  rectMode(CENTER);
  fill(ink);
  noStroke();
  square(pmouseX, pmouseY, drawingDiameter);
  stroke(black);
  rectMode(CORNER);
}

public void airBrush() {
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

public void clearDraw() {
  backgroundColor = ink;
  fill(backgroundColor);
  rect(drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
};

public void coloringPage() {
  ink = white;
  clearDraw();
  ink = black;
  image(pic, drawingSurfaceStart, drawingSurfaceStart, width, drawingSurfaceHeight);
};
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
