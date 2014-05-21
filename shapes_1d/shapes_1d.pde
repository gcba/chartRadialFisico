/*
Armo el radial chart con un for.
 **Las unidades de medida de processing llegan correctamente a Autocad !!
 Base de datos
 minimo=1
 maximo=50
 
 TODO
 
 Levantar .csv
 Organizar grilla automaticamente segun cantidad de graficos
 Automatizar tamaño de canvas automaticamente
 Pasar a objeto
 Salvar en .pdf Ok
 */

import processing.pdf.*;
boolean saveFrame=false;

float angle=60.0;
float radius=60.0;
float maxRadius=100;
float scale=2;

float theCongress[] = {
  //27.85, 25.39, 25.4, 25.05, 18.8, 36.0
  50.0, 50.0, 50.0, 50.0, 50.0, 50.0,
};

float theCameraman[] = {
  39.74, 41.81, 9.71, 13.0, 36.31, 28.5
    // 10, 20, 30, 40, 50, 60
};

//Import csv
String[] tablas;
int indexTablas=0;

//Variables para corte laser
color cut=color(255, 0, 0);
color grab=color(0, 255, 0);
float strokeW=0.5;

int sensoresLength=6;
boolean bLines=false;

int w=600;
int h=400;


void setup() {
  size(w, h, P2D);
  smooth();
}

void draw() {

  if (saveFrame) {
    beginRecord(PDF, "data/bafici_1d.pdf");
  }
  strokeWeight(strokeW);
  noFill();

  pushMatrix();
  translate(100, 100);
  if (index < tablas.length) {
    String[] pieces = split(tablas[index], ',');
    if (pieces.length==12 {
      )
        beginShape();
      for (int i=0;i<sensoresLength;i++) {
        // fill(100, 100, 255);
        float vX=cos(radians(angle*i))*tablas[i]*scale;
        float vY=sin(radians(angle*i))*tablas[i]*scale;
        stroke(cut);
        vertex(vX, vY);
      }
      endShape(CLOSE);

      popMatrix();
    }
    if (saveFrame) {
      endRecord();
      saveFrame=false;
    }
  }

  void mousePressed() {
    saveFrame=true;
  }

