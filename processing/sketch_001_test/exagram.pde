class Exagram {
    //final color bg_color = color(51, 102, 153);
    final float fragment = height / 8.0;
    final float bar_height = height / 14.0;
    boolean flag;
    int row_number, bar_type;
    color bg_color;
    
    Exagram (color background) {
        flag = false;
        bg_color = background;
        
    }
    
    // to call from draw()
    public void update() {
        if (flag) {
            draw_bar(row_number, bar_type);
            setFlag(false);
        }
    }
   
    
    public void setRowNumber(int n) {
        row_number = n;    
    }
    
    public void setBarType(int n) {
        bar_type = n;    
    }
    
    public void setFlag(boolean n) {
        flag = n;    
    }

    public boolean getFlag() {
        return flag;
    }
    
    void draw_bar(int n, int kind) {
        fill(255,255,255);
        if (n == 0)
            background(bg_color);
        
        rectMode(CENTER);
        
        if (kind == 0)
            rect(width * 0.5, fragment*n + fragment*1.5, width / 2.0, bar_height);
        else {
            rect(width * 0.35, fragment*n + fragment*1.5, width / 5.0, bar_height);
            rect(width * 0.65, fragment*n + fragment*1.5, width / 5.0, bar_height);
        }
      }
}
