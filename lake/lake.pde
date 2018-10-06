int count = 1;
int a[][] = {{0, 0, 0, 0, 0, 0, 0}, {0, 0, 1, 2, 3, 0, 0}, {0, 1, 0, 0, 1, 0, 0}, {0, 0, 2, 0, 0, 4, 0}, {0, 1, 0, 3, 0, 2, 0}, {0, 2, 0, 4, 3, 0, 0}, {0, 0, 0, 0, 0, 0, 0}};
int b[][] = {{0}};
int left[][] = {{0,0}, {0,79}, {79,0}, {79,79}};
int sum[] = {0};
int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};

void setup()
{
  size(1200, 1200);
  background(0);        // map is black
  // read the file
} 

void draw()
{
  int m = 0;
  for (int i = 0; i < width; i+=80)
  {
    int n = 0;
    for (int j = 0; j < width; j+=80)
    {
      stroke(0);      // draw the black line

      if (a[m][n] == 0)
        fill(255);
      if (a[m][n] == 1)
        fill(171, 209, 208);
      if (a[m][n] == 2)
        fill(111, 187, 177);
      if (a[m][n] == 3)
        fill(111, 153, 148);
      if (a[m][n] == 4)
        fill(87, 129, 126);
      rect(i, j, 79, 79);
      n++;
    }
    m++;
  }
}  

void mousePressed()
{
  for (int i = 1; i < 7; i++)
  {
    for (int j = 1; j < 7; j++)
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

void dfs(int i, int j)
{
  for (int k = 0; k < 4; k++)
  {
    int tx = i + dx[k];
    int ty = j + dy[k];
    if (a[tx][ty] != 0 && b[tx][ty] == 0)
    {
      b[tx][ty] = b[i][j];
      dfs(tx, ty);
    }
  }
}
