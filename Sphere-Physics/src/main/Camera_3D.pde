class Camera {
  float rotX = -30, rotY = 0, rotZ = 0;
  float zoom = -500, camHeight = 20;
  Boolean posRotX, negRotX, posRotY, negRotY, posRotZ, negRotZ;
  float rotSpeed = 2, normalRotSpeed = 2, fineRotSpeed = 0.5; // In degrees/frame

  Camera() {
    posRotX = negRotX = posRotY = negRotY = posRotZ = negRotZ = false;
  }

  void updateCamPos() {
    if (posRotX && rotX <= -5) {        
      rotX += rotSpeed;
    }
    if (negRotX && rotX >= -175) {
      rotX -= rotSpeed;
    }
    if (posRotY) {
      rotY += rotSpeed;
    }
    if (negRotY) {
      rotY -= rotSpeed;
    }
    if (posRotZ) {
      rotZ += rotSpeed;
    }
    if (negRotZ) {
      rotZ -= rotSpeed;
    }
  }

  float getCameraRotX() {
    return radians(rotX);
  }

  float getCameraRotY() {
    return radians(rotY);
  }

  float getCameraRotZ() {
    return radians(rotZ);
  }

  float getCameraZoom() {
    return zoom;
  }

  float getCameraHeight() {
    return camHeight;
  }

  void keyInput(char tempKey, Boolean keyState) {
    switch (tempKey) {
    case 'S':
      if (keyState) {
        rotSpeed = fineRotSpeed;
      } else {
        rotSpeed = normalRotSpeed;
      }
    case 's':
      posRotX = keyState;
      break;
    case 'W':
      if (keyState) {
        rotSpeed = fineRotSpeed;
      } else {
        rotSpeed = normalRotSpeed;
      }
    case 'w':
      negRotX = keyState;
      break;
    case 'A':
      if (keyState) {
        rotSpeed = fineRotSpeed;
      } else {
        rotSpeed = normalRotSpeed;
      }
    case 'a':
      posRotY = keyState;
      break;
    case 'D':
      if (keyState) {
        rotSpeed = fineRotSpeed;
      } else {
        rotSpeed = normalRotSpeed;
      }
    case 'd':
      negRotY = keyState;
      break;
    case 'E':
      if (keyState) {
        rotSpeed = fineRotSpeed;
      } else {
        rotSpeed = normalRotSpeed;
      }
    case 'e':
      posRotZ = keyState;
      break;    
    case 'Q':
      if (keyState) {
        rotSpeed = fineRotSpeed;
      } else {
        rotSpeed = normalRotSpeed;
      }
    case 'q':
      negRotZ = keyState;
      break;
    case 'z':
      camHeight += 50;
      break;
    case 'x':
      camHeight -= 50;
      break;
    }
  }

  void scrollInput(float upRDown) {
    if (zoom <= 400 && upRDown == -1) {
      zoom -= upRDown * 100;
    } else if (zoom >= -10000 && upRDown == 1) {
      zoom -= upRDown * 100;
    }
  }
}
