class Title {
    Title (String t1, String t2) {
        PFont font1;
        PFont font2;
        // The font must be located in the sketch's 
        // "data" directory to load successfully
        font1 = loadFont("./data/ArialNarrow-Bold-128.vlw");
        textFont(font1, 128);
        fill(255,255,255);
        textAlign(RIGHT);
        text(t1, width / 2.0, height / 2.0 - 64);

        font2 = loadFont("./data/ArialNarrow-BoldItalic-128.vlw");
        textFont(font2, 128);
        fill(255,255,255);
        textAlign(LEFT);
        text(t2, width / 2.0, height / 2.0 + 64);
    }
}
