class Branch {
  float segments, startAngle, angle, theta, num;
  Branch() {
    segments = random(30, 100);
    startAngle = random(-90, 90);
    angle = map(startAngle, -90, 90, -10, 10);
  }

  void branch(float len) {
    len *= 0.85;  // Increase the scaling factor to make tentacles longer
    float t = map(len, 1, 70, 1, 10);
    theta = angle + sin(len + num) * 5;
    strokeWeight(t);
    line(0, 0, 0, -len);
    ellipse(0, 0, t, t);
    translate(0, -len);
    if (len > 5) {
      pushMatrix();
      rotate(radians(-theta));
      branch(len);
      popMatrix();
    } else {
      for (int i = 0; i < 360; i += 30) {
        float x = sin(radians(i)) * 10;
        float y = cos(radians(i)) * 10;
        line(0, 0, x, y);
      }
    }
    num += 0.003;
  }
}

class Tentacle{ //tentacle monster
  private float[] a = new float[3];
  private float[] b = new float[3];
  private float[] c = new float[3];
  private float tLength;
  private float stepSize;
  private float tRotate;
  private int   alpha;
  
  Tentacle(){
    for(int i=0;i<3;i++){
      a[i] = random(0.005,0.03);
      b[i] = random(0,TWO_PI);
      c[i] = random(2,50); 
    }
    tRotate = random(-PI,PI);
    float scale = cos(tRotate+HALF_PI)+1.5;
    tLength = height*random(0.2,0.3)*scale;
    stepSize = 5;
    alpha = int(random(30,100));
  }
  
  void drawTentacle(){
    float x,y;
    x = 0;
    pushMatrix();
    translate(width/2,height/5*4);
    rotate(tRotate);
    stroke(255,alpha);
    while(x<tLength){
      float r = map(x,0,tLength,30,1);
      float A = map(x,0,tLength,0,1);
      y = sin(a[0]*x+b[0]+inc)*c[0] + sin(a[1]*x+b[1]+inc)*c[1] + sin(a[2]*x+b[2]+inc)*c[2];
      y = y*A;
      ellipse(x,y,r,r);
      if(r>15)
      stepSize = r/10;
      x += stepSize;
    }
    popMatrix();
  }
  
}

void begin(){
  tentacles = new Tentacle[count];
  for(int i=0;i<count;i++){
    tentacles[i] = new Tentacle();
  }
}

void summonTentacle(int x, int y, float skala){
  pushMatrix();
  translate(x, y);  
  scale(skala);  
  noFill();
  inc -= 0.08; 
  for(int i=0;i<count;i++){
    tentacles[i].drawTentacle();
  }
  popMatrix();
}

void summonBranch(float x, float y, float skala){
  noFill();
  for (int i = 0; i < branches.size(); i++) {
    Branch b = (Branch) branches.get(i);
    pushMatrix();
    translate(x, y);
    scale(skala);
    rotate(radians(b.startAngle));
    b.branch(b.segments);
    popMatrix();
  }

}

void summonStarfish(int x, int y, float skala){
    pushMatrix();
  translate(x, y);
  scale(skala);  
  myStarfish.starfishMove();
  popMatrix();
}

void summonJellyfish(int x, int y, float skala){
  pushMatrix();
  translate(x, y);  
  scale(skala);  
  ellipseMode(2); //monster 4 stuff
  rectMode(2);
  textSize(15);
  noStroke(); //until here monster4
  fill(255);
  q.update();
  m+=0.1;
  popMatrix();
}
