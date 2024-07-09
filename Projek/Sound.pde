import ddf.minim.*;
import ddf.minim.ugens.*;

Gain       gain;
Minim minim;
AudioPlayer iberia, aegir, dist, aegirbanyakkota, kotaAegir, lantaiLaut,
 kotaLaut, bernafas, typhrilFall, cityFall, aegirEnd, eos;
void sound(){

minim = new Minim(this);
iberia = minim.loadFile("Iberia.wav");
aegir = minim.loadFile("Aegir.wav");
dist = minim.loadFile("600km.wav");
aegirbanyakkota = minim.loadFile("AegirCities.wav");
kotaAegir = minim.loadFile("CitiesOfAegir.wav");
lantaiLaut = minim.loadFile("SeaFloor.wav");
kotaLaut = minim.loadFile("CityDome.wav");
bernafas = minim.loadFile("Air.wav");
eos = minim.loadFile("eas.mp3");
typhrilFall = minim.loadFile("TyphrilFall.wav");
cityFall = minim.loadFile("OtherCitiesFall.wav");
aegirEnd = minim.loadFile("AegirDoomed.wav");
}
 // RNG bisa atau gk, kl gak bisa di comment out dulu
void playSound(){

  switch (t) {
    case 15: iberia.play(); break;
    case 240: dist.play(); break;
    case 299: aegir.play(); break;
    case 390: aegirbanyakkota.play(); break;
    case 490: kotaAegir.play(); break;
    case 610: lantaiLaut.play(); break;
    case 719: kotaLaut.play(); break;
    case 810: bernafas.play(); break;
    case 900: eos.play(); break;
    case 1500: eos.play(); break;
    case 2400: typhrilFall.play(); break;
    case 2800: cityFall.play(); break;
    case 3100: aegirEnd.play();break;
  }
}
