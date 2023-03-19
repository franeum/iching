import oscP5.*;
import netP5.*;

OscP5 oscP5;
Exagram exagram;
Title title;
color background = color(51, 102, 153);

void setup() {
    size(640,480);
    fullScreen();
    rectMode(CENTER);

    noStroke();

    oscP5 = new OscP5(this, 12000);
    exagram = new Exagram(background);
    title = new Title("Fai una domanda e\npremi il pulsante", "Ask a question and\npush the button", background);
    background(background);
    title.setFlag(true);
}

void draw() {
    exagram.update();
    title.update();
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
}
