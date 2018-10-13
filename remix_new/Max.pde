void Max()
{
  int sum[] = new int[120];
  for (int i = 0; i < 120; i++)    // initialize
    sum[i] = 0;

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
  //println(index+"    "+max);      // print the volume of the largest lake
  drawMax(index);
}
