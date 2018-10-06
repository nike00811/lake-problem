int count = 1;
int a[][] = {{0, 0, 0, 0, 0, 0, 0}, {0, 0, 1, 2, 3, 0, 0}, {0, 1, 0, 0, 1, 0, 0}, {0, 0, 2, 0, 0, 4, 0}, {0, 1, 0, 3, 0, 2, 0}, {0, 2, 0, 4, 3, 0, 0}, {0, 0, 0, 0, 0, 0, 0}};
int b[][] = new int[20][20];
int left[][] = {{0, 0}, {0, 79}, {79, 0}, {79, 79}};
int sum[] = new int[120];
int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};

void setup()
{
  // size(1200, 1200);   // for the file
  size(400, 400);
  background(0);        // map is black
  // read the file
} 

void draw()
{
  int m = 1;
  for (int i = 0; i < width; i+=80)
  {
    int n = 1;
    for (int j = 0; j < width; j+=80)
    {
      stroke(0);      // draw the black line
      int temp = a[m][n];
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
      rect(i, j, 79, 79);
      n++;
    }
    m++;
  }
}  

void mousePressed()
{
}
