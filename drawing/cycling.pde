void cycling() {
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

void cycleColorUp() {
  if (colorNumber == colors.length-1) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  update = true;
  ink = colors[colorNumber];
}

void cycleColorDown() {
  if (colorNumber == 0) { 
    colorNumber = colors.length-1;
  } else { 
    colorNumber--;
  }
  update = true;
  ink = colors[colorNumber];
}

void cycleSizeLeft() {
  if (brushSizeNumber == 0) { 
    brushSizeNumber = brushSizes.length-1;
    shapeDown();
  } else { 
    brushSizeNumber--;
  }
  update = true;
  drawingDiameter = brushSizes[brushSizeNumber];
}

void cycleSizeRight() {
  if (brushSizeNumber == brushSizes.length-1) { 
    brushSizeNumber = 0;
    shapeUp();
  } else { 
    brushSizeNumber++;
  }
  update = true;
  drawingDiameter = brushSizes[brushSizeNumber];
}
