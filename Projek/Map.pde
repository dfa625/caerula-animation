int kx = 0;
int ky = 0;

void mapCity(int x, int y, int col, String s){
noStroke();
fill(col);
ellipse(x, y, 10, 10);
teks(x - 100, y - 20, s, col, 64, 0 ); 
}

void human(int x, int y, float skala){
  fill(255);
ellipseMode(CENTER);
rectMode(CENTER);
//ellipse(x, y, 30 * skala, 30 * skala);
kepala(x+kx,y+ky,skala);
rect(x, y + 50 * skala, 30 * skala, 60 * skala);
rectMode(CORNERS);

rect(x + 20 * - skala, y + 20 * skala, x + 30* - skala, y + 60*skala);
rect(x + 20 * skala, y + 20 * skala, x + 30 * skala, y + 60 * skala);
rect(x + 15 * - skala, y + 85 * skala, x + 5 * - skala, y + 135 * skala);
rect(x + 15 * skala, y + 85 * skala, x + 5 * skala, y + 135 * skala);

}

void kepala (int x, int y, float skala){
  
ellipse(x, y, 30 * skala, 30 * skala);


}
void cityUnderwater(){
  int w = 500;
  int h = 300;
fill(255,50);
stroke(255);
strokeWeight(5);
arc(250, h, w+100, h*2, PI, TWO_PI); 

fill(255);
//ellipse(random(w), random(250), 2, 2);
noStroke();

//background buildings
fill(55);
rect(0,270,20,30);
rect(100,240,20,300);
triangle(100,220,100,240,120,240);
rect(110,190,10,300);
rect(160,150,20,300);
rect(190,90,30,300);
rect(230,100,10,300);
rect(280,110,10,300);
ellipse(285,110,10,10);
rect(320,190,30,300);
rect(360,220,20,300);
rect(430,250,10,300);
rect(460,280,30,300);
ellipse(475,280,30,30);
triangle(375,300,400,220,425,300);
//nextbuildings
fill(125);
rect(20,250,20,300);
rect(70,200,30,300);
rect(120,170,50,300);
fill(150);
rect(125,175,15,25);
rect(150,175,15,25);
rect(125,210,15,25);
rect(150,210,15,25);
rect(125,245,15,25);
rect(150,245,15,25);
rect(125,280,15,25);
rect(150,280,15,25);

fill(125);
rect(180,140,40,300);
ellipse(200,140,40,40);
rect(340,180,30,300);
triangle(340,150,340,180,370,180);
rect(435,280,40,300);
rect(280,220,50,300);
rect(295,150,20,300);
rect(400,260,30,300);

//kindafrontbuildings
fill(160);
rect(40,260,30,300);
rect(50,210,10,300);
rect (240,30,40,300);
fill(225);
//windows
rect(245,35,10,10);
rect(265,35,10,10);
rect(245,50,10,10);
rect(265,50,10,10);
rect(245,65,10,10);
rect(265,65,10,10);
rect(245,80,10,10);
rect(265,80,10,10);
rect(245,95,10,10);
rect(265,95,10,10);
rect(245,110,10,10);
rect(265,110,10,10);
rect(245,125,10,10);
rect(265,125,10,10);
rect(245,140,10,10);
rect(265,140,10,10);
rect(245,155,10,10);
rect(265,155,10,10);
rect(245,170,10,10);
rect(265,170,10,10);
rect(245,185,10,10);
rect(265,185,10,10);
rect(245,200,10,10);
rect(265,200,10,10);
rect(245,215,10,10);
rect(265,215,10,10);
rect(245,230,10,10);
rect(265,230,10,10);
rect(245,245,10,10);
rect(265,245,10,10);
rect(245,260,10,10);
rect(265,260,10,10);
rect(245,275,10,10);
rect(265,275,10,10);
rect(245,290,10,10);
rect(265,290,10,10);





fill(160);
rect(440,240,20,250);



//front front
fill(215);
rect(100,200,10,300);
rect(50,250,25,300);
rect(90,219,25,300);
rect(160,270,40,300);
triangle(160,270,180,210,200,270);
rect(210,180,40,300);
fill(80);

rect(215,195,10,30);
rect(230,210,10,30);
rect(215,230,10,30);
rect(230,250,10,30);
fill(235);
triangle(260,300,280,260,300,300);
rect(340,280,40,300);
ellipse(360,280,40,40);
rect(480,290,10,300);

}

void drawSea(float startX, float startY) {
  float amplitude = 20; // amplitude of the wave
  float wavelength = 320; // wavelength of the wave
  float frequency = TWO_PI / wavelength; // frequency of the wave

  // Draw the area above the wave
  noStroke();
  fill(240, 240, 240);
  beginShape();
  vertex(startX, 0); // starting point at the top of the canvas
  for (float x = startX; x <= width; x++) {
    float y = startY + amplitude * sin(frequency * (x - startX));
    vertex(x, y);
  }
  vertex(width, 0); // top right corner of the canvas
  endShape(CLOSE);

  // Draw the sine wave
  stroke(0);  
  strokeWeight(2);
  noFill();
  beginShape();
  for (float x = startX; x <= width; x++) {
    float y = startY + amplitude * sin(frequency * (x - startX));
    vertex(x, y);
  }
  endShape();
}
