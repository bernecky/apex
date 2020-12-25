/* Various utility functions we need to generate from 
 * time to time.
 *
 * Robert Bernecky 2012-01-29 Plural
 */

%Fragment NOOP *** bidc bidc bidc . $CT
% noop for conjunctions with derived/defined fns as operands

%Fragment xrhoShp X10 i i i .
int xrhoShp( int[] shp)
{  /* Compute product of shape vector elements */
  auto z = 1;
  for( auto i=0; i< shp.length; i++) {
    z = z * shp[i];
  }
  return( z);
}

%Fragment vect2Offset 110 i i i .
int vect2Offset( int[] shp, int[] iv)
{  /* Compute offset into matrix of shape shp for index
    * vector iv. iv may be shorter than shp.
    */
  auto z = 0;
  auto wt = 1;
  for( auto i= iv.length - 1; i>= 0; i-- {
    z = z + iv[i] * wt;
    wt = wt * shp[i];
  }
  return( z);
}

%Fragment binarysearch 100 i i i .
int BinarySearch(int[] x, int y)
{ /* Binary search (sorted) vector x for y */
  /* From "Computer Algorithms", 2nd Ed., Sara Baase 1988 */
  // fixme
  return( -1);
}
                

%Fragment upgrade X11 x id i .
int[] Upgrade($YTYPE y)
{ /* Upgrade on integer/floating vector. 
     Do APL upgrade of vector y using heapsort.
     This version from "Numerical Recipes in C", p. 249
     Robert Bernecky 2005-11-17
     Knuth, Vol. III, pp. 145-148 gives a good example. 
     APL model: (See workspace apex2003/wss/upgrade or
                 apex2003/wif/upgrade)
  */

 z = [42]; /* fixme */
 return(z);
}

int[] MakeHeap($XTYPE v)
{ /* Build heap from vector v. v has at least two elements */
 heap = [42]; /* FIXME */
 return(heap);
}

int[] UnHeap(int[] heap, $YTYPE v)
{ /* Extract heap elements in top-to-bottom order */
  heap = [42];
 return(heap); /* FIXME */
}

int[] Heapness(int L, int ir, $YTYPE q, int indxt, int[] heap, $YTYPE v)
{ /* Restore heap invariant: For Origin-1 a[i], i member 1...N,
     a[i/2]>=a[i].
  */

  heap = [42];
  return(heap);
}               
%Generate , iota, XII, X01, ., $CT

%Fragment Lehmer X00 i i i . I
int Lehmer(int qrl)
{ /* Lehmer's random number generator 
   * CACM 1966-06, p. 432 
   */
  val = tod(qrl)*16807.0;
  z = toi(sacmod(val, 2147483647.0));
 return(z);
}
%Generate , sacmod, DDD, 000, ., D

%Fragment sacmod 000 d d d . D
double sacmod(double x, double y)
{ /* SAC _mod_ for floats */
 if ( 0.0 == y) {
        t = 1.0;
 } else {
        t = y;
 }
 t2 = floor(x/t);
 z = x - (y*t2);
 return(z);
}

%Fragment APEXFUZZEQ 000 d d b . D
bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
  auto tolerance = QUADct * max(abs(x), abs(y));
  auto z = abs(x-y) <= tolerance;
  return(z);
}

%Fragment APEXFUZZEQ 000 bid bid b . $CT
% This fragment isn't needed for anything except double/float
 Can't have duplicate signatures on fns
%Fragment TRANSPOSE X00 bidc bidc bidc . bidc
$ZTYPE TRANSPOSE($YTYPE y)
{ /* Generic monadic transpose on scalar */
 return(y);
}

%Fragment MAXREDUCE XII X I I . I
int MAXREDUCE( int[] y)
{ /* Max-reduce integer vector */
  auto KLUDGE_MININT = cast(int) -2147483648; /* can't find D macro */
  auto z = KLUDGE_MININT; 
  for( auto i=0; i<y.length; i++) {
    z = max( z, y[i]);
  }
  return (z);
}

