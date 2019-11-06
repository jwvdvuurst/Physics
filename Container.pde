class Container {
  private ArrayList<wall> walls;

  private PVector left_upper_corner;
  private PVector right_bottom_corner;

  //luc = left upper corner
  //ruc = right bottom corner
  //side = side on which the tube connects (0=right, 1=left)
  //tube = the tube itself
  Container( PVector luc, PVector rbc, int side, Tube tube ) {
    walls = new ArrayList<wall>();

    left_upper_corner = luc;
    right_bottom_corner = rbc;

    float containerheight;

    // tl = top left
    // tr = top right
    // dl = down left
    // dr = dorn right
    // cd = connector down
    // cu = connector up
    PVector tl, tr, dl, dr, cd, cu;
    tl = new PVector();
    tr = new PVector();
    dl = new PVector();
    dr = new PVector();
    cd = new PVector();
    cu = new PVector();

    if ( side == 0 ) {
      tl = luc; 
      dr = rbc;
      tr.x = dr.x;
      tr.y = tl.y;
      dl.x = tl.x;
      dl.y = dr.y;

      containerheight = dl.y - tl.y;
      containerheight -= tube.getHeight();
      containerheight /= 2;

      cu.x = tr.x;
      cu.y = tr.y + containerheight;

      cd.x = tr.x;
      cd.y = dr.y - containerheight;

      tube.setLeft( tr.x );
      tube.setTop( cu.y );

      wall wl, wc, wb, wrt, wrb;

      wl = new wall( tl, dl );
      wc = new wall( tl, tr );
      wb = new wall( dl, dr );
      wrt = new wall( tr, cu );
      wrb = new wall( dr, cd );

      walls.add( wl );
      walls.add( wc );
      walls.add( wb );
      walls.add( wrt );
      walls.add( wrb );
    } else {
      tl = luc; 
      dr = rbc;
      tr.x = dr.x;
      tr.y = tl.y;
      dl.x = tl.x;
      dl.y = dr.y;

      containerheight = dr.y - tr.y;
      containerheight -= tube.getHeight();
      containerheight /= 2;

      cu.x = tl.x;
      cu.y = tl.y + containerheight;

      cd.x = tl.x;
      cd.y = dl.y - containerheight;

      tube.setRight( tl.x );
      tube.setTop( cu.y );

      wall wl, wc, wb, wrt, wrb;

      wl = new wall( tr, dr );
      wc = new wall( tl, tr );
      wb = new wall( dl, dr );
      wrt = new wall( tl, cu );
      wrb = new wall( dl, cd );

      walls.add( wl );
      walls.add( wc );
      walls.add( wb );
      walls.add( wrt );
      walls.add( wrb );
    }
  }

  ArrayList<wall> getWalls() {
    return walls;
  }

  int countBalls( ArrayList<ball> balls ) {
    int numballs = 0;
    float minx = left_upper_corner.x;
    float maxx = right_bottom_corner.x;
    float miny = left_upper_corner.y;
    float maxy = right_bottom_corner.y;

    for ( ball b : balls ) {
      PVector bloc = b.getLocation();
      float x = bloc.x;
      float y = bloc.y;

      if ( ( ( x >= minx) && ( x <= maxx) ) &&
           ( ( y >= miny) && ( y <= maxy) ) ) {
        numballs++;
      }
    }

    return numballs;
  }
}
