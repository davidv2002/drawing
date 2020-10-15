void cycle() {
  if (colorNumber == 3) { 
    colorNumber = 0;
  } else { 
    colorNumber++;
  }
  if (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight) { 
    draw = true;
  }
  ink = colors[colorNumber];
}
