void cycling() {
  if (key == CODED) {
    if (keyCode == UP) {
      cycleColorUp();
    } 
    if (keyCode == DOWN) {
      cycleColorDown();
    }
    if (keyCode == LEFT) {
      cycleSizeLeft();
    }
    if (keyCode == RIGHT) {
      cycleSizeRight();
    }
  }
}

void cycleColorUp() {
  if (colorNumber == colors.length-1) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  ink = colors[colorNumber];
}

void cycleColorDown() {
  if (colorNumber == 0) { 
    colorNumber = colors.length-1;
  } else { 
    colorNumber--;
  }
  ink = colors[colorNumber];
}

void cycleSizeLeft() {
  if (brushSizeNumber == 0) { 
    brushSizeNumber = brushSizes.length-1;
  } else { 
    brushSizeNumber--;
  }
  drawingDiameter = brushSizes[brushSizeNumber];
}

void cycleSizeRight() {
  if (brushSizeNumber == brushSizes.length-1) { 
    brushSizeNumber = 0;
  } else { 
    brushSizeNumber++;
  }
  drawingDiameter = brushSizes[brushSizeNumber];
}
