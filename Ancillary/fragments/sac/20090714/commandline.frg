/*
 * Functions for handling command-line arguments.
 *
 * A monadic or dyadic main function will generate
 * Robert Bernecky 2009-04-07
 */

%%%%%%%%%%%%%%%%%%%%% scalar result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment CommandLineArgv x00 x bid i .
inline int $FNAME($YTYPE y)
{ /* Get Command-line argument element #y as integer scalar */
  int z;
  junk, z = sscanf(argv(toi(y)), "%d");
  return( z);
}

%Fragment CommandLineArgv x00 x bid b .
inline bool $FNAME($YTYPE y)
{ /* Get Command-line argument element #y as boolean scalar */
  int z;
  junk, z = sscanf(argv(toi(y)), "%d");
  z = tob(z);
  return( z);
}

%Fragment CommandLineArgv x00 x bid c .
inline char $FNAME($YTYPE y)
{ /* Get Command-line argument element #y as character scalar */
  int z;
  junk, z = sscanf(argv(toi(y)), "%c");
  return( z);
}

%Fragment CommandLineArgv x00 x bid d .
inline double $FNAME($YTYPE y)
{ /* Get Command-line argument element #y as double scalar */
  int z;
  junk, z = sscanf(argv(toi(y)), "%g");
  return( z);
}


%%%%%%%%%%%%%%%%%%%%% vector result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment CommandLineArgv x01 x bid i .
inline int[.] $FNAME($YTYPE y)
{ /* Get Command-line argument #y as integer vector 
   *  We can't have a blank in mid-command-line field, so 
   *  here is the format:
   *      1,2,3,4
   */
  int curz;

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
