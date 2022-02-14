SistemaParticulas sistemaParticulas;

int lastSeconds = 0;
int tiempoConsulta = 0;

float temperatura = 0;
float velocidad = 0;
float humedad = 0;

color rojo = color(210, 26, 26);
color azul = color(26, 37, 210);
color naranja = color(243, 119, 16);
color verde = color(16, 243, 50);

void setup()
{
  size(500, 300);
  sistemaParticulas = new SistemaParticulas(new PVector(width/2, height/2));
  
  temperatura = getTemperatura();
  velocidad = getVelocidad();
  humedad = getHumedad();
}

void draw() {
  background(0);

  int currentSeconds = second();
  boolean consultar = false;
  
  if(currentSeconds != lastSeconds) {
    tiempoConsulta = tiempoConsulta + 1;
    if(tiempoConsulta == 5) {
      println("5segundos");
      tiempoConsulta = 0;
      consultar = true;
    }
  }
  
  lastSeconds = currentSeconds;

  if(consultar) {
    temperatura = getTemperatura();
    velocidad = getVelocidad();
    humedad = getHumedad();
  }
  
  fill(255, 255);
  
  text("Temperatura: " + temperatura + " °C", 10, 20);
  float velocidadAnimacion =  velocidad;
  if(velocidad >= 100){
    velocidadAnimacion = 0.5;
  } else if(velocidad >= 50) {
    velocidadAnimacion = 0.4;
  } else if (velocidad >= 40) {
    velocidadAnimacion = 0.3;
  } else if (velocidad >= 30) {
    velocidadAnimacion = 0.1;
  } else if (velocidad >= 20) {
    velocidadAnimacion = 0.05;
  } else if (velocidad >= 10) {
    velocidadAnimacion = 0.03;
  } else if (velocidad >= 1) {
    velocidadAnimacion = 0.01;
  } else if (velocidad >= 0) {
    velocidadAnimacion = 0;
  }
  text("Velocidad: " + velocidad + " km/h", 10, 280);
  text("Humedad: " + humedad + " %", 400, 280);
  
  
  fill(verde, 255);
  sistemaParticulas.agregarParticula(temperatura, velocidadAnimacion);
  
  sistemaParticulas.run();
}

float getTemperatura() {
  float temperatura = 0;
  
  try {
    String[] texto = loadStrings("http://localhost:8080/temperatura");
    return Float.valueOf(texto[0]);
    
  } catch(Exception ex) {
    //println(ex);
  }
  
  return temperatura;
}


float getVelocidad() {
  float velocidad = 0;
  
  try {
    String[] texto = loadStrings("http://localhost:8080/velocidad");
  
    return Float.valueOf(texto[0]);
    
  } catch(Exception ex) {
    //println(ex);
  }
  
  return velocidad;
}

float getHumedad() {
  float humedad = 0;
  
  try {
    String[] texto = loadStrings("http://localhost:8080/humedad");
  
    return Float.valueOf(texto[0]);
  } catch(Exception ex) {
    //println(ex);
  }
    
  return humedad;
}
