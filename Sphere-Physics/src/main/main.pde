// Sphere Physics by Joe Benson and Justin Kugler

Camera camera1 = new Camera();
Matte matteName = new Matte();
Skybox skybox = new Skybox();
ArrayList<Physics_Spheres> sphere = new ArrayList<Physics_Spheres>();

float gravity = -0.05;
float boxSize = 900;
Boolean spawnNew = false, fun = false; // Used for spawning new on collision

void setup() {
  background(0);
  frameRate(60);
  //size(1000, 1000, P3D);
  fullScreen(P3D);

  //sphere.add(new Physics_Spheres());

  sphere.add(new Physics_Spheres(0, 50, 0, 0, 0, 0));
  sphere.add(new Physics_Spheres(-500, 50, 100, 2, 0, 0));
}

void draw() {
  background(115, 180, 245);
  
  // Physics calculations
  for (int i = sphere.size() - 1; i >= 0; i--) {
    sphere.get(i).updatePosition();
    wallCollision(i);
    for (int j = sphere.size() - 1; j >= 0; j--) {
      if (j != i) {
        sphereCollision(i, j);
      }
    }
  }

  // Used for spawns new sphere if collision within a framecount
  if (spawnNew && frameCount%(240/(sphere.size()-1)) == 0 && fun) {
    sphere.add(new Physics_Spheres());
    spawnNew = false;
  }

  // Visuals and camera
  camera1.updateCamPos();
  translate(width/2, (height/2) + camera1.getCameraHeight(), camera1.getCameraZoom());
  rotateX(camera1.getCameraRotX());
  rotateY(camera1.getCameraRotY());
  rotateZ(camera1.getCameraRotZ());
  ambientLight(15, 15, 15);
  lightFalloff(0.8, 0.0, 0.0);
  pointLight(255, 255, 255, 0, -1000, 0);

  matteName.display();
  skybox.display();
  for (int i = sphere.size() - 1; i >= 0; i--) {
    sphere.get(i).display();
  }
}

void mousePressed() {
  sphere.add(new Physics_Spheres());
}

void keyPressed() {
  camera1.keyInput(key, true);
}

void keyReleased() {
  camera1.keyInput(key, false);
}

void mouseWheel(MouseEvent event) {
  camera1.scrollInput(event.getCount());
}

void wallCollision(int sphereNumber) {
  if (abs(sphere.get(sphereNumber).position.x) >= boxSize - sphere.get(sphereNumber).radius) {
    sphere.get(sphereNumber).velocity.x *= -1;
  }
  if (abs(sphere.get(sphereNumber).position.z) >= boxSize - sphere.get(sphereNumber).radius) {
    sphere.get(sphereNumber).velocity.z *= -1;
  }
  if (sphere.get(sphereNumber).position.y <= sphere.get(sphereNumber).radius) {
    sphere.get(sphereNumber).velocity.y *= -0.9;
  }
}

void sphereCollision(int sphere1, int sphere2) {
  float delta;
  PVector collisionVector;

  delta = dist(sphere.get(sphere1).position.x, sphere.get(sphere1).position.y, sphere.get(sphere1).position.z, 
    sphere.get(sphere2).position.x, sphere.get(sphere2).position.y, sphere.get(sphere2).position.z);

  if (delta <= sphere.get(sphere1).radius + sphere.get(sphere2).radius) {
    collisionVector = new PVector(
      sphere.get(sphere1).position.x - sphere.get(sphere2).position.x, 
      sphere.get(sphere1).position.y - sphere.get(sphere2).position.y, 
      sphere.get(sphere1).position.z - sphere.get(sphere2).position.z);

    collisionVector.normalize();
    sphere.get(sphere1).standbyVelocity = PVector.mult(collisionVector, sphere.get(sphere2).velocity.mag());
    sphere.get(sphere1).collidingWithSphere = true;
    spawnNew = true;
  }
}
