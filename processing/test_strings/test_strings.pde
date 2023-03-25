String[] lines;
PFont font1;
BufferedReader reader;
String test = "Suprema riuscita. Propizio oracolo per una cavalla.\nPer un signore con un luogo in cui andare:\nse tenta di fare da guida si disorienta,\nse segue trova la guida: propizio. Trova amici ad ovest ed a sud, ma li perde ad est ed a nord. Oracolo per chi è in pace: fausto.";

void setup() {
    size(640,480);
    fullScreen();
    font1 = loadFont("./data/ArialNarrow-Bold-128.vlw");
    //reader = loadStrings("./data/sentences.txt");
    reader = createReader("./data/sentences.txt");
    //textFont(font1, 128);
    textAlign(CENTER);
    text(test, width / 2.0, height / 2.0 - 192);
    //textFont(font1, 128);
}

void draw() {
  ;   
}
