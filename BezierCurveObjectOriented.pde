Bpoint[] bpoints = new Bpoint [4];
Bcurve bc;

void setup() {
  for (int i = 0; i < bpoints.length; i++) {
    if (i == 0) {
      bpoints[i] = new Bpoint(200, 600, 30);
    }
    if (i == 1) {
      bpoints[i] = new Bpoint(600, 600, 30);
    }
    if (i == 2) {
      bpoints[i] = new Bpoint(600, 200, 30);
    }
    if (i == 3) {
      bpoints[i] = new Bpoint(200, 200, 30);
    }
  }
  size(800,800);
}

void draw() {
  background(204);
  for (int i = 0; i < bpoints.length - 1; i++) {
    stroke(180);
    line(bpoints[i].pointx(), bpoints[i].pointy(), bpoints[i + 1].pointx(), bpoints[i + 1].pointy());
  }
  for (int i = 0; i < bpoints.length; i++) {
    bpoints[i].display();
    }
    
      bc = new Bcurve(bpoints[0].pointx(),bpoints[0].pointy(),bpoints[1].pointx(),bpoints[1].pointy(),bpoints[2].pointx(),bpoints[2].pointy(),bpoints[3].pointx(),bpoints[3].pointy());
      bc.display();
    
}

void mouseDragged() {
  for (int i = 0; i < bpoints.length; i++) {
    if (bpoints[i].mouseover() == true) {
      bpoints[i].selected(150);
    }
  }
}

void mouseMoved() {
  for (int i = 0; i < bpoints.length; i++) {
    bpoints[i].unselected();
  }  
}

public class Bpoint {
  float x;
  float y;
  float diameter;
  int col = 204;
  
  Bpoint(float tx, float ty, float td) {
    x = tx;
    y = ty;
    diameter = td;
    
  }
  
  void display() {
    fill(col);
    stroke(180);
    strokeWeight(5);
    ellipse(x,y,diameter,diameter);
    
  }
  
  boolean mouseover() {
    if (dist(x,y,mouseX,mouseY) < 15) {
      return true;
    }
    return false;
  }
  
  float pointx() {
    return x;
  }
  
  float pointy() {
    return y;
  }
  
  void selected(int tempcol) {
    col = tempcol;
    x = mouseX;
    y = mouseY;
  }
  
  void unselected() {
    col = 204;
  }
  
}

class Bcurve {
  
  ArrayList<PVector> points = new ArrayList<PVector>();
  float x1, y1, x2, y2, x3, y3, x4, y4;
  float cx, cy;

    Bcurve(float tx1, float ty1, float tx2, float ty2, float tx3, float ty3, float tx4, float ty4) {
    x1 = tx1;
    y1 = ty1;
    x2 = tx2;
    y2 = ty2;
    x3 = tx3;
    y3 = ty3;
    x4 = tx4;
    y4 = ty4;
    
    
  }
  
  void display() {
    for (float t = 0.005; t < 1; t = t + 0.005) {
      cx = ((1 - t) * (1 - t) * (1 - t) * x1) + (3 * ((1 - t) * (1 - t)) * t * x2) + (3 * (1 - t) * (t * t) * x3) + ((t * t * t) * x4);
      cy = ((1 - t) * (1 - t) * (1 - t) * y1) + (3 * ((1 - t) * (1 - t)) * t * y2) + (3 * (1 - t) * (t * t) * y3) + ((t * t * t) * y4);
      
      points.add(new PVector(cx, cy));
    }
    
    stroke(0);
    beginShape();
    for (PVector v : points) {
      noFill();
      vertex(v.x,v.y);
    }
    endShape();
  }

}
