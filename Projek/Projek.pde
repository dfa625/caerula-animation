
int nx = 0;
int ny = 0;
int buffer = 1;
int bufferx = 2; 
int buffery = 4;
int pantul = 0;

int count = 20; //first monster stuff
float inc = 0;
float m=0; //4th monster variables start
float i=0;
float Vp=0;
float Vb=0;
float Vm=0;
float jfx=width*8; 
float jfy=height*3; //monster 4 end
Tentacle[] tentacles; //monster 1
starfish myStarfish; //monster 2
Jfish q = new Jfish(0, ""); //monster 4
int t, t2, t3, t4, takhir;
int waveWidth = 40;
int waveHeight = 10;
int landHeight = 200;  
ArrayList<Branch> branches = new ArrayList<Branch>();
int fillColor = 255, backgroundColor = 0, maxSize = 65;
boolean doOnce = true;
Pathfinder[] paths;
boolean initializedBeach = false;
int penx = 0;
int peny = 0;
int de = 2;
int el0 = 0;
PFont font, font2, font3; 
int by;
int sum = 10;

void setup() {
  size(1600, 900);
  myStarfish = new starfish();
  begin();
  t3 = 0;
  sound();
  //printArray(PFont.list());
  font = createFont("FantaisieArtistique.ttf", 72);
  font2 = createFont("OldStandardTT-Regular.ttf", 72);
  font3 = createFont("AegirSeaborn.ttf" , 72);
  smooth();
  frameRate(24);
  background(0);
  ellipseMode(CENTER);
  //noStroke();
  // Initialize pathfinder array
  paths = new Pathfinder[1];
  paths[0] = new Pathfinder();
   stroke(255, 0, 0, 65);
  for (int i = 0; i < 65; i++) {
    branches.add(new Branch());
  }

}

void draw() {
  t++;
  playSound();

switch (t / 300) {
    case 0:
      sceneIberia();
      break;
    case 1:
       sceneAegir();
      break;
    case 2:
      sceneUnderwaterCity();
      break;
    case 3:
      aegirBroadcast();
      break;
    case 4:
      aegirBroadcast();
      break;
    case 5:
      aegirBroadcast();
    case 6:
       aegirBroadcast();
      break;
    case 7:
      aegirFallen();
       break;
    case 8:
       aegirFallen();

      break;
    case 9:       
      aegirFallen();
      break;
    case 10:
      sceneTree();

       break;
    case 11:
       sceneTree();

       break;
    case 12:
      sceneTree();
     break;
    case 13:        
      sceneTree();
     break;
    case 14:
        sceneBeach();

     break;
     case 15:
         sceneBeach();
     break;
     case 16:
         sceneBeach();
     break;
     case 17:
         sceneBeach();
     break;
     case 18:
         sceneBeach();
     break;
     case 19:
         sceneBeach();
     break;
    default:
      // Handle other cases or do nothing
      break;
  }
  
  if (t == 300) {
    currentIndex = 0;
  }

}

void sceneIberia() {

  background(0);
  int p = (t <= 230) ? 5 * (t - 100) : 600;
  int o = t <= 160 ? 0 : p;
  perbatasan(0, -o);

  drawWave(t + width / 40, 7 * height / 9, sum);
  drawWave(-t + width / 2, 8 * height / 9, sum);
  drawWave(t + width * 7 / 8, height / 2, sum);
  drawWave(-t + width / 2, 4 * height / 3, sum);
  drawWave(-t + width * 7 / 8, 3 *height / 2, sum);
  drawWave(-t + width / 2, 8 * 11 * height / 9, sum);
  drawWave(-t + width * 7 / 8, 3 * height / 2, sum);
  if (t >= 15) {
    teks(width / 8, height * 2 / 9, "IBERIA", 0, 180, 0);
  }

  if (t >= 50) {
    mapCity(width / 10, height * 4 / 9, 0, "Sal Viento");
    mapCity(width * 7 / 10, height / 9, 0, "Miraplata");

  }

  if (t >= 100) {
    strokeWeight(3);
    stroke(255);
    line(width * 5 / 12, height * 5 / 9, width * 7 / 12, height * 5 / 9);
    line(width / 2, height * 5 / 9, width / 2, p + height * 8 / 9);
    line(width * 5 / 12, p + height * 8 / 9, width * 7 / 12, p + height * 8 / 9);
    teks(20 + width / 2, p - 120 + height, p * 10 + "M", 255, 72, 1);
  }
}

