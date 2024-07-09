int currentIndex = 0;
int displayRate = 5;

void teks(float x, float y, String s, int strokecolor, int size, int tipe){
  fill(strokecolor);
stroke(strokecolor);

switch (tipe){
  case 0: textFont(font); break;
  case 1: textFont(font2); break;
  case 2: textFont(font3); break;
}

textSize(size);
  if (frameCount % displayRate == 0 && currentIndex < s.length()) {
    currentIndex++;
  }
    int endIndex = min(currentIndex, s.length());
  text(s.substring(0, endIndex), x, y);

}

void drawWave(float startX, float startY, int some) {
  stroke(255);  
  strokeWeight(2);
  noFill();
  
  for (int i = 0; i < some; i++) {  // Draw some continuous wave shapes
    float x = startX + i * waveWidth;
    beginShape();
    vertex(x, startY + waveHeight);
    vertex(x + waveWidth / 2, startY);
    vertex(x + waveWidth, startY + waveHeight);
    endShape();
  }
}
void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

void perbatasan(int x, int y) {
  // Draw the grey shaded area
  fill(255);
  noStroke();
  beginShape();
  vertex(0, 0); // Top left corner
  vertex(0, 2 * height / 3); // First point of the curve
  bezierVertex(width / 4, height / 6, 2 * width / 3, 5 * height / 6, 7 * width / 8, height - height); // Curve points
  vertex(width, 0); // Top right corner
  translate(x, y);
  endShape(CLOSE);

  // Draw the curve
  stroke(0);
  strokeWeight(5);
  noFill();
  beginShape();
  vertex(0, 2 * height / 3); // First point of the curve
  bezierVertex(width / 4, height / 6, 2 * width / 3, 5 * height / 6, 7 * width / 8, height - height); // Curve points
  translate(x, y);
  endShape();
}


// Pathfinder class
class Pathfinder {
  PVector location;
  PVector velocity;
  float diameter;

  Pathfinder() {
    location = new PVector(width / 2, height);
    velocity = new PVector(0, -1);
    diameter = 32;
  }

  Pathfinder(Pathfinder parent) {
    location = parent.location.copy();
    velocity = parent.velocity.copy();
    float area = PI * sq(parent.diameter / 2);
    float newDiam = sqrt(area/2/PI) * 2;
    diameter = newDiam;
    parent.diameter = newDiam;
  }

  void update() {
    if (diameter>0.5) {
      location.add(velocity);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));
      bump.mult(0.1);
      velocity.add(bump);
      velocity.normalize();
      if (random(0, 1)<0.02) {
        paths = (Pathfinder[]) append(paths, new Pathfinder(this));
      }
    }
  }}
  
void cloud(float noiseOff, float baseY, float maxOff) {
  float x = -maxOff;
  beginShape();
  while (x < width + maxOff) {
    float yOffset = noise(x * 0.01f + frameCount / 1000.0f + noiseOff, baseY) * maxOff;
    float y = baseY - yOffset;
    float dia = (noise(x * 0.01f, baseY * 0.01f) + 0.1f) * maxOff;
    ellipse(x, y, dia, dia);
    vertex(x, y);
    x += dia * 0.35;
  }
  vertex(width, baseY);
  vertex(width, height);
  vertex(0, height);
  vertex(0, baseY);
  endShape(CLOSE);
}
