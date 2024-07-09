//Monster 4
class Jfish {

  String construct="";
  String[] construct2={};
  float Bl, BL, Bl2, BL2, Br, Bd, l, c, L, d, nb, NB;
  int c1, c2, c3, c4, c5, c6, c7;

  Jfish(int a, String b) {  
    
    m=0;
    
    if (b!=""){randomSeed(b.hashCode());}

    if (a!=1) {
      Bl=random(20, 100);
      BL=random(20, 100);
      Bl2=random(20, 90);
      BL2=random(20, 90);
      Br =random(100, 300);
      Bd =random(-90, 90);
      l=random(20, 85);
      c=random(0.6, 2);
      L=random(7, 13);
      d=random(1, L);
      nb=random(1, 19);
      NB=nb;
      c1 = int(random(0, 255));
      c2 = int(random(0, 255));
      c3 = int(random(0, 255));
      c4 = int(random(90, 220));
      c5 = c1+int(random(-5, 2));
      c6 = c2+int(random(-5, 2));
      c7 = c3+int(random(-5, 2));
    }

    if (a==1) {
      construct2=b.split(" ");

      Bl=float(construct2[0]);
      BL=float(construct2[1]);
      Bl2=float(construct2[2]);
      BL2=float(construct2[3]);
      Br=float(construct2[4]);
      Bd=float(construct2[5]);
      l=float(construct2[6]);
      c=float(construct2[7]);
      L=float(construct2[8]);
      d=float(construct2[9]);
      nb=float(construct2[10]);
      NB=nb;
      c1 = int(construct2[11]);
      c2 = int(construct2[12]);
      c3 = int(construct2[13]);
      c4 = int(construct2[14]);
      c5 = int(construct2[15]);
      c6 = int(construct2[16]);
      c7 = int(construct2[17]);
    }
  }

  void update() {

    nb=NB;

    //Body
    //fill(c1, c2, c3, c4); //COLORS
    fill(255); //WHITE
    rect(jfx, jfy, Bl, BL, Br);
    ellipse(jfx, jfy+(Bd*BL/100), Bl2, BL2);
    rect(jfx, jfy, Bl, BL, Br);

    //Tentacles
    //fill(c5, c6, c7, c4); //COLORS
    fill(255); //WHITE
    if (nb%2!=0) {
      while (i<l) {
        ellipse(jfx+sin(m)+(i*sin(-m+(i*c)/(l/(2*PI)))), jfy+better(Bl/2, Bl2/2,0)+L+5*i, L-d/l*i, L-d/l*i);
        i+=1;
      }
    }
    nb-=1;

    while (nb>0) {
      i=0;
      while (i<l) {
        ellipse(jfx+(nb*BL/(2*NB+4))+2*nb-sin(m)-(i*sin(-m+(i*(c-nb/NB/2))/(l/(2*PI))))+i*cos(0.2*nb*3-PI/2), jfy-nb+better(Bl/2, Bl2/2,0)+5*i+i*sin(0.2*nb*3-PI/2), L-d/l*i, L-d/l*i);
        i+=1;
      }
      i=0;
      while (i<l) {
        ellipse(jfx-(nb*BL/(2*NB+4))-2*nb+sin(m)+(i*sin(-m+(i*(c-nb/NB/2))/(l/(2*PI))))+i*cos(-0.2*nb*3-PI/2), jfy-nb+better(Bl/2, Bl2/2,0)+5*i+i*sin(-0.2*nb*3-PI/2), L-d/l*i, L-d/l*i);
        i+=1;
      }
      nb-=2;
    }
  }
 String get() { 
    return(str(Bl)+" "+str(BL)+" "+str(Bl2)+" "+str(BL2)+" "+str(Br)+" "+str(Bd)+" "+str(l)+" "+str(c)+" "+str(L)+" "+str(d)+" "+str(NB)+" "+str(c1)+" "+str(c2)+" "+str(c3)+" "+str(c4)+" "+str(c5)+" "+str(c6)+" "+str(c7));
  }
}

float better(float a, float b, int n) {
  if (n==0) {
    if (b>=a) {
      return(b);
    } else {
      return(a);
    }
  } else {
    if (b>=a) {
      return(a);
    } else {
      return(b);
    }
  }
}

void mutation(int f, int m) {
  int ok=0;
  String dna2="";
  String[] dna=q.get().split(" ");

  while (ok==0) {

    dna=q.get().split(" ");
    dna2="";

    for (int i=0; i<dna.length-7; i+=1) {
      if (int(random(0, f))==0) {
        dna[i]=str(float(dna[i])+int(random(-m, m)));
      }
    } 
    for (int i=11; i<dna.length-3; i+=1) {
      if (int(random(0, f))==0) {
        dna[i]=str(int(dna[i])+int(random(-m, m)));
      }
    }
    dna[15]=str(int(dna[11])+int(random(-5, 2)));
    dna[16]=str(int(dna[12])+int(random(-5, 2)));
    dna[17]=str(int(dna[13])+int(random(-5, 2)));

    if ( (float(dna[0])>=20 && float(dna[0])<=100)
      &&(float(dna[1])>=20 && float(dna[1])<=100)
      &&(float(dna[2])>=20 && float(dna[2])<=90) 
      &&(float(dna[3])>=20 && float(dna[3])<=90)
      &&(float(dna[4])>=100 && float(dna[4])<=300)
      &&(float(dna[5])>=-90 && float(dna[5])<=90)
      &&(float(dna[6])>=20 && float(dna[6])<=85)
      &&(float(dna[7])>=0.6 && float(dna[7])<=2)
      &&(float(dna[8])>=7 && float(dna[8])<=13)
      &&(float(dna[9])>=1 && float(dna[9])<=float(dna[8]))
      &&(float(dna[10])>=1 && float(dna[10])<=19) 
      &&(float(dna[11])>=0 && float(dna[11])<=255)
      &&(float(dna[12])>=0 && float(dna[12])<=255)
      &&(float(dna[13])>=0 && float(dna[13])<=255)
      &&(float(dna[14])>=90 && float(dna[14])<=220)
      &&(float(dna[15])>=0 && float(dna[15])<=255)
      &&(float(dna[16])>=0 && float(dna[16])<=255)
      &&(float(dna[17])>=0 && float(dna[17])<=255)
      ) {
      ok=1;
    }
  } 

  for (int i=0; i<dna.length; i+=1) {
    dna2=dna2+dna[i]+" ";
  }
  q = new Jfish(1, dna2);
}

class starfish{ //spinning starfish monster

  private float len = 100;
  
  void starfishMove(){
  translate(width/2, height/2);
  /* First loop is for the tenticles to be located on a cirlce */
  for (int i = 0; i < 360; i+=72) {
    float x = sin(radians(i+frameCount)) * 50;
    float y = cos(radians(i+frameCount)) * 50;
    /* Second loop is for the tenticles */
    for(int q = 0; q < len; q+=2){
      /* The angle is to make the movement */
      float angle = cos(radians(len-q+frameCount*2)) * q;
      float x2 = sin(radians(i-angle))*(q*3);
      float y2 = cos(radians(i-angle))*(q*3);
       fill(255);//-q*3); 
      ellipse(x+x2, y+y2, len-q, len-q);
     }
    }
  }
}
