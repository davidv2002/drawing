void cycleUp() {
  if (colorNumber == 3) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  ink = colors[colorNumber];
}void cycleDown() {
  if (colorNumber == 0) { 
    colorNumber = 3;
  } else { 
    colorNumber--;
  }
  ink = colors[colorNumber];
}
