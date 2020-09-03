class Stack{
  ArrayList<Hex> hex;
  Stack(float x, float y, float r, float t, int h){
    hex = new ArrayList<Hex>();
    for(int i = h; i >= -1; i --){
      Landtype l;
      if(i+(int)random(2) < 3) l = new Landtype(Type.SAND);
      else if(i+(int)random(2) < 7) l = new Landtype(Type.GRASS);
      else if(i+(int)random(2) < 10) l = new Landtype(Type.STONE);
      else l = new Landtype(Type.SNOW);
      hex.add(new Hex(x, y, i*t, r, t, l));
    }
  }
  void show(){
    if(hex.size() > 0){
      hex.get(0).showStroke();
      for(int i = 0; i < 3 && i < hex.size(); i ++){
        hex.get(i).show();
      }
    }
  }
}