void sceneAegir() {
  background(0);
  t2++;

  if (t < 420) {
  teks(width / 3, height / 2, "AEGIR", 255, 180, 0);}
  
  else {
  mapCity(width / 4, height / 5, 255, "Millarium");
  mapCity(width * 5 / 6, height * 3/4, 255, "Typhril");
  mapCity(width / 2, height / 2, 255, "Coaria");
  mapCity(width * 3 / 8, height * 7 / 10, 255 ,"Belimon");
  mapCity(width * 5 / 8, height * 4/ 10, 255, "Nauloch");
  }
  drawWave((width / 4) - t2, height / 4, sum);
  drawWave((3 * width / 4) - t2, 3 * height / 4, sum);
  drawWave((width / 4) - t2, 3 * height / 4, sum);
  drawWave((3 * width / 4) - t2, height / 4, sum);
 
  
}

void sceneUnderwaterCity() {
  background(0);
  pushMatrix();
  translate(width / 3, height * 6 / 9);
  cityUnderwater();
  popMatrix();
  int xStart = -t % 320;
  stroke(240);
  drawSea(xStart, height / 6);
    if (t >= 650) {
    int p = t <= 800? 5*(t - 650) : 700;
    strokeWeight(3);
    stroke(255);
    line(width * 1 / 12, height * 2 / 9, width * 1 / 4, height * 2 / 9);
    line(width / 6, height * 2 / 9, width / 6,  p + height * 2 / 9);
    line(width * 1 / 12, p + height * 2 / 9, width * 1 / 4, p + height * 2 / 9);
    teks(200 + width / 12, height * 1 / 3, p  + "M", 255, 72, 1);
  }
}

void aegirBroadcast(){
  background(0);
  t3++;
  
  switch(t3 / 150) {
    default:
    background(0);
    break;
  case 0: 
    teks(0, height/4, "EMERGENCY", 255, 240, 1);
    teks(0, height*3/4, "BROADCAST", 255, 255, 1);
    break;
  case 1:
    teks(width/10, height/4, "SEABORNS", 255, 255, 1);
    teks(width/8, height*3/4, "INVASION", 255, 255, 1);
    break;
   case 2:
    teks(width/16, height / 9, "SE-001", 255, 72, 1);
    teks(width*3/4, height / 9, "INGUBHEN", 255, 72, 2);
    summonTentacle(0, 0 , 1 );
    break;
   case 3:
    teks(width/16, height / 9, "SE-017", 255, 72, 1);
    teks(width*3/4, height / 9, "Z'ITHL'LA", 255, 72, 2);
    summonStarfish(0, 0, 1);
    break;
   case 4:
     teks(width/16, height / 9, "SE-041", 255, 72, 1);
     teks(width*3/4, height / 9, "IMLUXORH", 255, 72, 2);
     summonBranch(width/2, height, 1);
     break;
    case 5:
     teks(width/16, height / 9, "SE-089", 255, 72, 1);
     teks(width*3/4, height / 9, "CXICTOXZ", 255, 72, 2);
     summonJellyfish(-width/2, 0, 2);
     break;
    case 6:
     teks(width/4, height/4, "DO NOT", 255, 255, 1);
     teks(width/12, height*11/20, "APPROACH", 255, 255, 1);
     teks(width/4, height*7/8, "THEM", 255, 255, 1);
     break;
    case 7:
    teks(width/3, height/2, "RUN", 255, 255, 1);
    break;
  }  
}

