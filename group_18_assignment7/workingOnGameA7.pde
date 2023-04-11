
Score puntos;
Field campo;

void setup() {
  size(1000, 1000);
  puntos = new Score();
  campo = new Field();
  
}

void draw() {
  background(120, 0, 240);
  campo.displayingField(); 
  puntos.displayingScore();
  puntos.addPoints();
}
