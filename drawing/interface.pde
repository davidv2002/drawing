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
  fill(backgroundColor);
  square(heightOffset*5, drawingSurfaceHeight, heightOffset);
  fill(white);
  // coloring page
  square(heightOffset*6, drawingSurfaceHeight, heightOffset);
  // background
  square(heightOffset*7, drawingSurfaceHeight, heightOffset);
  // quit 
  rectMode(CORNERS);
  rect(heightOffset*8, drawingSurfaceHeight, width, height);
  rectMode(CORNER);
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
  textFont(buttonFont, height/40);
  text("color\n up", heightOffset, drawingSurfaceHeight, halfOffset, halfOffset);
  text("color\n down", heightOffset, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("size\n up", heightOffset*2.5, drawingSurfaceHeight, halfOffset, halfOffset);
  text("size\n down", heightOffset*2.5, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("shape\n up", heightOffset*3, drawingSurfaceHeight, halfOffset, halfOffset);
  text("shape\n down", heightOffset*3, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  text("basic\n pen", heightOffset*3.5, drawingSurfaceHeight, halfOffset, halfOffset);
  text("big\n eraser", heightOffset*3.5, drawingSurfaceHeight+halfOffset, halfOffset, halfOffset);
  textFont(buttonFont, height/30);
  text("fill", heightOffset*4, drawingSurfaceHeight, heightOffset, heightOffset);
  if (backgroundColor == black) {
    fill(white);
  }
  text("filled\n color", heightOffset*5, drawingSurfaceHeight, heightOffset, heightOffset);
  fill (black);
  text("coloring\n page", heightOffset*6, drawingSurfaceHeight, heightOffset, heightOffset);
  text("reset", heightOffset*7, drawingSurfaceHeight, heightOffset, heightOffset);
  rectMode(CORNERS);
  text("quit", heightOffset*8, drawingSurfaceHeight, width, height); 
  rectMode(CORNER);
  fill(white);
}

void interfaceClicked() {
  if (quitButtonTest) {
    exit();
  }
  if (upTest) {
    cycleColorUp();
    return;
  }
  if (downTest) {
    cycleColorDown();
    return;
  }
  if (rightTest) {
    cycleSizeUp();
    return;
  }
  if (leftTest) {
    cycleSizeDown();
    return;
  }
  if (pageUpTest) {
    shapeUp();
    return;
  }
  if (pageDownTest) {
    shapeDown();
    return;
  }
  if (penTest) {
    basicPen();
    return;
  }
  if (eraserTest) {
    eraser();
    return;
  }
  if (fillTest) {
    clearDraw();
    return;
  }
  if (resetTest) {
    intalStates();
    return;
  }
  if (pageTest) {
    coloringPage();
  }
}