%Fragment AXISWEIGHTS XII X I I . I
int[] AXISWEIGHTS( int[] y)
{ /* reverse times-scan reverse 1 drop shape(y),1 */
  auto z = new int[ cast(int)y.length];
  z[ cast(int)y.length-1] = 1;
  for( auto i=cast(int)y.length-2; i>=0; i--) {
    z[i] = z[i+1] * y[i+1];
  }
  return( z);
}
 
%Fragment TRANSPOSE X** XII bidc bidc .
Parray * TRANSPOSE(Parray *y)
{ /* Monadic transpose utility */
  auto shpx = VECTORREVERSE( IOTA( cast(int) y.getShp().length));
  auto valx = new Parray( [ cast(int)shpx.length], shpx);
  auto z = TRANSPOSE( valx, y);
  return( z);
}
%Generate , TRANSPOSE, I$YT$YT, 1**, ., $YT
%Generate , IOTA,      XII,     X01, ., I 
%Generate , VECTORREVERSE, XII, X11, ., I 

%Fragment TRANSPOSE 1** I bidc bidc . bidc
Parray* TRANSPOSE(Parray *x, Parray* y)
{ /* Generic dyadic transpose utility, origin-0, non-scalar */
  /* See model T in UTTranspose.dws */

  auto shpy = y.getShp();
  auto valy = y.get$YT();

  auto wts = AXISWEIGHTS( shpy);
  auto rankz = 1 + MAXREDUCE( x.getI()); 
  auto cwts = new int[ wts.length];

  auto shpz = shpy[ 0 .. rankz].dup;
  for( auto i=0; i<cast(int)shpz.length; i++) {
    shpz[i] = cast(int)valy.length;  // Force min() to work
  }
  
  for(auto i=cast(int)y.getShp().length-1; i>=0; i--) {
    auto j = x.getI()[i]; 
    shpz[j] = min( shpz[j], shpy[i]);
    cwts[j] = cwts[j] + wts[i];
  }

  auto cp = CartProdPlus( cwts, shpz);
  auto ry = y.get$YT();
  auto valz = ry.dup; 
  for(auto i=0; i<cast(int)valz.length; i++) {
    valz[i] = ry[ cp[i]];
  }
  auto z = new Parray( shpz, valz);
  return(z); 
}
%Generate , CartProdPlus,  X$YT$ZT, X**, ., $CT 
%Generate , MAXREDUCE,     XII,     XII, ., I
%Generate , AXISWEIGHTS,   XII,     XII, ., I

%Fragment CartProdPlus X** bidc  bidc bidc . bidc
int[] CartProdPlus( int[] cwts, int[] shps)
{
  /* Cartesian product (sum) */
  auto s = cwts[0];
  auto z = [0];
  
  for( auto i=0; i<cast(int)shps.length; i++) {
    auto t = TIMES( cwts[i], IOTA(shps[i]));
    z = RavelJotDotPlus( z, t);
  }
  return(z);
}
%Generate , IOTA,  XII, X01, ., I 
%Generate , TIMES, III, 011, ., I 
%Generate , RavelJotDotPlus, XII, X11, ., I 

%Fragment IOTA X01 I I I I . I 
int[] IOTA( int y)
{ /* Index generator utility */
  auto z = new int[ y];
  foreach (i, ref el; z) {
    el = cast(int) i ;
  }
  return( z);
}

%Fragment TIMES 011 I I I I . I 
int[] TIMES( int x, int[] y)
{ /* SxV multiply */
  auto z = y.dup;
  foreach(i; 0 .. y.length) {
    z[i] = x * y[i];
  }
  return( z);
}

%Fragment RavelJotDotPlus X11 bidc bidc bidc . bidc
int[] RavelJotDotPlus( int[] x, int[] y)
{
  auto lenz = cast(int) x.length * y.length;
  auto z = new int[lenz];

  auto zi = 0;
  for( auto i=0; i<x.length; i++) {
    for( auto j=0; j<y.length; j++) {
      z[zi] = x[i] + y[j];
      zi++;
    }
  }
  return( z);
}

%Fragment VECTORREVERSE X** bidc bidc bidc . bidc
T1[] VECTORREVERSE(T1) (T1[] y)
{
  auto z = y.dup;
  auto len = y.length;
  for( auto i=0; i<len; i++) {
    z[i] = y[ (len-1) - i];
  }
  return( z);
}

