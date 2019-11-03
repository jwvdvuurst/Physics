class Tube {
  private ArrayList<wall> wall;
  private float height = 0;
  private float top = 0;
  private float left = 0;
  private float right = 0;
  
  Tube( float height ) {
    this.height = height;
    
    walls = new ArrayList<wall>();
  }
  
  float getheight() {
    return height;
  }
  
  void setTop( float top ) {
    this.top = top;
  }
  
  void setLeft( float left ) {
    this.left = left;
  }
  
  void setRight( float right ) {
    this.right = right;
  }
  
  void construct() {
    //cl = ceiling left;
    //cr = ceiling right;
    //fl = floor left;
    //fr = floor rightl
    PVector cl, cr, fl, fr;
    cl = new PVector();
    cr = new PVector();
    fl = new PVector();    
    fr = new PVector();
    
    cl.x = left;
    cl.y = top;
    cr.x = right;
    cr.y = top;
    fl.x = left;
    fl.y = top + height;
    fr.x = right;
    fr.y = top + height;
    
    wall ceiling, floor;
    
    ceiling = new wall( cl, cr );
    floor = new wall( fl, fr );
    walls.add( ceiling );
    walls.add( floor );
  }
    
  ArrayList<wall> getWalls() {
    return walls;
  }
}
