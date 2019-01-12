//Dot[] dots;
ArrayList<Dot> dots;
int size=200;
int VAR=175;
int upperHue;
int lowerHue;
int sWeight=2;

void setup() {
  size(1600, 1600);
  colorMode(HSB);

  dots=new ArrayList<Dot>();
  for (int x=0; x<size; x++) {
    dots.add(new Dot(lowerHue, upperHue));
  }
  //VAR+=100;

  upperHue=int(random(230));
  lowerHue=int(random(lowerHue, 255));
  strokeWeight(sWeight);
  background(0);
}

void draw() {

  //background(0);

  drawLines();
  for (Dot d : dots) {
    d.update();
  }
  //saveFrame("####.tiff");
  if (dots.size()>0) {
    dots.remove(0);
  } else {
    saveFrame("colors/num"+size+"-S"+sWeight+"-V"+VAR+"-####.tiff");
    setup();
  }
}

// i know this is probably terrible efficiency and super redundant 
void drawLines() {
  stroke(0, 0, 255, 120);
  for (Dot a : dots) {
    for (Dot b : dots) {
      if (!b.equals(a)) {
        if (b.collidesWith(a, VAR)) {

          line(b.x, b.y, a.x, a.y);
        }
      }
    }
  }
}
