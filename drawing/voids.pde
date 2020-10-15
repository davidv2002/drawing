void cycleColorUp() {
  if (colorNumber == 3) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  ink = colors[colorNumber];
}
void cycleColorDown() {
  if (colorNumber == 0) { 
    colorNumber = 3;
  } else { 
    colorNumber--;
  }
  ink = colors[colorNumber];
}
void cycleSizeLeft() {
  if (brushSizeNumber == 0) { 
    brushSizeNumber = 3;
  } else { 
    brushSizeNumber--;
  }
  drawingDiameter = brushSizes[brushSizeNumber];
}
void cycleSizeRight() {
  if (brushSizeNumber == 3) { 
    brushSizeNumber = 0;
  } else { 
    brushSizeNumber++;
  }
  drawingDiameter = brushSizes[brushSizeNumber];
}
