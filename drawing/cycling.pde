void cycling() {
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

void cycleSizeDown() {
  if (brushSizeNumber == 0) { 
    brushSizeNumber = brushSizes.length-1;
  } else { 
    brushSizeNumber--;
  }
  update = true;
  drawingDiameter = brushSizes[brushSizeNumber];
}

void cycleSizeUp() {
  if (brushSizeNumber == brushSizes.length-1) { 
    brushSizeNumber = 0;
  } else { 
    brushSizeNumber++;
  }
  update = true;
  drawingDiameter = brushSizes[brushSizeNumber];
}

void shapeDown() {
  if (shape == 0) { 
    shape = shapeCount;
  } else { 
    shape--;
  }
  update = true;
}

void shapeUp() {
  if (shape == shapeCount) { 
    shape = 0;
  } else { 
    shape++;
  }
  update = true;
}
