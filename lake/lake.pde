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
final int N = 5 ;

void setup()
{
  // size(1200, 1200);                          // map size for the file
  // String[] s = loadStrings("input.txt");     // read the file
  size(400, 400);                               // map size for test
  background(0);                                // map is black
  init();
} 

void draw()      // show the pic
{
  int m = 1;
  for (int i = 0; i < width; i+=80)
  {
    int n = 1;
    for (int j = 0; j < width; j+=80)
    {
      stroke(0);        // draw the black line
      int temp = a[m][n];
      if (temp == w[0])
        fill(255, 255, 255);
      if (temp == w[1])
        fill(171, 209, 208);
      if (temp == w[2])
        fill(111, 187, 177);
      if (temp == w[3])
        fill(111, 153, 148);
      if (temp == w[4])
        fill(87, 129, 126);
      //rect(i, j, 79, 79);
      rect(j,i, 79, 79);
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
      b[i][j] = 0 ;
    a[0][i] = a[i][0] = a[N+1][i] = a[i][N+1];
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

void mousePressed()
{
  int sum[] = new int[120];
  for (int i = 0; i < 120; i++)
    sum[i] = 0;
    
  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= N; j++)
      if (a[i][j] != 0 && b[i][j] == 0)
      {
        b[i][j] = count;
        count++;
        dfs(i, j);
      }
      
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