void aegirFallen(){
  background(0);
  int day = (t - 2100)/10;

  noStroke();
  fill(64,0,0);
  ellipse(width, height, t-1800, t-1800);
  
  mapCity(width / 4, height / 5, 255, "Millarium");
  mapCity(width * 5 / 6, height * 3/4, 255, "Typhril");
  mapCity(width / 2, height / 2, 255, "Coaria");
  mapCity(width * 3 / 8, height * 7 / 10, 255 ,"Belimon");
  mapCity(width * 5 / 8, height * 4/ 10, 255, "Nauloch");
  
  drawWave((width / 4) - day, height / 4, sum);
  drawWave((3 * width / 4) - day, 3 * height / 4, sum);
  drawWave((width / 4) - day, 3 * height / 4, sum);
  drawWave((3 * width / 4) - day, height / 4, sum);
  
  drawWave(width + (width / 4) - day, height / 4, sum);
  drawWave(width + (3 * width / 4) - day, 3 * height / 4, sum);
  drawWave(width + (width / 4) - day, 3 * height / 4, sum);
  drawWave(width + (3 * width / 4) - day, height / 4, sum);
  
  teks(2*width/3, height / 9,day + " DAYS", 255, 72, 1);
}

void sceneTree() {
  t4++;
  
  fill(255);
  noStroke();
  //background(0);
  if(kx >= -200){
    background(0);
    human(width+nx,height/2+200+ny,2);
  
  if(bufferx != 0){
    //background(0);
    //human(width+nx,height/2+200+ny,2);
    if(bufferx != 0){
      if(nx == -width/2){
        bufferx = 0;
        buffer = 0;
    }
      nx = nx - bufferx;
      ny = ny + buffer; 
      //println(nx);
      //println(-width/2);
      if(ny == 50){
        buffer = -1;
        
      }else if (ny == 0){
        buffer = 1;
      }
    
    }
  
  }else if(kx >= -90){
    kx--;
    println(kx);
    if(ky<10 && pantul == 0){
    ky++;
    }else if(kx<=-60 && pantul ==0){
    ky++;
    }
  
  
  
  }else{
    ky += buffery;
    if(kx >= -200){
      kx -= 1;
    }
    if(ky >= 70 && pantul == 0){
      buffery = -2;
      pantul++;
    }else if(ky <= 50 && pantul == 1){
      buffery = 1;      
      pantul++;
    }else if ( ky >=70 && pantul == 2){
      buffery = 0;
      pantul++;
    }
  
  }
  
  }else{
  
  for (int i = 0; i < paths.length; i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    ellipse(loc.x, loc.y, diam, diam);
    paths[i].update();
  }
  }
}

int seedNum;
PGraphics noiseImg;

void sceneBeach() {
  rectMode(CORNER);
  if (!initializedBeach) {
    noiseImg = createGraphics(width, height);
    noiseImg.noStroke();
    noiseImg.fill(0);
    noiseImg.beginDraw();
    for (int i = 0; i < width * height * 0.3; i++) {
      float x = random(width);
      float y = random(height);
      float d = noise(0.01f * x, 0.01f * y) * 0.5f + 1;
      noiseImg.ellipse(x, y, d, d);
    }
    noiseImg.endDraw();
    seedNum = int(random(10000));
    initializedBeach = true;
  }

  if (frameCount % 120 == 0) {
    randomSeed(1);
  } 
  randomSeed(seedNum);
  background(0);
  noStroke();
  fill(255);
  cloud(-random(1000), height / 2 - height * 0.1, height * 0.2);
  image(noiseImg, 0, -height * 0.05);
  image(noiseImg, 0, -height * 0.1);
  cloud(0, height / 2, height * 0.225);
  image(noiseImg, 0, 0);
  cloud(-random(1000), height / 2 + height * 0.1, height * 0.25);
  
  fill(0);
  rect(0, height / 2, width, height);
  
  fill(255);
  float frameRatio = frameCount % 100 / 100.0f;
  for (float y = height / 2 + 5; y < height; y += map(y, height / 2, height, 5, 25)) {
    float span = map(y, height / 2, height, 10, 50);
    //fill(0);
    //if (random(1) < 0.15) ellipse(random(width), y, span * random(5, 10), span * random(2, 6));

    fill(255);
    for (float x = noise(y, frameCount * 0.005f) * -20 - frameRatio * span; x < width; x += span) {
      rect(x, y, span * 0.5, 1);
    }
  }


}

void sceneAkhir(){
  takhir++;
  background(0);
  if(takhir<1200){
    summonJellyfish(-width/2,-height/10-takhir, 2);
    summonJellyfish(-width/2-400,-height/10+200-takhir, 2);
    summonJellyfish(-width/2-800,-height/10+400-takhir, 2);
  }

}


void stop(){
minim.stop();
}
 
