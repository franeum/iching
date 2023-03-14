import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
Exagram exagram;
Title title;

void setup() {
    size(640,480);
    fullScreen();
    rectMode(CENTER);

    noStroke();

    oscP5 = new OscP5(this, 12000);
    exagram = new Exagram();
    title = new Title("\tFai una domanda", "Ask a question\t");
}

void draw() {
    exagram.update();
}


void oscEvent(OscMessage theOscMessage) {
  
    if(theOscMessage.checkAddrPattern("/test") == true) {
        
        if(theOscMessage.checkTypetag("ff")) {
            
            //println("row: " + row_number + " kind of bar: " + f_bar);
        
            exagram.setRowNumber((int)(theOscMessage.get(0).floatValue()));
            exagram.setBarType((int)(theOscMessage.get(1).floatValue()));
            exagram.setFlag(true);
            
            return;
        }  
  } 
}
