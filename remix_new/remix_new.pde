Cell[][] grid;
int count = 1;
int a[][] = {
  {0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 1, 2, 3, 0, 0}, 
  {0, 1, 0, 0, 1, 0, 0}, 
  {0, 0, 2, 0, 0, 4, 0}, 
  {0, 1, 0, 3, 0, 2, 0}, 
  {0, 2, 0, 4, 3, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}};
int b[][] = new int[20][20];
int w[] = {0, 1, 2, 3, 4};
int sum[] = new int[120];
int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};
color color_arr[] = {color(255, 255, 255), color(171, 209, 208), color(111, 187, 177), color(111, 153, 148), color(87, 129, 126)} ;
final int N = 5;
final int dt = 200 ;//delaytime

void setup()
{
  //frameRate(400);
  size(400, 400);
  background(0);

  grid = new Cell[20][20];
  for (int i = 0; i <= N; i++)
    for (int j = 0; j <= N; j++)
      grid[i+1][j+1] = new Cell(i*80, j*80, 80, 80);

  for (int i = 0; i <= N+1; i++)//a,grid build the wall
    a[0][i] = a[i][0] = a[N+1][i] = a[i][N+1] = 0 ;

  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= N; j++)
    {
      b[i][j] = 0 ;
      grid[i][j].display(a[i][j]);
    }
  
  for(int i = N ; i >= 1 ; i--)
    for(int j = N ; j >= 1 ; j--)
    {
      st.push(i,j) ;
      st.col[st.ptr-1] = -1 ;
      if( a[i][j] == 0 )
        st.dir[st.ptr-1] = 5 ;
    }
  st.push(0,0) ;
  noLoop() ;
}

stack st = new stack() ;
boolean cntused = false ;
void draw() {
  while( !st.empty() )
  {
    if( st.xtop() == 0 && st.ytop() == 0 )
    {
      st.pop() ;
      return ;
    }
    int tx = st.xtop() ;
    int ty = st.ytop() ;
    if( st.ctop() == -1 )
    {
      st.col[st.ptr-1] = 0 ;
      if( cntused )
      {
        cntused = false ;
        count++ ;
      }
    }
    if( st.ctop() == 0 )
    {
      println("a") ;
      grid[tx][ty].currentColor();
      delay(dt) ;
      st.col[ st.ptr - 1 ]++ ;
      
      if( grid[tx][ty].marked )
      {
        st.dir[st.ptr-1] = 5 ;
        println("G") ;
      }
      return ;
    }
    else if( st.dtop() == 5 )
    {
      println("b") ;
      grid[tx][ty].returnColor(tx, ty);
      delay(dt) ;
      st.pop() ;
      return ;
    }
    else if( st.ctop() == 1 && st.dtop() != 5 )
    {
      println("c") ;
      grid[tx][ty].markedColor();
      delay(dt) ;
      b[tx][ty] = count;
      cntused = true ;
      st.col[ st.ptr - 1 ]++ ;
      return ;
    }
    while( st.dtop() < 4 )
    {
      print(tx+"  "+ty) ;
      tx += dx[ st.dtop() ] ;
      ty += dy[ st.dtop() ] ;
      print("  "+tx+"   "+ty) ;
      if ( tx < 1 || tx > N || ty < 1 || ty > N )
      {
        println(" ~1") ;
        st.dir[st.ptr-1]++ ;
        return ;
      }
      if( a[tx][ty] == 0 || b[tx][ty] != 0 )
      {
        println(" ~2") ;
        st.dir[st.ptr-1]++ ;
        st.push(tx,ty) ;
        grid[tx][ty].currentColor();
        delay(dt) ;
        st.col[ st.ptr - 1 ]++ ;
        st.dir[st.ptr-1] = 5 ;
        return ;
      }
      if( a[tx][ty] != 0 && b[tx][ty] == 0 )
      {
        println(" ~6") ;
        st.dir[st.ptr-1]++ ;
        //b[tx][ty] = count;
        st.push(tx, ty) ;
        grid[tx][ty].currentColor();
        delay(dt) ;
        st.col[ st.ptr - 1 ]++ ;
        return ;
      }
    }
    println("f") ;
    grid[ st.xtop() ][ st.ytop() ].returnColor(st.xtop(), st.ytop()) ;
    delay(dt) ;
    st.pop() ;
    return ;
  }
  
  Max();
  
  for(int i = 1 ; i <= N ; i++)
  {
    for(int j = 1 ; j <= N ; j++)
      print("  "+b[i][j]) ;
    println() ;
  }
  noLoop() ;
}
void mousePressed()
{
  loop() ;
}
void keyPressed()
{
  redraw() ;
}
