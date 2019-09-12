class Physics_Spheres {
  // Specifications
  float radius;
  color shellColor = color(255, 155, 0);

  // Position and Velocity
  PVector position, velocity, acceleration, standbyVelocity;
  Boolean collidingWithSphere = false;

  Physics_Spheres() {
    radius = 50;
    position = new PVector(0, radius + 300, 0);
    velocity = PVector.mult(PVector.random3D(), 10);
    standbyVelocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, gravity, 0);
  }

  Physics_Spheres(float startX, float startY, float startZ, float velX, float velY, float velZ) {
    radius = 50;
    position = new PVector(startX, startY, startZ);
    velocity = new PVector(velX, velY, velZ);
    standbyVelocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, gravity, 0);
  }

  void display() {
    pushMatrix();
    translate(position.x, -position.y, position.z);

    noStroke();
    fill(shellColor);
    sphere(radius);

    popMatrix();
  }

  void updatePosition() {
    if (position.y <= radius) {
      acceleration.y = 0;
    } else {
      acceleration.y = gravity;
    }
    if (collidingWithSphere) {
      velocity = standbyVelocity;
      collidingWithSphere = false;
    }

    if (abs(velocity.y) < abs(gravity/2)) {
      velocity.y = 0;
    }
    velocity.add(acceleration);
    position.add(velocity);
    if (position.y < radius) {
      position.y = radius;
    }
  }

  void testCollisions() {
    //if ((yPos + radius >= height) || (yPos - radius <= 0)) {
    //  yVel = yVel*(-1);
    //}
    //if ((xPos + radius >= width) || (xPos - radius <= 0)) {
    //  xVel = xVel*(-1);
    //}
    //if ((zPos + radius >= width/2) || (zPos - radius <= -width/2)) {
    //  zVel = zVel*(-1);
    //}
  }
}
