enum Type{
  SAND,
  GRASS,
  STONE,
  SNOW;
}

class Landtype{
  Type type;
  color light, dark;
  Landtype(Type t){
    type = t;
    switch(t){
      case SAND:
        light = color(251, 255, 41);
        dark = color(146, 148, 28);
        break;
      case GRASS:
        light = color(61, 186, 7);
        dark = color(42, 128, 5);
        break;
      case STONE:
        light = color(150, 150, 150);
        dark = color(50, 50, 50);
        break;
      case SNOW:
        light = color(255, 255, 255);
        dark = color(200, 200, 200);
        break;
    }
  }
}
