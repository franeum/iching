class Clear {
  boolean flag;
  color background;
  int counter, _w, _h;
  
  Clear(color backgnd, int w, int h) {
    flag = false;
    background = backgnd;
    fill(255,0,0, 0);
    rect(0, 0, w, h);
    _w = w;
    _h = h;
  }
  
  public void update() {
    if (flag) {
      if (counter < 256) {
        //println(counter);
        fill(background, counter);
        rectMode(CORNER);
        rect(0, 0, _w, _h);  
        counter+=2;
      } else {
        setFlag(false);
        counter = 0;
      }
    }
  }
  
  public void setFlag(boolean value) {
    flag = value;  
    counter = 0;
  }
}
