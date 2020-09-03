int layers = 10;
float angle = 0;
float angleSpeed = 0;
float upAngle = PI/4;
float upAngleSpeed = 0;
float thickness = 30;
float size = 100;
ArrayList<Stack> island;
long seed = (long)random(100);

void setup(){
  fullScreen(P3D); 
  generateNLayers(layers);
}

void draw(){
  translate(width/2, height/2);
  rotateX(upAngle);
  rotateZ(angle);
  
  background(135, 206, 235);
  for(Stack s : island) s.show();
  
  fill(0, 7, 148, 50);
  noStroke();
  beginShape();
  vertex(-10000, -10000, thickness/2);
  vertex(-10000,  10000, thickness/2);
  vertex( 10000,  10000, thickness/2);
  vertex( 10000, -10000, thickness/2);
  endShape();
  
  if(keyPressed){
    if(key == '*'){
      size *= 1.01;
      generateNLayers(layers);
    }else if(key == '/'){
      size /= 1.01;
      generateNLayers(layers);
    }else if(keyCode == RIGHT) angleSpeed += 0.003;
    else if(keyCode == LEFT) angleSpeed -= 0.003;
    else if(keyCode == UP) upAngleSpeed -= 0.003;
    else if(keyCode == DOWN) upAngleSpeed += 0.003;
  }
  angle += angleSpeed;
  angleSpeed *= 0.9;
  
  upAngle = constrain(upAngle+upAngleSpeed, 0, PI/2-PI/10);
  upAngleSpeed *= 0.9;
}

void keyPressed(){
  if(key == 'n'){
    seed = (long)random(1000);
    generateNLayers(layers);
  }else if(key == '+'){
    layers ++;
    generateNLayers(layers);
  }else if(key == '-'){
    layers = constrain(layers-1, 5, layers);
    generateNLayers(layers);
  }
}

void generateNLayers(int n){
  randomSeed(seed);
  random(1);
  island = new ArrayList<Stack>();
  island.add(new Stack(0,0,size,thickness,n+(int)random(3)-10));
  for(int i = 1; i < n; i ++){
    PVector dir = new PVector(0,i*2*sqrt(3f/4*size*size));
    PVector offset = new PVector(2*sqrt(3f/4*size*size),0);
    offset.rotate(-TWO_PI/12);
    for(int j = 0; j < 6; j ++){
      for(int k = 0; k < i; k ++){
        island.add(new Stack(dir.x + offset.x*k, dir.y + offset.y*k, size, thickness, n-i+(int)random(3)-10));
      }
      dir.rotate(TWO_PI/6);
      offset.rotate(TWO_PI/6);
    }
  }
}
