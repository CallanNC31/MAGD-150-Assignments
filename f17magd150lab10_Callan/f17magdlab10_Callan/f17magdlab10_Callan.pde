 PShape box, sphere;
 
 float angle, camSpeed, 
  x, y, z, 
  lookAtX, lookAtY, lookAtZ, 
  upX, upY, upZ, 
  orthoScale, 
  viewDist, 
  extents = 250;
boolean orthographic;
 
 PImage web, txtr;
 
 boolean showDiagnosticImages = true;
 
float ambv1, ambv2, ambv3, ambx1, amby1, ambz1, 
  ambx2, amby2, ambz2;

float ptv1, ptv2, ptv3, ptx1, pty1, ptz1, 
  ptx2, pty2, ptz2;

float dirv1, dirv2, dirv3, dirx1, diry1, dirz1, 
  dirx2, diry2, dirz2;

int rate, colorMode;
 
void setup(){
  surface.setResizable(true);
  pixelDensity(displayDensity());
  size(800, 800, P3D);
  
  textureMode(NORMAL);
  textureWrap(REPEAT);
  
  web = loadImage("web.png");
 
  box = loadShape("cube.obj");
  box.setStroke(false);
  box.scale(200,200,200);
  box.setTexture(web);
  
  
  sphere = loadShape("sphere.obj");
  sphere.setStroke(false);
  sphere.scale(200,200,200);
  sphere.setTexture(web);
  
  angle = 0;
  camSpeed = 5.0;
  x = width / 2.0;
  y = height / 2.0;
  z = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  orthoScale = 2.0;
  orthographic = false;
  
  ambv1 = random(0, 156);
  ambv2 = random(0, 156);
  ambv3 = random(0, 156);
  ambx1 = random(0, width);
  amby1 = random(0, height);
  ambz1 = 0;

  ptv1 = random(0, 156);
  ptv2 = random(0, 156);
  ptv3 = random(0, 200);
  ptx1 = random(0, width);
  pty1 = random(0, height);
  ptz1 = 0;

  dirv1 = random(0, 80);
  dirv2 = random(0, 80);
  dirv3 = random(0, 80);

  dirx1 = random(-1, 1);
  diry1 = random(-1, 1);
  dirz1 = random(-1, 1);

  rate = 100;
  colorMode = RGB;
}
void draw(){
  colorMode(colorMode, 255, 255, 255);
  background(100);
  
  //Lights
  ambientLight(ambv1, ambv2, ambv3, ambx1, amby1, ambz1);
  pointLight(ptv1, ptv2, ptv3, ptx1, pty1, ptz1);
  directionalLight(dirv1, dirv2, dirv3, dirx1, diry1, dirz1);
  
  if (frameCount % rate == 0) {
    // Destination for ambient light.
    ambx2 = random(0, width);
    amby2 = random(0, height);
    ambz2 = random(-5.0, 5.0);

    // Destination for spot light.
    ptx2 = random(0, width);
    pty2 = random(0, height);
    ptz2 = random(-5.0, 5.0);

    // Destination for directional light.
    dirx2 = random(-1.0, 1.0);
    diry2 = random(-1.0, 1.0);
    dirz2 = random(-1.0, 1.0);
  }

  //move lighting
  ambx1 = lerp(ambx1, ambx2, 0.05);
  amby1 = lerp(amby1, amby2, 0.05);
  ambz1 = lerp(ambz1, ambz2, 0.05);

  ptx1 = lerp(ptx1, ptx2, 0.05);
  pty1 = lerp(pty1, pty2, 0.05);
  ptz1 = lerp(ptz1, ptz2, 0.05);

  dirx1 = lerp(dirx1, dirx2, 0.05);
  diry1 = lerp(diry1, diry2, 0.05);
  dirz1 = lerp(dirz1, dirz2, 0.05); 
  
  box.rotateZ(0.004);
  box.rotateY(0.002);
  box.rotateX(0.005);
  
  sphere.rotateZ(0.03);
  sphere.rotateY(0.02);
  sphere.rotateX(0.01);
  

  shape(box, width * 0.250, height * 0.25);
  shape(sphere, width * 0.725, height * 0.80);
  
    if (orthographic) {
    ortho(-width / orthoScale, 
      width / orthoScale, 
      -height / orthoScale, 
      height / orthoScale, 
      z / 1000.0, z * 1000.0);
  } else {
    perspective(PI / 3.0, 
      float(width) / float(height), 
      z / 2000.0, z * 2000.0);
  }
  camera(x, y, z, 
    lookAtX, lookAtY, lookAtZ, 
    upX, upY, upZ);

  keys();
}

void keys() {
  if (keyPressed) {
    if (y > 0
      && (key == 'w' || key == 'W' || keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (x > -extents
      && (key == 'a' || key == 'A' || keyCode == LEFT)) {
      x -= camSpeed;
      lookAtX = x;
    }
    if (y < height - 10
      && (key == 's' || key == 'S' || keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
    }
    if (x < extents
      && (key == 'd' || key == 'D' || keyCode == RIGHT)) {
      x += camSpeed;
      lookAtX = x;
    }
    if (z > -extents
      && (key == 'q' || key == 'Q')) {
      if (orthographic) {
        orthoScale += 0.01;
      }
      z -= camSpeed;
      lookAtZ = z - viewDist;
    }
    if (z < extents
      && (key == 'e' || key == 'E')) {
      if (orthographic) {
        orthoScale -= 0.01;
      }
      z += camSpeed;
      lookAtZ = z - viewDist;
    }
  }
}

void mousePressed() {
  orthographic = !orthographic;
  
  ambv1 = random(0, 200);
  ambv2 = random(0, 200);
  ambv3 = random(0, 200);
  println("\nambient: #" + hex(color(ambv1, ambv2, ambv3)).substring(2));

  ptv1 = random(0, 200);
  ptv2 = random(0, 200);
  ptv3 = random(0, 200);
  println("point: #" + hex(color(ptv1, ptv2, ptv3)).substring(2));

  dirv1 = random(0, 150);
  dirv2 = random(0, 150);
  dirv3 = random(0, 150);
  println("directional: #" + hex(color(dirv1, dirv2, dirv3)).substring(2));
}
  
  
  
  //This is the code I used to create the texture
  
//void setup() {
//size(400,400);
//}

//void draw(){
//  background(230);
//  strokeWeight(10);
//  line(0,0,400,0);
//  line(0,0,0,400);
//  line(0,400,400,400);
//  line(400,0,400,400);

//line(0,0,400,400);
//line(0,400,400,0);

//line(0,200,200,0);
//line(200,0,400,200);
//line(0,200,200,400);
//line(200,400,400,200);

//line(80,320,80,80);
//line(80,80,320,80);
//line(320,320,80,320);
//line(320,320,320,80);

//line(140,145,260,145);
//line(140,145,140,260);
//line(140,260,260,260);
//line(260,260,260,140);

//line(80,200,200,320);
//line(200,80,80,200);
//line(320,200,200,80);
//line(200,320,320,200);

//line(200,0,200,400);
//line(0,200,400,200);
//strokeWeight(2);

//save("web.png");
//}