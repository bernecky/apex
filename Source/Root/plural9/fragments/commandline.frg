/*
 * Functions for handling command-line arguments.
 *
 * Robert Bernecky 2012-01-29 Plural code generator
 */

%%%%%%%%%%%%%%%%%%%%% scalar result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment CommandLineArgv x00 x bid i .
int $FNAME( string[] args, $YTYPE y)
{ /* Get Command-line argument element #y as integer scalar */
 
  auto z = to!int( args[ $YTtoI( y)]);
  return( z);
}

%Fragment CommandLineArgv x00 x bid b .
bool $FNAME(string[] args, $YTYPE y)
{ /* Get Command-line argument element #y as boolean scalar */
  auto z = to!bool( args[ $YTtoB( y)]);
  return( z);
}

%Fragment CommandLineArgv x00 x bid c .
char $FNAME(string[] args, $YTYPE y)
{ /* Get Command-line argument element #y as character scalar */
  auto z = to!char( args[ $YTtoC( y)]);
  return( z);
}

%Fragment CommandLineArgv x00 x bid d .
double $FNAME(string[] args, $YTYPE y)
{ /* Get Command-line argument element #y as double scalar */
  auto z = to!double( args[ $YTtoD( y)]);
  return( z);
}


%%%%%%%%%%%%%%%%%%%%% vector result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment CommandLineArgv x01 x bid i .
int[.] $FNAME(string[] args, $YTYPE y)
{ /* Get Command-line argument #y as integer vector 
   *  We can't have a blank in mid-command-line field, so 
   *  here is the format:
   *      1,2,3,4
   */
  int curz;

FIXME;

  /* Stupid sscanf doesn't tell you how many characters it scanned,
   * so we have to do this the hard way.
   */
  s = tochar( argv( toi(y)));
  shpz = sum( _toi_S_( s == ','));
  sstr = _shape_A_(s)[0];
  shpz = ( 0 != sstr) ? shpz + 1 :  0; /* Empty array joke. */
  sstr = ( 0 != sstr) ? sstr     :  0;
  s = [','] ++ s;

  z = genarray([shpz], 0);
  zi = 0;
  for( i=0; i<sstr; i++) {
    if( s[i] == ',') {
      curt = drop([i + 1], s);
      junk, curz = sscanf( to_string( curt), "%d");
      z[zi] = curz;
      zi++;
    }
  }
  return( z);
}
