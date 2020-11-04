void drawInterface() {
  // color
  fill(ink);
  square(drawingSurfaceStart, drawingSurfaceHeight, heightOffset);
  fill(white);
  // color buttons
  square(heightOffset, drawingSurfaceHeight, halfOffset);
  square(heightOffset, drawingSurfaceHeight+halfOffset, halfOffset);
  // shape and size
  if (update || shape != 2) {
    square(heightOffset*1.5, drawingSurfaceHeight, heightOffset);
    fill(black);
    interfaceShape();
    fill(white);
    update = false;
  }
  // shape buttons
  square(heightOffset*2.5, drawingSurfaceHeight, halfOffset);
  square(heightOffset*2.5, drawingSurfaceHeight+halfOffset, halfOffset);
  // size buttons
  square(heightOffset*3, drawingSurfaceHeight, halfOffset);
  square(heightOffset*3, drawingSurfaceHeight+halfOffset, halfOffset);
  // basic pen
  square(heightOffset*3.5, drawingSurfaceHeight, halfOffset);
  // eraser
  square(heightOffset*3.5, drawingSurfaceHeight+halfOffset, halfOffset);
  //reset
  square(heightOffset*4, drawingSurfaceHeight, heightOffset);
  // backgournd color
  rectMode(CORNERS);
  fill(backgroundColor);
  rect(heightOffset*5, drawingSurfaceHeight, width-heightOffset*3, height);
  fill(white);
  rectMode(CORNER);
  // coloring page
  square(width-heightOffset*3, drawingSurfaceHeight, heightOffset);
  // background
  square(width-heightOffset*2, drawingSurfaceHeight, heightOffset);
  // quit 
  square(width-heightOffset, drawingSurfaceHeight, heightOffset);
  // text on buttons
  interfaceText();
}

void interfaceShape() {
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

void interfaceText() {
  fill(black);
  textAlign (CENTER, CENTER);
  textFont(buttonFont, height/30);
  text("color up", heightOffset, drawingSurfaceHeight, halfOffset, halfOffset);
  text("color down", heightOffset, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("size up", heightOffset*2.5, drawingSurfaceHeight, halfOffset, halfOffset);
  text("size down", heightOffset*2.5, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("shape up", heightOffset*3, drawingSurfaceHeight, halfOffset, halfOffset);
  text("shape down", heightOffset*3, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("basic pen", heightOffset*3.5, drawingSurfaceHeight, halfOffset, halfOffset);
  text("big eraser", heightOffset*3.5, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  textFont(buttonFont, height/20);
  rectMode(CORNERS);
  if (backgroundColor == black) {
    fill(white);
  }
  text("filled color", heightOffset*5, drawingSurfaceHeight, width-heightOffset*3, height);
  rectMode(CORNER);
  fill (black);
  text("fill", heightOffset*4, drawingSurfaceHeight, heightOffset, heightOffset);
  text("coloring page", width-heightOffset*3, drawingSurfaceHeight, heightOffset, heightOffset);
  text("reset", width-heightOffset*2, drawingSurfaceHeight, heightOffset, heightOffset);
  text("quit drawing", width-heightOffset, drawingSurfaceHeight, heightOffset, heightOffset); 
  fill(white);
}

void interfaceClicked() {
  if (quitButtonTest) {
    exit();
  }
  if (upTest) {
    println("up");
    cycleColorUp();
    return;
  }
  if (downTest) {
    println("down");
    cycleColorDown();
    return;
  }
  if (rightTest) {
    println("right");
    cycleSizeUp();
    return;
  }
  if (leftTest) {
    println("left");
    cycleSizeDown();
    return;
  }
  if (pageUpTest) {
    println("page up");
    shapeUp();
    return;
  }
  if (pageDownTest) {
    println("page down");
    shapeDown();
    return;
  }
  if (penTest) {
    println("basic pen");
    basicPen();
    return;
  }
  if (eraserTest) {
    println("big eraser");
    eraser();
    return;
  }
  if (fillTest) {
    println("fill");
    clearDraw();
    return;
  }
  if (resetTest) {
    println("reset");
    intalStates();
    return;
  }
  if (pageTest) {
    println("coloring page");
    coloringPage();
  }
}
