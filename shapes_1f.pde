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
float scale=1;

RChart chart1, chart2;

int rows=6;
int cols=2;


float theCongress[] = {
  27.85, 25.39, 25.4, 25.05, 18.8, 36.0
    //50.0,50.0,50.0,50.0,50.0,50.0,
};

float theCameraman[] = {
  39.74, 41.81, 9.71, 13.0, 36.31, 28.5
    // 10, 20, 30, 40, 50, 60
};

//Variables para corte laser
color cut=color(255, 0, 0);
color grab=color(0, 255, 0);
float strokeW=1;

int sensoresLength=6;
boolean bLines=true;

int w=600;
int h=400;
float[][] sensors= {
  {
    27.85, 25.39, 25.4, 25.05, 18.8, 36.0
  }
  , { 
    39.74, 41.81, 9.71, 13.0, 36.31, 28.5
  }
};


void setup() {
  size(w, h, P2D);
  smooth();

  println(sensors[1][3]);

  //RChart(int _sides, float _offset, int _wGuide, int _hGuide, boolean _bLines)
  chart1= new RChart(6, 100, 5, 10, true);
  chart2= new RChart(6, 100, 5, 10, true);
}

void draw() {
  strokeWeight(strokeW);
  noFill();

  if (saveFrame) {
    beginRecord(PDF, "data/bafici_1c.pdf");
  }
  
  // radialChart(int x, int y, float[][] myArray, int _col)

  chart1.radialChart(200, 100, sensors, 0);

  chart2.radialChart(400, 100, sensors, 1);

  if (saveFrame) {


    endRecord();
    saveFrame=false;
  }
}


void mousePressed() {
  saveFrame=true;
}

