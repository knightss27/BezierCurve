Bpoint[] bpoints = new Bpoint [4];
Bcurve bc;
Button[] buttons = new Button [3];


void setup() {
  for (int i = 0; i < bpoints.length; i++) {
    if (i == 0) {
      bpoints[i] = new Bpoint(200, 600, 30);
    }
    if (i == 1) {
      bpoints[i] = new Bpoint(600, 600, 30);
    }
    if (i == 2) {
      bpoints[i] = new Bpoint(200, 200, 30);
    }
    if (i == 3) {
      bpoints[i] = new Bpoint(600, 200, 30);
    }
  }
  buttons[0] = new Button("Bezier Curves", 70, 20, 140, 40, 20);
  buttons[1] = new Button("Reset", 190, 20, 100, 40, 14);
  buttons[2] = new Button("", 520, 20, 560, 40, 20);
  size(800,800);
  rectMode(CENTER); 
  ellipseMode(CENTER);
}

void draw() {
  background(204);
  for (int i = 0; i < bpoints.length - 1; i++) {
    stroke(180);
    strokeWeight(5);
    line(bpoints[i].pointx(), bpoints[i].pointy(), bpoints[i + 1].pointx(), bpoints[i + 1].pointy());
  }
  for (int i = 0; i < bpoints.length; i++) {
    bpoints[i].display();
    bpoints[i].edgecheck();
    }
    
      bc = new Bcurve(bpoints[0].pointx(),bpoints[0].pointy(),bpoints[1].pointx(),bpoints[1].pointy(),bpoints[2].pointx(),bpoints[2].pointy(),bpoints[3].pointx(),bpoints[3].pointy());
      bc.display();
    
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}

//void mouseDragged() {
//  for (int i = 0; i < bpoints.length; i++) {
//    if (bpoints[i].mouseover() == true) {
//      bpoints[i].selected(150);
//    }
//  }
//}

void mouseDragged() {
  for (int i = 0; i < bpoints.length; i++) {
     for (int n = 0; n < bpoints.length; n++) {
       if ((dist(bpoints[i].pointx(),bpoints[i].pointy(),bpoints[n].pointx(),bpoints[n].pointy()) < 30) && (bpoints[i].mouseover() == true)) {
         if ((dist(bpoints[i].pointx(),bpoints[i].pointy(),bpoints[n].pointx(),bpoints[n].pointy()) == 0)) {
         } else {
                  if (bpoints[i].pointx() > bpoints[n].pointx()) {
                    bpoints[i].nodrag(bpoints[i].pointx() + 20);
                  }else {
                    bpoints[i].nodrag(bpoints[i].pointx() - 20);
                  }
         }
       } else {
         if (bpoints[i].mouseover() == true) {
           bpoints[i].selected(150);
         }
       }
  }
}
}

void mouseMoved() {
  for (int i = 0; i < bpoints.length; i++) {
    bpoints[i].unselected();
  }
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].mouseover() == true && i == 1) {
      buttons[i].selected(100);
    } else {
      buttons[i].unselected();
    }
    
  }
}

void mouseClicked() {
  if (buttons[1].mouseover() == true) {
      for (int i = 0; i < bpoints.length; i++) {
        if (i == 0) {
          bpoints[i] = new Bpoint(200, 600, 30);
        }
        if (i == 1) {
          bpoints[i] = new Bpoint(600, 600, 30);
        }
        if (i == 2) {
          bpoints[i] = new Bpoint(200, 200, 30);
        }
        if (i == 3) {
          bpoints[i] = new Bpoint(600, 200, 30);
        }
  }
  }
}

class Bpoint {
  float x;
  float y;
  float diameter;
  int col = 204;
  boolean drag = true;
  boolean moveagain = true;
  
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
    if ((dist(x,y,mouseX,mouseY) < 15) && (drag == true)) {
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
    moveagain = true;
    col = 204;
  }
  
  void nodrag(float newX) {
    if (moveagain == true) {
      moveagain = false;
      x = newX;
    } else {
      moveagain = true;
    }
  }
  
  void edgecheck() {
    if (y < 40) {
      y = 58;
    }
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
    strokeWeight(4);
    beginShape();
    for (PVector v : points) {
      noFill();
      vertex(v.x,v.y);
    }
    endShape();
  }

}

class Button {
  
  float x,y,w,h;
  String buttontext;
  PFont f;
  int fonts;
  int col = 150;
  

  Button(String tempt, float xt, float yt, float wt, float ht, int fontst) {
    buttontext = tempt;
    x = xt;
    y = yt;
    h = ht;
    w = wt;
    fonts = fontst;
  }
  
  void display() {
    
    strokeWeight(3);
    stroke(170);
    fill(col);
    rect(x,y,w,h);
    
    fill(255);
    f = createFont("Arial",fonts,true);
    textFont(f,18);
    textAlign(CENTER, CENTER);
    text(buttontext, x, y);
    
  }

    boolean mouseover() {
    if ((dist(x, 0, mouseX, 0) < w/2) && (dist(0, y, 0, mouseY) < h/2)) {
      return true;
    }
    return false;
  }
  
    void selected(int tempcol) {
    col = tempcol;
  }

    void unselected() {
    col = 150;
  }
}
