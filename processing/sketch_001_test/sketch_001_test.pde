import oscP5.*;
import netP5.*;

OscP5 oscP5;
Exagram exagram;
Title title;
Title exagramName;
Clear clear;
color background = color(51, 102, 153);
String[] lines;

void setup() {
    size(640,480);
    fullScreen();
    rectMode(CENTER);

    noStroke();

    oscP5 = new OscP5(this, 12000);
    exagram = new Exagram(background);
    clear = new Clear(background, width, height);
    title = new Title("Fai una domanda e\npremi il pulsante", "Ask a question and\npush the button", background);
    exagramName = new Title("", "", background);
    
    background(background);
    title.setFlag(true);
    lines = loadStrings("./data/sentences.txt");
}

void draw() {
    clear.update();
    title.update();
    exagram.update();
    exagramName.update();
}

void oscEvent(OscMessage theOscMessage) {
    if(theOscMessage.checkAddrPattern("/test") == true) {
        if(theOscMessage.checkTypetag("ff")) {
            exagram.setRowNumber((int)(theOscMessage.get(0).floatValue()));
            exagram.setBarType((int)(theOscMessage.get(1).floatValue()));
            exagram.setFlag(true);
            return;
        }  
    } 

    if(theOscMessage.checkAddrPattern("/title") == true) {
        if(theOscMessage.checkTypetag("f")) {
            float val = theOscMessage.get(0).floatValue();
            if (val == 1.0)
                title.setFlag(true);
            return;
        }  
    } 
    
    if(theOscMessage.checkAddrPattern("/clear") == true) {
        if(theOscMessage.checkTypetag("f")) {
            float val = theOscMessage.get(0).floatValue();
            if (val == 1.0)
                clear.setFlag(true);
            return;
        }  
    } 

    if(theOscMessage.checkAddrPattern("/exagram") == true) {
        if(theOscMessage.checkTypetag("f")) {
            int val = (int)theOscMessage.get(0).floatValue();
            println(lines[val]);
            exagramName.setText(lines[val],"");
            exagramName.setFlag(true);
            return;
        }  
    } 
}
