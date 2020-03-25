int dragX, dragY, dragX2, dragY2, dragX3, dragY3, dragX4, dragY4;
boolean pastdrag, pastdrag2, pastdrag3, pastdrag4;
int scol, scol2, scol3, scol4;
float cx, cy;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(800, 800);
  dragX = 200; 
  dragY = 600;
  dragX2 = 600;
  dragY2 = 600;
  dragX3 = 600;
  dragY3 = 200;
  dragX4 = 200;
  dragY4 = 200;
  scol = 204;
  scol2 = 204;
  scol3 = 204;
  scol4 = 204;
  
}

void draw() {
  
  background(204);
  points.clear();
  for (float t = 0.005; t < 1; t = t + 0.005) {
  cx = ((1 - t) * (1 - t) * (1 - t) * dragX) + (3 * ((1 - t) * (1 - t)) * t * dragX2) + (3 * (1 - t) * (t * t) * dragX3) + ((t * t * t) * dragX4);
  cy = ((1 - t) * (1 - t) * (1 - t) * dragY) + (3 * ((1 - t) * (1 - t)) * t * dragY2) + (3 * (1 - t) * (t * t) * dragY3) + ((t * t * t) * dragY4);
  
  // cx = ((1 - t) * (1 - t) * dragX) + (2 * (1 - t) * t * dragX2) + ((t * t) * dragX3);
  //cy = ((1 - t) * (1 - t) * dragY) + (2 * (1 - t) * t * dragY2) + ((t * t) * dragY3);
  points.add(new PVector(cx, cy));
  }
  
  stroke(180);
  strokeWeight(5);
  line(dragX, dragY, dragX2, dragY2);
  line(dragX2, dragY2, dragX3, dragY3);
  line(dragX3, dragY3, dragX4, dragY4);


  fill(scol);
  ellipse(dragX, dragY, 30, 30);
  fill(scol2);
  ellipse(dragX2, dragY2, 30, 30);
  fill(scol3);
  ellipse(dragX3, dragY3, 30, 30);
  fill(scol4);
  ellipse(dragX4, dragY4, 30, 30);
  

  stroke(0);
  beginShape();
  for (PVector v : points) {
    noFill();
    vertex(v.x,v.y);
    }
  endShape();
  
}

void mouseMoved() {
  pastdrag = false;
  pastdrag2 = false;
  pastdrag3 = false;
  pastdrag4 = false;
  scol = 204;
  scol2 = 204;
  scol3 = 204;
  scol4 = 204;
}

void mouseDragged() { // Move black circle
  if (pastdrag == true) {
    dragX = mouseX;
    dragY = mouseY;
    scol = 140;
  } else {
    if (((mouseX > (dragX - 15)) && (mouseX < dragX) || ((mouseX < (dragX + 15)) && (mouseX > dragX))) && ((mouseY > (dragY - 15)) && (mouseY < dragY) || ((mouseY < (dragY + 15)) && (mouseY > dragY)))) {
      dragX = mouseX;
      dragY = mouseY;
      pastdrag = true;
      scol = 140;
    } else {
    }
  }
  if (pastdrag2 == true) {
    dragX2 = mouseX;
    dragY2 = mouseY;
    scol2 = 140;
  } else {
    if (((mouseX > (dragX2 - 15)) && (mouseX < dragX2) || ((mouseX < (dragX2 + 15)) && (mouseX > dragX2))) && ((mouseY > (dragY2 - 15)) && (mouseY < dragY2) || ((mouseY < (dragY2 + 15)) && (mouseY > dragY2)))) {
      dragX2 = mouseX;
      dragY2 = mouseY;
      pastdrag2 = true;
      scol2 = 140;
    } else {
    }
  }
    if (pastdrag3 == true) {
    dragX3 = mouseX;
    dragY3 = mouseY;
    scol3 = 140;
  } else {
    if (((mouseX > (dragX3 - 15)) && (mouseX < dragX3) || ((mouseX < (dragX3 + 15)) && (mouseX > dragX3))) && ((mouseY > (dragY3 - 15)) && (mouseY < dragY3) || ((mouseY < (dragY3 + 15)) && (mouseY > dragY3)))) {
      dragX3 = mouseX;
      dragY3 = mouseY;
      pastdrag3 = true;
      scol3 = 140;
    } else {
    }
  }
    if (pastdrag4 == true) {
    dragX4 = mouseX;
    dragY4 = mouseY;
    scol4 = 140;
  } else {
    if (((mouseX > (dragX4 - 15)) && (mouseX < dragX4) || ((mouseX < (dragX4 + 15)) && (mouseX > dragX4))) && ((mouseY > (dragY4 - 15)) && (mouseY < dragY4) || ((mouseY < (dragY4 + 15)) && (mouseY > dragY4)))) {
      dragX4 = mouseX;
      dragY4 = mouseY;
      pastdrag4 = true;
      scol4 = 140;
    } else {
    }
  }
}
