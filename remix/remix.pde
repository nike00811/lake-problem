Cell[][] grid;
int rows = 5, cols = 5;
int count = 1;
int a[][] = {{0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 1, 2, 3, 0, 0}, 
  {0, 1, 0, 0, 1, 0, 0}, 
  {0, 0, 2, 0, 0, 4, 0}, 
  {0, 1, 0, 3, 0, 2, 0}, 
  {0, 2, 0, 4, 3, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0}};
int b[][] = new int[20][20];
int left[][] = {{0, 0}, {0, 79}, {79, 0}, {79, 79}};
int w[] = {0, 1, 2, 3, 4};
int sum[] = new int[120];
int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};
final int N = 5;

class Cell
{
  int x, y, w, h;

  Cell(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display(int temp)
  {
    stroke(0);
    if (temp == 0)
      fill(255, 255, 255);
    if (temp == 1)
      fill(171, 209, 208);
    if (temp == 2)
      fill(111, 187, 177);
    if (temp == 3)
      fill(111, 153, 148);
    if (temp == 4)
      fill(87, 129, 126);
    rect(y, x, w, h);
  }

  void currentColor()
  {
    noLoop();
    stroke(0);
    fill(232, 217, 169);
    rect(y, x, w, h);
  }

  void markedColor()
  {
    noLoop();
    stroke(0);
    fill(207, 155, 161);
    rect(y, x, w, h);
  }

  void largestColor()
  {
    noLoop();
    stroke(0);
    fill(113, 166, 205);
    rect(y, x, w, h);
  }
}

void setup()
{
  frameRate(4);
  size(400, 400);
  background(0);
  grid = new Cell[rows][cols];
  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      grid[i][j] = new Cell(i*80, j*80, 80, 80);
    }
  }
  init();
}

void draw()
{
  int m = 1;
  for (int i = 0; i < rows; i++)
  {
    int n = 1;
    for (int j = 0; j < cols; j++) 
    {
      int temp = a[m][n];
      //print("mn = " + m + " " + n);
      grid[i][j].display(temp);
      //println(" , ij = " + i + " " + j);
      n++;
    }
    m++;
  }
}

void init()
{
  for (int i = 0; i <= N; i++)
  {
    for (int j = 0; j <= N; j++)
      b[i][j] = 0;
    a[0][i] = a[i][0] = a[N+1][i] = a[i][N+1];        // build the wall
  }
}

void mousePressed()
{
  int sum[] = new int[120];
  for (int i = 0; i < 120; i++)
    sum[i] = 0;

  run();

  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= N; j++)
      sum[b[i][j]] += a[i][j];

  int max = -1, index = 0 ;
  for (int i = 0; i < count; i++)
    if (sum[i] > max)
    {
      max = sum[i];
      index = i;
    }
  println(index+"    "+max);      // print the volume of the largest lake
}

void dfs(int i, int j)
{
  for (int k = 0; k < 4; k++)
  {
    int tx = i + dx[k];
    int ty = j + dy[k];
    grid[i-1][j-1].currentColor();
    if (a[tx][ty] != 0 && b[tx][ty] == 0)
    {
      b[tx][ty] = b[i][j];
      grid[i-1][j-1].markedColor();
      dfs(tx, ty);
    }
  }
}

void run()
{
  for (int i = 1; i <= N; i++)                // the process of dfs
  {
    for (int j = 1; j <= N; j++)
    {
      if (a[i][j] != 0 && b[i][j] == 0)
      {
        b[i][j] = count;
        count++;
        dfs(i, j);
      }
    }
  }
}

void check(int index)
{
  for(int i = 1; i <= N; i++)
  {
    for(int j = 1; j <= N; j++)
    {
      if(b[i][j] == index)
      {
        grid[i-1][j-1].markedColor();
      }
    }
  }
}
