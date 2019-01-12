class Dot {
  // radius to check for other dots to connect to
  //int VAR=60;

  int x, y, w;
  float dir, xspeed, yspeed;
  int lowerHue, upperHue;
  color c=color(int(random(255)), 255, 255);

  Dot(int lowerH,int upperH) {
    x=int(random(width));
    y=int(random(height));
    dir=(random(0, PI*2));
    float rand=random(.6, 2);
    xspeed=cos(dir)*rand;
    yspeed=sin(dir)*rand;
    w=10;
    lowerHue=lowerH;
    upperHue=upperH;
  }

  boolean collidesWith(Dot other, int VAR) {
    float distance=dist(x, y, other.x, other.y);
    if (distance<VAR) {
      int brightness=int(map(distance, 0, VAR, 300,0));
      //int hue=int(map(distance, 0, VAR, 90,170));
      int hue=int(map(distance, 0, VAR, lowerHue,upperHue));
      stroke(hue, 255, brightness);
    }
    return distance<VAR;
  }

  void update() {
    x+=xspeed;
    y+=yspeed;

    //bounds
    if (x<=0) {
      x=width;
    } else if (x>width) {
      x=0;
    }

    if (y<=0) {
      y=height;
    } else if (y>height) {
      y=0;
    }
    //noStroke();
    //fill(255,200);
    //ellipseMode(CENTER);
    //ellipse(x, y, w, w);
  }
}
