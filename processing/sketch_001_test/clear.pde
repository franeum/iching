class Clear {
  boolean flag;
  color background;
  
  Clear(color backgnd) {
    flag = false;
    background = backgnd;
  }
  
  public void update() {
    if (flag)
      background(background);
      setFlag(false);
  }
  
  public void setFlag(boolean value) {
    flag = value;  
  }
}
