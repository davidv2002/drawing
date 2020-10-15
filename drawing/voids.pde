void cycle() {
  if (colorNumber == 3) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  ink = colors[colorNumber];
}
