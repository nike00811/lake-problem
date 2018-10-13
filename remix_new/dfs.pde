void dfs(int i, int j)
{
  for (int k = 0; k < 4; k++)
  {
    int tx = i + dx[k];
    int ty = j + dy[k];
    //println(i+"___"+j) ;
    if ( tx < 1 || tx > N || ty < 1 || ty > N )
      continue ;
    grid[tx][ty].currentColor();      // the wall cannot be colored since it is beyond array boundary
    delay(dt);
    if (a[tx][ty] != 0 && b[tx][ty] == 0)
    {
      b[tx][ty] = b[i][j];
      grid[tx][ty].markedColor();
      //noLoop() ;
      delay(dt);
      //loop() ;
      dfs(tx, ty);
      grid[tx][ty].returnColor(tx, ty);
      //delay(1000);
    } else
    {
      grid[tx][ty].returnColor(tx, ty);
    }
  }
  grid[i][j].marked = false ;
}
