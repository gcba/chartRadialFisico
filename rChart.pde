class RChart {

  int sides;
  float offset;
  int wGuide;
  int hGuide;
  boolean bLines;
  float[][] array= {
  };

  RChart(int _sides, float _offset, int _wGuide, int _hGuide, boolean _bLines) {
    sides=_sides;
    offset=_offset;
    wGuide=_wGuide;
    hGuide=_hGuide;
    bLines=_bLines;

    float angle=TWO_PI/sides;
  }

  void radialChart(int x, int y, float[][] myArray, int _col) {
    array=myArray;
    int col=_col;
    //int row=_row;
    pushMatrix();
    beginShape();

    translate(x, y);
    for (int i=0;i<sides;i++) {
      noFill();
      // fill(100, 100, 255);
      float vX=cos(radians(angle*i))*(array[col][i]*1)*scale;
      float vY=sin(radians(angle*i))*(array[col][i]*1)*scale;
      stroke(cut);
      vertex(vX, vY);
    }
    endShape(CLOSE);

    if (bLines) {
      for (int i=0;i<sides;i++) {
        float vX=cos(radians(angle*i))*array[col][i]*scale;
        float vY=sin(radians(angle*i))*array[col][i]*scale;

        stroke(255);
        line(0, 0, vX, vY);
      }
    }
    fill(255, 0, 255);

    rect(-wGuide*.5, -hGuide*.5, wGuide, hGuide);

    popMatrix();
  }
}

