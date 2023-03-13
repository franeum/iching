import oscP5.*;
import netP5.*;

float fragment;
OscP5 oscP5;
NetAddress myRemoteLocation;

int row, bar;
boolean exagram;

void setup() {
  size(640,480);
  fullScreen();
  rectMode(CENTER);
  
  noStroke();
  
  fragment = height / 8.0;
  oscP5 = new OscP5(this, 12000);
  //myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  
  background(51, 102, 153);
}

void draw() {
  if (exagram) {
    println("exa");
    draw_bar(row, bar);
    exagram = false;
  }
}

void draw_bar(int n, int kind) {
  println("ciao");
  if (n == 0)
    background(51, 102, 153);
  if (kind == 0)
    rect(width * 0.5, fragment*n + fragment*1.5, width / 2.0, height / 14.0);  
  else {
    rect(width * 0.35, fragment*n + fragment*1.5, width / 5.0, height / 14.0);
    rect(width * 0.65, fragment*n + fragment*1.5, width / 5.0, height / 14.0);
  }
}

void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkAddrPattern("/test") == true) {
    
    if(theOscMessage.checkTypetag("ff")) {
      
      float row_number = theOscMessage.get(0).floatValue(); 
      float f_bar = theOscMessage.get(1).floatValue(); 
      
      println("row: " + row_number + " kind of bar: " + f_bar);
      
      //draw_bar((int)row_number, (int)bar);
      row = (int)row_number;
      bar = (int)f_bar;
      println(row, bar);
      exagram = true;
      
      return;
    }  
  } 
  //println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}
