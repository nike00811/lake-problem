class stack
{
  int [] xarr = new int[300] ;
  int [] yarr = new int[300] ;
  int [] dir = new int[300] ;
  int [] col = new int[300] ;  
  int ptr ;
  
  stack()
  {
    ptr = 0 ;
  }
  void push(int x ,int y)
  {
    xarr[ptr] = x ;
    yarr[ptr] = y ;
    dir[ptr] = 0 ;
    col[ptr] = 0 ;
    ptr++ ;
  }
  void pop()
  {
    if(ptr > 0)
      ptr-- ;
  }
  boolean empty()
  {
    if( ptr == 0 )
      return true ;
    else
      return false ;
  }
  int xtop()
  {
    return xarr[ptr-1] ;
  }
  int ytop()
  {
    return yarr[ptr-1] ;
  }
  int dtop()
  {
    return dir[ptr-1] ;
  }
  int ctop()
  {
    return col[ptr-1] ;
  }
}
