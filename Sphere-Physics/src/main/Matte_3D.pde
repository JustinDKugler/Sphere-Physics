class Matte {
  int rowCount = 100, columnCount = 100;
  float matteWidth = 8000, matteLength = 8000;
  float triangleBase, triangleHeight;
  float centerPosX = 0, centerPosZ = 0;

  Matte() {
    triangleBase = matteWidth / (rowCount - 1);
    triangleHeight = matteLength / (columnCount - 1);
  }

  void display() {
    pushMatrix();
    translate(centerPosX-(matteWidth/2), 0, centerPosZ-(matteLength/2));
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < rowCount - 1; i++) {
      beginShape(TRIANGLE_STRIP);
      for (int j = 0; j < columnCount; j++) {
        vertex(j*triangleBase, 0, i*triangleHeight);
        vertex(j*triangleBase, 0, (i+1)*triangleHeight);
      }
      endShape();
    }
    popMatrix();
  }

  void display(PImage texture) {
    pushMatrix();
    translate(centerPosX-(matteWidth/2), 0, centerPosZ-(matteLength/2));
    fill(255, 0, 0);
    noStroke();
    for (int i = 0; i < rowCount - 1; i++) {
      textureMode(NORMAL);
      beginShape(TRIANGLE_STRIP);
      texture(texture);
      for (int j = 0; j < columnCount; j+=2) {
        vertex(j*triangleBase, 0, i*triangleHeight, 0, 0);
        vertex(j*triangleBase, 0, (i+1)*triangleHeight, 0, 1);
        vertex((j+1)*triangleBase, 0, i*triangleHeight, 1, 0);
        vertex((j+1)*triangleBase, 0, (i+1)*triangleHeight, 1, 1);
      }
      endShape();
    }
    popMatrix();
  }


  // Setters
  void setMatteSize(float tempWidth, float tempLength) {
    matteWidth = tempWidth;
    matteLength = tempLength;
    // Update triangle sizes
    triangleBase = matteWidth / (rowCount - 1);
    triangleHeight = matteLength / (columnCount - 1);
  }
  void setRowCount(int tempCount) {
    rowCount = tempCount;
    // Update triangle size
    triangleBase = matteWidth / (rowCount - 1);
  }
  void setColumnCount(int tempCount) {
    columnCount = tempCount;
    // Update triangle size
    triangleHeight = matteLength / (columnCount - 1);
  }
  void setPos(float tempPosX, float tempPosZ) {
    centerPosX = tempPosX;
    centerPosZ = tempPosZ;
  }
}
