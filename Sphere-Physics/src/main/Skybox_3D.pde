class Skybox {
  float size = 900;

  Skybox() {
  }

  void display() {
    pushMatrix();
    stroke(0);
    noFill();

    // Floor
    beginShape();
    vertex(-size, 0, -size, 0, 0);
    vertex( size, 0, -size, 1, 0);
    vertex( size, 0, size, 1, 1);
    vertex(-size, 0, size, 0, 1);
    endShape();

    // Ceiling
    beginShape();
    vertex(-size, -2*size, -size, 0, 0);
    vertex( size, -2*size, -size, 1, 0);
    vertex( size, -2*size, size, 1, 1);
    vertex(-size, -2*size, size, 0, 1);
    endShape();

    // Sides
    pushMatrix();

    beginShape();
    vertex(-size, -2*size, -size, 0, 0);
    vertex(-size, 0, -size, 1, 0);
    vertex( size, 0, -size, 1, 1);
    vertex( size, -2*size, -size, 0, 1);
    endShape();

    rotateY(PI/2);
    beginShape();
    vertex(-size, -2*size, -size, 0, 0);
    vertex(-size, 0, -size, 1, 0);
    vertex( size, 0, -size, 1, 1);
    vertex( size, -2*size, -size, 0, 1);
    endShape();

    rotateY(PI/2);
    beginShape();
    vertex(-size, -2*size, -size, 0, 0);
    vertex(-size, 0, -size, 1, 0);
    vertex( size, 0, -size, 1, 1);
    vertex( size, -2*size, -size, 0, 1);
    endShape();

    rotateY(PI/2);
    beginShape();
    vertex(-size, -2*size, -size, 0, 0);
    vertex(-size, 0, -size, 1, 0);
    vertex( size, 0, -size, 1, 1);
    vertex( size, -2*size, -size, 0, 1);
    endShape();
    popMatrix();

    popMatrix();
  }
}
