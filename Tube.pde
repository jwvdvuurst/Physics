class Tube {
  private ArrayList<wall> wall;
  private float height = 0;
  private float top = 0;
  private float bottom = 0;
  private float left = 0;
  private float right = 0;
  
  Tube( float height ) {
    this.height = height;
    
    walls = new ArrayList<wall>();
  }
  
  float getHeight() {
    return height;
  }
  
  void setHeight( float height ) {
    this.height = height;
  }
  
  float getBottom() {
    if ( bottom == 0 ) {
      bottom = top + height;
    }
    return bottom;
  }
  
  void setBottom() {
    bottom = top + height;
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
    
    setBottom();
    
    cl.x = left;
    cl.y = top;
    cr.x = right;
    cr.y = top;
    fl.x = left;
    fl.y = bottom;
    fr.x = right;
    fr.y = bottom;
    
    wall ceiling, floor;
    
    ceiling = new wall( cl, cr );
    floor = new wall( fl, fr );
    walls.add( ceiling );
    walls.add( floor );
  }
  
  int countBalls( ArrayList<ball> balls ) {
    int numballs = 0;

    for ( ball b : balls ) {
      PVector bloc = b.getLocation();
      float x = bloc.x;
      float y = bloc.y;

      if ( ( ( x >= left) && ( x <= right) ) &&
           ( ( y >= top) && ( y <= bottom) ) ) {
        numballs++;
      }
    }

    return numballs;
  }
    
  ArrayList<wall> getWalls() {
    return walls;
  }
}
