
ArrayList<wall> walls;
ArrayList<ball> balls;

int numberWalls = 0;
int numberBalls = 2500;

void setup() {
  fullScreen();
  //  size(800,800);
  background(0);

  walls = new ArrayList<wall>();
  balls = new ArrayList<ball>();

  float tw = width / 3;
  float th = height / 10;
  
  PVector lc_luc = new PVector( 10, 10 );
  PVector lc_rbc = new PVector( tw - 10, height - 10 );
  PVector rc_luc = new PVector( width - (tw - 10), 10 );
  PVector rc_rbc = new PVector( width - 10, height - 10 );
  
  Tube tube = new Tube( th );
  Container lc = new Container( lc_luc, lc_rbc, 0, tube );
  Container rc = new Container( rc_luc, rc_rbc, 1, tube );
  
  tube.construct();

  for( wall w : lc.getWalls() ) {
    this.walls.add(w);
  }
  
  for( wall w : rc.getWalls() ) {
    this.walls.add(w);
  }

  for( int i = 0; i<numberBalls; i++ ) {
    ball b = new ball( lc_luc.x, lc_luc.y, lc_rbc.x, lc_rbc.y );
    balls.add(b);
  } 
}

void draw() {
  clear();
  for ( wall wd : walls ) {
    wd.draw();
  }
  
  int active=0;
  for (ball b : balls ) {
    if ( ! b.finished() ) {
      active++;
    }
  }
  
  fill(128);
  textSize(64);
  text( active, width / 2, height / 2 );

  for ( ball b : balls ) {
    b.resetFlag();
    b.draw();

    b.move();

    for ( wall wd : walls ) {
      b.bounce(wd);
    }
    
    for( ball other : balls ) {
      b.bounce(other);
    }
  }
}
