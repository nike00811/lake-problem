class Cell
{
  int x, y, w, h;
  boolean marked ;
  Cell(int x, int y, int w, int h)
  {
    marked  = false ;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display(int temp)
  {
    stroke(0, 50);
    fill( color_arr[temp] ) ;
    //if (temp == 0)
    //  fill(255, 255, 255);
    //if (temp == 1)
    //  fill(171, 209, 208);
    //if (temp == 2)
    //  fill(111, 187, 177);
    //if (temp == 3)
    //  fill(111, 153, 148);
    //if (temp == 4)
    //  fill(87, 129, 126);
    rect(y, x, w, h);
  }

  void currentColor()
  {
    stroke(0, 50);
    fill(232, 217, 169);
    rect(y, x, w, h);
  }

  void markedColor()
  {
    marked = true ;
    stroke(0, 50);
    fill(207, 155, 161);
    rect(y, x, w, h);
  }

  void returnColor(int i, int j)
  {
    if ( marked )
    {
      markedColor() ;
      //marked = false ;
      return ;
    }

    stroke(0, 50);
    fill( color_arr[a[i][j]] ) ;
    //int temp = a[i][j];
    //if (temp == 1)
    //  fill(171, 209, 208);
    //if (temp == 2)
    //  fill(111, 187, 177);
    //if (temp == 3)
    //  fill(111, 153, 148);
    //if (temp == 4)
    //  fill(87, 129, 126);
    rect(y, x, w, h);
  }

  void largestColor()
  {
    stroke(0, 50);
    //fill(113, 166, 205);
    fill(128) ;
    rect(y, x, w, h);
  }
}
