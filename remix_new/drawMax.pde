void drawMax(int index)
{
  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= N; j++)
    {
      if( b[i][j] == index )
        grid[i][j].largestColor();
      else
      {
        grid[i][j].marked = false ;
        grid[i][j].returnColor(i, j);
      }
    }
}