%Fragment DFLOORNOFUZZ x00 x  d d . d
int DFLOORNOFUZZ(double y)
{ /* Exact floor (no fuzz) */
 return(DtoI(floor(y)));
}

%Fragment DFLOOR x00 x  d d . d
int DFLOOR(double y, double QUADct)
{ /* Fuzzy floor */
  /* Definition taken from SHARP APL Refman May 1991, p.6-23
   * floor:  n <- (signum y) times nofuzzfloor 0.5+abs y)
   *         z <- n-(QUADct times 1 max abs y)<(n-y)
   * If you want a double result,  write: "y - 1| y".
   */
   n = tod(floor(0.5+fabs(y)));
   if (y < 0.0)
        n = -n;
   else if (0.0 == y)
        n = 0.0;
   range = fabs(y);
   if (1.0 > range)
        range = 1.0;
   fuzzlim = QUADct*range;
   ny = n-y;
   if (fuzzlim < ny)
        z = n - 1.0;
   else
        z = n;
   return(toi(z)); 
}

%Fragment VECTORROTATEAMOUNT 000 i i i . i
int VECTORROTATEAMOUNT(int x, int y)
{ /* Normalize x rotate for array of shape y on selected axis */
 /* normalize rotation count */

if ((0==x) || (0==y))
  z = 0;
else if (x>0)
        z = mod(x,y);
     else
        z = y - mod(abs(x),y);
 return(z);
}

%Fragment VECTORROTATEAMOUNT *0* i i i . i
int[] VECTORROTATEAMOUNT(int[] x, int y)
{ /* Normalize x rotate for array of shape y on selected axis */
 /* normalize rotation count */
 z = fixmewith {
        (. <= iv <= .)
                : VECTORROTATEAMOUNT( x[iv], y);
        } : genarray( shape(x), 0);
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I

%Fragment ABC *00 bidc bidc i . I
int ABC(int I, int Xshape)
{ /* (OLD) Array bounds check for indexed ref X[scalarI] & indexed assign */
 z = I;
 return(z);
}

%Fragment ABC *** bidc bidc i . I
int[] ABC(int[] I, int Xshape)
{ /* (OLD) Array bounds check for indexed ref X[nonscalarI] & indexed assign */
 z = I;
 return(z);
}

%Fragment RadixGradeHistograms x11 x i i . 
int[] RadixGradeHistograms( int[] y)
{ /* Create histograms for integer radix up/downgrade */
  rad = 256;
  radixbase = 8;
  bitsperint = 32;
  numpasses = bitsperint/radixbase;
  hist = genarray( [rad * numpasses], 0);
  hindex = rad * iota( numpasses);
  for( i=0; i<shape(y)[0]; i++) {
    for( p=0; p<numpasses; p++) {
     v = RadixGradeGetIdx( p, y[i]);
     ndx = hindex[p] + v;
     hist[ndx] = hist[ndx] + 1;
    }
  }
  z = reshape( [ numpasses, rad], hist);
 return(z);
}

%Fragment RadixGradeOffsets x11 i i i .
int[] RadixGradeOffsets( int rad, int pas, int[] hist)
{ /* Make per-pass initial offsets into pass result vector */
  rd2 = rad / 2;
  nnv = sum( drop( [rd2], hist[pas])); /* # of negative results */
  z = genarray( [rad], 0);
  if( 0 == pas) {
    /* Fancy footwork here handles negative numbers */
    z[0] = nnv; 
    for( i=0; i<(rd2-1); i++) {
      z[i+1] = z[i] + hist[pas,i];
    }
    for( i=rd2; i<rad-1; i++) {
      z[i+1] = z[i] + hist[pas,i];
    }
  } else {
    for( i=0; i<(rad-1); i++) {
      z[i+1] = z[i] + hist[pas,i];
    }
  }
  return(z);
}

%Fragment RadixGradeGetIdx x00 i i i .
int RadixGradeGetIdx( int pas, int v)
{ /* Get masked value for pass pas and value v */
  bitsperint = 32;
  radixbase = 8;
  numpasses = bitsperint/radixbase;
  rad = 256;
  z = (rad - 1) BitAND BitShiftRight((( numpasses - 1) - pas) * radixbase, v); 
  return(z);
}


