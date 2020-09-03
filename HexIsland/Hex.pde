class Hex{
  PVector pos;
  PVector[] verts = new PVector[6];
  float thickness;
  Landtype type;
  
  Hex(float x, float y, float z, float r, float th, Landtype ty){
    pos = new PVector(x, y, z);
    verts[0] = new PVector(x+r,y,z);
    verts[1] = new PVector(x+r/2,y-sqrt(r*r*3/4),z);
    verts[2] = new PVector(x-r/2,y-sqrt(r*r*3/4),z);
    verts[3] = new PVector(x-r,y,z);
    verts[4] = new PVector(x-r/2,y+sqrt(r*r*3/4),z);
    verts[5] = new PVector(x+r/2,y+sqrt(r*r*3/4),z);
    thickness = th;
    type = ty;
  }
  
  void show(){
    noStroke();
    
    fill(type.light);
    beginShape();
    for(PVector v : verts) vertex(v.x, v.y, v.z);
    endShape(CLOSE);
    
    noStroke();
    fill(type.dark);
    for(int i = 0; i < 6; i ++){
      beginShape();
      PVector current = verts[i];
      PVector next = verts[(i+1)%6];
      vertex(current.x, current.y, current.z);
      vertex(next.x, next.y, next.z);
      vertex(next.x, next.y, next.z-thickness);
      vertex(current.x, current.y, current.z-thickness);
      endShape();
    }
  }
  void showStroke(){
    noFill();
    
    if(pos.z > 0){
      stroke(type.dark);
      strokeWeight(5);
      beginShape();
      for(PVector v : verts) vertex(v.x, v.y, v.z);
      endShape(CLOSE);
    }
    
    stroke(135, 206, 235);
    beginShape();
    for(PVector v : verts) vertex(v.x, v.y, thickness/2);
    endShape(CLOSE);
  }
}
