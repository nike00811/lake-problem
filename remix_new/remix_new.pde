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
final int dt = 0 ;//delaytime

void setup()
{
  //frameRate(400);
  size(400, 400);
  background(0);

  grid = new Cell[20][20];
  for (int i = 0; i <= N; i++)
    for (int j = 0; j <= N; j++)
      grid[i+1][j+1] = new Cell(i*80, j*80, 80, 80);

  for (int i = 0; i <= N; i++)//a,grid build the wall & init b[][] = {0}
  {
    a[0][i] = a[i][0] = a[N+1][i] = a[i][N+1] = 0 ;
    for (int j = 0; j <= N; j++)
      b[i][j] = 0;
  }

  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= N; j++) 
      grid[i][j].display(a[i][j]);
}


void draw() {
  //delay(2000);
  for (int i = 1; i <= N; i++)                // the process of dfs
  {
    for (int j = 1; j <= N; j++)
    {
      grid[i][j].currentColor();
      delay(dt) ;
      if (a[i][j] != 0 && b[i][j] == 0)
      {
        grid[i][j].markedColor();
        b[i][j] = count;
        count++;
        delay(dt);
        dfs(i, j);
      }
      grid[i][j].returnColor(i, j);
    }
  }
  //delay(2000);
  Max();
  noLoop() ;
}
