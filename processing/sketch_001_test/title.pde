class Title {
    PFont font1;
    PFont font2;
    boolean flag;
    color backgnd;
    String txt1, txt2;
    int counter;

    Title (String t1, String t2, color bg_color) {
        
        backgnd = bg_color;
        font1 = loadFont("./data/ArialNarrow-Bold-128.vlw");
        font2 = loadFont("./data/ArialNarrow-BoldItalic-128.vlw");
        txt1 = t1;
        txt2 = t2;
        flag = false;
    }

    public void setTitle() {
        background(backgnd);
        fill(255,255,255,counter);
        textFont(font1, 128);
        textAlign(CENTER);
        text(txt1, width / 2.0, height / 2.0 - 192);
        textFont(font2, 128);
        textAlign(CENTER);
        text(txt2, width / 2.0, height / 2.0 + 192);
        counter++;
    }

    public void setFlag(boolean val) {
        flag = val;
    }

    public boolean getFlag() {
        return flag;
    }

    void resetCounter() {
      counter = 0;
    }

    public void update() {
        if (flag) {
            setTitle();
            if (counter >= 256)
              setFlag(false);
        } else
            resetCounter();
    }
}
