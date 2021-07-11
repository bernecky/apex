import std.stdio;
import std.algorithm;
//import parray;
import std.conv;
import std.math;

// Coercions to/from Parrays

Parray* BtoB( Parray* y)
{  
  return(y);
}

Parray* ItoI( Parray* y)
{  
  return(y);
}

Parray* DtoD( Parray* y)
{  
  return(y);
}

Parray* CtoC( Parray* y)
{  
  return(y);
}

Parray* BtoI( Parray* y)
{  
  auto vb = y.getB().dup;
  auto vi = new int[vb.length]; 

  foreach (i; 0 .. vb.length ) {
   vi[i] = vb[i] ?  1 : 0;
  }
  auto z = new Parray( y.getShp(), vi);
  return(z);
}

Parray* BtoD( Parray* y)
{  
  auto vb = y.getB().dup;
  auto vd = new double[vb.length]; 

  foreach (i; 0 .. vb.length ) {
   vd[i] = vb[i] ?  1.0 : 0.0;
  }
  auto z = new Parray( y.getShp(), vd);
  return(z);
}

Parray* ItoB( Parray* y)
{  
  auto vi = y.getI().dup;
  auto vb = new double[vi.length]; 

  foreach (i; 0 .. vi.length ) {
   vb[i] = ( 1 == vi[i]) ? true : false;
  }
  auto z = new Parray( y.getShp(), vb);
  return(z);
}

Parray* ItoD( Parray* y)
{  
  auto vi = y.getI().dup;
  auto vd = new double[vi.length]; 

  foreach (i; 0 .. vi.length ) {
   vd[i] = cast(double) vi[i];
  }
  auto z = new Parray( y.getShp(), vd);
  return(z);
}

Parray* DtoB( Parray* y)
{  
  auto vd = y.getD().dup;
  auto vb = new bool[vd.length]; 

  foreach (i; 0 .. vd.length ) {
   vb[i] = ( 1.0 == vd[i]) ? true : false;
  }
  auto z = new Parray( y.getShp(), vb);
  return(z);
}

Parray* DtoI( Parray* y)
{  
  auto vd = y.getD().dup;
  auto vi = new int[vd.length]; 

  foreach (i; 0 .. vd.length ) {
   vi[i] = cast(int) vd[i];
  }
  auto z = new Parray( y.getShp(), vi);
  return(z);
}

// Coercions to/from scalar types

bool BtoB( bool y)
{  
  return(y);
}

int ItoI( int y)
{  
  return(y);
}

double DtoD( double y)
{  
  return(y);
}

char CtoC( char y)
{  
  return(y);
}

int BtoI( bool y)
{  
  auto z = y ? 1 : 0;
  return(z);
}

double BtoD( bool y)
{  
  auto z = y ? 1.0 : 0.0;
  return(z);
}

bool ItoB( int y)
{  
  auto z = ( 1 == y) ? true : false;
  return(z);
}

double ItoD( int y)
{  
  auto z = cast(double) y;
  return(z);
}

bool DtoB( double y)
{  
  auto z = ( 1.0 == y) ? true : false;
  return(z);
}

int DtoI( double y)
{  
  auto z = cast(int) y;
  return(z);
}

// Coercions to/from vectors

bool[] BtoB( bool[] y)
{  
  return(y);
}

int[] ItoI( int[] y)
{  
  return(y);
}

double[] DtoD( double[] y)
{  
  return(y);
}

char[] CtoC( char[] y)
{  
  return(y);
}

int[] BtoI( bool[] y)
{  
  auto z = new int[y.length]; 
  foreach (i; 0 .. y.length ) {
    z[i] = y[i] ?  1 : 0;
  }
  return(z);
}

double[] BtoD( bool[] y)
{  
  auto z = new double[y.length]; 

  foreach (i; 0 .. y.length ) {
    z[i] = y[i] ?  1.0 : 0.0;
  }
  return(z);
}

bool[] ItoB( int[] y)
{  
  auto z = new bool[y.length]; 
  foreach (i; 0 .. y.length ) {
    z[i] = ( 1 == z[i]) ? true : false;
  }
  return(z);
}

double[] ItoD( int[] y)
{  
  auto z = new double[y.length]; 
  foreach (i; 0 .. y.length ) {
    z[i] = cast(double) y[i];
  }
  return(z);
}

bool[] DtoB( double[] y)
{  
  auto z = new bool[y.length]; 
  foreach (i; 0 .. y.length ) {
    z[i] = ( 1.0 == y[i]) ? true : false;
  }
  return(z);
}

int[] DtoI( double[] y)
{  
  auto z = new int[y.length]; 
  foreach (i; 0 .. y.length ) {
    z[i] = cast(int) y[i];
  }
  return(z);
}

Parray* CV2Parray( T1)( T1[] vec)
{ /* Constant Vector to Parray */
  auto shpz = [ cast(int) vec.length];
  auto z = new Parray( shpz, vec);
  return(z);
}


/* Compiled by APEX Version: /home/apex/apex3/wss/plural8.dws2012-05-14 17:44:12.155 */

///module parray;

/// import std.stdio;

// Plural array data structures
//
// A program refers to an array via a Parray. 
// The Parray points to the array's shape vector and
// raveled value vector.
//
// A Plural array is a pair of the array's shape and raveled value.
//
struct Parray {
  int[] shp;
  union {
    bool[]   _bval = null;
    int[]    _ival;
    double[] _dval;
    char[]   _cval;
  }
    // Add new basic types here.
    this( int[] shp, bool[] val) {
      this.shp = shp;
      this._bval = val;
    }
    this( int[] shp, int[] val) {
      this.shp = shp;
      this._ival = val;
    }
    this( int[] shp, double[] val) {
      this.shp = shp;
      this._dval = val;
    }

   public:
     int[] getShp() {
       return( shp);
     }

     bool[] getB() {
       return( _bval);
     }

     int[] getI() {
       return( _ival);
     }

     double[] getD() {
       return( _dval);
     }

     char[] getC() {
       return( _cval);
     }
}
unittest {
  writeln( "got to unittest for Array.d ");
  auto v = Parray();
  assert( (null == v.shp) && ( null == v._ival));
  assert( ( null == v._bval));
  assert( ( null == v._ival));
  assert( ( null == v._dval));
}
int minXDI(double y,double QUADct)
{ return(DFLOOR(y,QUADct));
}



Parray*  modXII(Parray* y)
{ /* Monadic scalar functions on array */
  auto shp = y.getShp();
  auto val = new I[ xrhoShp( shp)];
  foreach ( i; 0 .. val.length) {
    val[i] = modXII(ItoI(y.getI()[i]));
  }
  auto z = new Parray( shp, val);

  return(z);
}


int mpyIII(int x, int y)
{ return(ItoI(x)*ItoI(y));
}

double divIID(int x, int y)
{ auto dx = ItoD(x);
  auto dy = ItoD(y);
  auto z = (dx == dy) ? 1.0  : dx/dy;
  return(z);
}

double plusDDD(double x, double y)
{ return(DtoD(x)+DtoD(y));
}

int plusIII(int x, int y)
{ return(ItoI(x)+ItoI(y));
}

bool eqIIB(int x, int y)
{ /* A=B on non-doubles */
  return(ItoI(x) == ItoI(y));
}

int barBBI(bool x, bool y)
{ return(BtoI(x)-BtoI(y));
}

Parray* plusIII( int x, Parray* y ) {
  /* SxA scalar function */
  auto v = new Parray *[y.getI().length];
  auto xel = ItoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = plusIII(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* barIBI( Parray* x, bool y) {
  /* AxS scalar function */
  auto v = new Parray *[x.getI().length];
  auto xels = x.getI();
  auto yel = BtoI(y);
  foreach( i; 0 .. x.getI().length) {
    v[i] = barIII(ItoI(xels[i]),yel);
  }
  auto z = new Parray( x.getShp(), v);
  return( z);
}


Parray* eqIBB( Parray* x, bool y) {
  /* AxS scalar function */
  auto v = new Parray *[x.getI().length];
  auto xels = x.getI();
  auto yel = BtoI(y);
  foreach( i; 0 .. x.getI().length) {
    v[i] = eqIIB(ItoI(xels[i]),yel);
  }
  auto z = new Parray( x.getShp(), v);
  return( z);
}


Parray* eqIIB( int x, Parray* y ) {
  /* SxA scalar function */
  auto v = new Parray *[y.getI().length];
  auto xel = ItoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = eqIIB(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* modIII( int x, Parray* y ) {
  /* SxA scalar function */
  auto v = new Parray *[y.getI().length];
  auto xel = ItoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = modIII(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* eqCCB( char x, Parray* y ) {
  /* SxA scalar function */
  auto v = new Parray *[y.getC().length];
  auto xel = CtoC(x);
  auto yels = y.getC();
  foreach( i; 0 .. y.getC().length) {
    v[i] = eqCCB(xel, CtoC(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray * comaXBB(Parray * y)
{ /* Ravel of anything with rank>1 */
  auto yval = y.getB();
  auto shp = new int[ 1];
       shp[0] = cast( int) yval.length;
  auto z = new Parray( shp, yval);
  return(z);
}

Parray * tranBII(Parray * x, Parray * y, int QUADio)
{ /* General case of dyadic transpose  */
  /* Someone has to validate x here! FIXME */
  nx = BtoI(x) - QUADio;
  z = TRANSPOSE( nx, y);
  return( z);
}

Parray * epsIIB(Parray * x, Parray * y)
{ /*  Fuzzy, non-fuzzy Membership AxA*/
/* General case: uses HeapGrade */
FIXME;
 z = [true];
 return(z);
}






Parray* rhoIII(int x, int y)
{ /* Scalar reshape scalar to vector) */
  auto xrho = ItoI( x);
  auto shpz = [ xrho];
  auto valz = new int[ xrho];
  foreach( i; 0 .. xrho) {
    valz[i] = y;
  }
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray* rhoIII(Parray * x, Parray * y)
{ /* Vector x reshape, with potential item reuse */

  auto shpz = x.getI();
  auto zrho = xrhoShp( shpz);
  auto yrho = xrhoShp( y.getShp());
  auto valy = y.getI();
  auto valz = valy.dup;
       valz.length = zrho;
  auto yi=0;
  for( auto zi=0; zi<zrho; zi++) {
    valz[zi] = valy[yi];
    yi = yi + 1;
    yi = (yi == yrho) ? 0 : yi;
  }
  auto z = new Parray( shpz, valz);
  return(z);
}


Parray * FNAME(int x, Parray * y)
{ /* Scalar drop non-scalar */
  auto i = ItoI( x);
  assert( 1 == y.getI().length); /* FIXME: Higher-rank generalized drop */
  auto shp = max(0, y.getI().length - abs(i));
  auto offset = i<0 ? 0 : i;
  auto val = y[ offset .. shp].dup;
  auto z = new Parray( shp, val);
  return( z);
}

Parray * takeIII(int x, Parray * y)
{ /* Scalar take vector */
  return(take([ItoI(x)], y));
}

Parray* iotaXII(int y, int QUADio)
{ /* Index generator on Scalar */
  auto v = ItoI( y);
  auto s = [ v];
  auto val = new int[ v];

  foreach (i, ref el; val) {
    el = QUADio + cast(int) i ;
  }

  auto z = new Parray( s, val);
  return( z);
}
//unittest {
//  auto vec = iotaXII(5);
//  auto shp = vec.getShp();
//  auto val = vec.getInt();
//  assert( 5 == shp[0]);
//  writeln(" iota shape is %d\n",  shp);
//  writeln(" iota value is %d\n",  val);
//}

Parray* rhoXII(Parray * y)
{ /* Shape of non-scalar */
  auto val = y.getShp();
  auto shp = [ cast(int) val.length];
  auto z = new Parray( shp, val);
  return( z);
}

Parray * ugrdXII(Parray * y, int QUADio)
{ /* Integer vector upgrade
   * See radix upgrade model in ws RadixGrade.dws
   */
  rad = 256;
  radixbase = 8; /* 2 log rad */
  bitsperint = 32;
  numpasses = bitsperint/8;
  hist = RadixGradeHistograms( y);
  z = genarray( shape(y), -1);
  if( 0 != shape(y)[0]) {
    pv = iota(shape(y)[0]);
    /* LSB-> MSB sort order */
    for( pas=numpasses-1; pas>=0; pas--) {
      /* Skip pass if all nums in same bucket */
      if( shape(y)[0] != hist[pas, RadixGradeGetIdx( pas, y[pv[0]])]) {
        pvo = RadixGradeOffsets( rad, pas, hist);
        for( i=0; i<shape(y)[0]; i++) {
          val = RadixGradeGetIdx( pas, y[pv[i]]);
          z[pvo[val]] = pv[i];
          pvo[val] =  pvo[val] + ((val<0) ? -1 : 1);
        }
        pv = z;
      }
    }
  }
  z = QUADio + z;
  return( z);
}




int quadXII(int y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar */
  writeln(y);
  return(y);
}
Parray* comaBII(bool x, Parray* y)
{/* SxV catenate first (or last) axis */
  auto shpz = [ 1 + xrhoShp( y.getShp2)];
  auto valz = BtoI( x) ~ ItoI( y.getI());
  auto z = new Parray( shpz, valz);
  return(z);
}


Parray* comaBII(bool x, Parray* y)
{ /* S,A last-axis catenate */

  auto yshp = y.getShp();
  auto yval = y.getI();
  auto xval = BtoI( x);

  auto framecnt = xrhoShp( frameshp);
  auto frameshp = yshp[ 0 .. $-1];
  auto ycellxrho = yshp[ $-1];
  auto zcellxrho = ycellxrho + 1;
  auto zxrho = zcellxrho * framecnt;
  auto zshp = frameshp ~ 1;
  auto zval = new Parray *[ 0];

  foreach ( i; 0 .. framecnt ) {
   /* Construct via repeated catenation! */
   /* Not sure if this will be amazingly slow... */
   offset = i * ycellxrho;
   zval = zval ~ ( xval[ offset .. (offset + ycellxrho)] ~ xval);
  }

  return(z);
}

Parray * dtakIII(int x, Parray * y)
{ /* Scalar basevalue rank>1 */
  
  return( y);
}

Parray * indr(Parray * X, Parray *I)
{ /* X[nonscalarI;;;] */
 defcell = genarray(drop([1],shape(X)),0);
 z = with {
        (. <= iv <= .)
                : X[[I[iv]]];
        } : genarray(shape(I), defcell);
 return(z);
}





Parray * indr(Parray * X)
{ /* X[;;;] */
  /* Used only in conjunction with other indexing, e.g.,
   * X[;;j;]
   */
 return(X);
}




Parray * indr(Parray * X, $YTYPE I)
{ /* X[nonscalarI;;;] */
 defcell = genarray(drop([1],shape(X)),' ');
 z = with {
        (. <= iv <= .)
                : X[[I[iv]]];
        } : genarray(shape(I), defcell);
 return(z);
}





Parray * jotdotmodIII(int x, Parray * y)
{ /* AxA outer product */
 FIXME;
 cell = genarray(shape(y), 0);

 z = with {
        (. <= iv <= .) {
         xitem = toI(x[iv]);
        } : modIII(xitem, toI(y));
        } : genarray(shape(x), cell);
 return(z);
}

Parray * jotdotplusIII(int x, Parray * y)
{ /* AxA outer product */
 FIXME;
 cell = genarray(shape(y), 0);

 z = with {
        (. <= iv <= .) {
         xitem = toI(x[iv]);
        } : plusIII(xitem, toI(y));
        } : genarray(shape(x), cell);
 return(z);
}

Parray * slBII(Parray * x, Parray * y)
{/* Boolean vector compress vector */
 zxrho = sum(toi(x));
 z = genarray([zxrho], 0);
 zi = 0;
 for(i=0; i<shape(x)[0]; i++)
   if ( x[i]) {
    z[[zi]] = y[[i]];
    zi++;
   }
 return(z);
}

int plusbslXII(Parray * y)
{ /* Scan of vector */
/* This does the scan in the wrong direction, but since
 * we assume associative functions only, it should be ok.
 */
 size = shape(y);
 z = genarray(size,toI(0));
 if (0 != size[[0]]) {
        /* real work to do */
        z[[0]] = toI(y[[0]]); /* Not sure about the coercion... */
        for ( i=1; i<size[[0]]; i++) {
                z[[i]] = plusIII(toI(z[[i-1]]),toI(y[[i]]));
        }
  }
 return(z);
}



int plusslXII( Parray* y)
{ /* First/last axis slow reduction of vector.
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */

  auto v = y.getI();
  auto z = ItoI( 0);
  for( auto i=0; i<v.length; i++) {
    z = plusIII( z, ItoI( v[i]));
  }
  return(z);
}


int plusbslXBI(Parray * y)
{ /* Scan of vector */
/* This does the scan in the wrong direction, but since
 * we assume associative functions only, it should be ok.
 */
 size = shape(y);
 z = genarray(size,toI(0));
 if (0 != size[[0]]) {
        /* real work to do */
        z[[0]] = toI(y[[0]]); /* Not sure about the coercion... */
        for ( i=1; i<size[[0]]; i++) {
                z[[i]] = plusIBI(toB(z[[i-1]]),toB(y[[i]]));
        }
  }
 return(z);
}



int mpyslXII( Parray* y)
{ /* First/last axis slow reduction of vector.
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */

  auto v = y.getI();
  auto z = ItoI( 1);
  for( auto i=0; i<v.length; i++) {
    z = mpyIII( z, ItoI( v[i]));
  }
  return(z);
}


int plussl1XBI(Parray * y)
{ /* first-axis reduce rank-2 matrix */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : plusslXBI(yt[iv]);
        } : genarray(zrho, 0);
  return(z);
}






int barbslXII(Parray * y)
{ /* Scan of vector */
/* This does the scan in the wrong direction, but since
 * we assume associative functions only, it should be ok.
 */
 size = shape(y);
 z = genarray(size,toI(0));
 if (0 != size[[0]]) {
        /* real work to do */
        z[[0]] = toI(y[[0]]); /* Not sure about the coercion... */
        for ( i=1; i<size[[0]]; i++) {
                z[[i]] = barIII(toI(z[[i-1]]),toI(y[[i]]));
        }
  }
 return(z);
}



int plusbslXII(Parray * y)
{ /* Scan of matrix along last axis */
defcell = genarray(take([-1], shape(y)), 0);
z = with{
        (. <= iv <= .) :  plusbslXII(y[iv]);
        } : genarray(drop([-1],shape(y)), defcell);
 return(z);
}


int plusslXBI( Parray* y)
{ /* First/last axis slow reduction of vector.
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */

  auto v = y.getB();
  auto z = BtoB( 0);
  for( auto i=0; i<v.length; i++) {
    z = plusIII( z, BtoB( v[i]));
  }
  return(z);
}


int modXII(int y)
{ return(abs(ItoI(y)));
}

int barIBI(int x, bool y)
{ return(ItoI(x)-BtoI(y));
}

bool eqIBB(int x, bool y)
{ /* A=B on non-doubles */
  return(ItoI(x) == BtoI(y));
}

int modIII(int x, int y)
{ /* SxS residue (aka modulo) */
  /* (x residue y) <-->   y-x times floor y divide x + 0 = x  */
  int z;

  auto x = ItoI(x);
  auto y = ItoI(y);
  if (0 == x) {
    z = y;
  } else {
    auto q = y / x;
    z = y - ( x * q);
  }
  return(z);
}

bool eqCCB(char x, char y)
{ /* A=B on non-doubles */
  return(CtoC(x) == CtoC(y));
}

int plusIBI(int x, bool y)
{ return(ItoB(x)+BtoB(y));
}

int barIII(int x, int y)
{ return(ItoI(x)-ItoI(y));
}

int BinarySearch(Parray * x, Parray * y, int[] PV)
{ /* Binary search x[PV] for y
   * PV is a permutation vector guaranteed to bring y into
   * non-descending order
   * If not-found, result is shape(x)
   */
 FIXME;
 found = false;
 first = 0;
 sx  = (shape(PV))[[0]];
 indx = -1;                   /* Bobbo kant kode if this appears! */
 last = sx - 1;
 while ((first <= last) && !found) {
        indx = (first+last)/2;  /* index of middle entry */
        xval = toI(x[[PV[[indx]]]]);
        yval = toI(y); /* This is wrong - type coercion may fail! */
        if (    yval == xval) {
                found = true;
        } else if (yval < xval) {
                last = indx - 1;
        } else {
                first = indx + 1;
        }
 }
 z = found ? indx : sx;
 return(z);
}

int MinMatch (Parray * x, int[] PV, int i)
{ /* Search permutation vector for minimum match.
   * i is an index into PV. PV is a permutation vector for
   * x that places x in non-descending order.
   *  We want minimum index into x that matches x[[PV[[i]]]]
   *  Because upgrade is stable, we only have to look left
   *  (except for real/complex x with non-zero {quad}ct)
   */
 v = x[[PV[[i]]]];
 j = i - 1;
 r = i;
 while (j >= 0) {
        if ( v == x[[PV[[j]]]]) {
                r = j;        /* new minimum index */
        } else {
                j = -1;       /* no more matches. Stop */
        }
        j = j - 1;
 }
 return(r);
}

int[] EPIORemoveDups (Parray * x, int[] PV)
{ /* Remove dups from PV of sorted left argument to indexof(right arg of membership */
 FIXME;
 z = PV;
 shp = (shape(PV))[[0]];
 if (0 != shp) {
        sink = 0;
        source = 1;
        while (source < shp) {
                if ( x[[z[[sink]]]] != x[[PV[[source]]]]) {
                        sink++;
                        z[[sink]] = PV[[source]];
                }
                source++;
        }
 z = take([sink+1], z);
 }
 return(z);
}

int UpgradeHeap(Parray * y)
{
/*    Do APL upgrade of array y using heapsort.
      This is a sub-function shared by upgrade/downgrade/indexof, etc.
      This version adapted from the Sara Baase "Computer Algorithms"
      version of heapsort.
     Robert Bernecky 2006-11-14
     Knuth, Vol. III, pp. 145-148 gives a good example.
     APL model: (See workspace apex2003/wss/upgrade or
                 apex2003/wif/upgrade)
                Also UTGrade.dws
r{<-}upgradeHeap v;#io;N;heap
@ Upgrade vector using heapsort
#io{<-}0
N{<-}{rho}v
:if N{<=}1
  r{<-}{iota}N
:else
  heap{<-}MakeHeap(v)
  r{<-}(UnHeap(heap))
:endif
*/

 N = shape(y)[[0]];
 if (N <= 1)
        z = iota(N);
 else{
        heap = MakeHeap(y);
        z = UnHeap(heap,y);
 }
 return(z);
}


int[] MakeHeap(Parray * v)
{ /* Build heap from array v. v has at least two elements */
/*
r{<-}MakeHeap v;i;n;heap;biggest
@ Build heap from v
@ We know v has at least two elements
N{<-}{rho}v
heap{<-}{iota}N
:for i :in {reverse}{iota}{floor}N{divide}2
  y FixHeap i,heap[i],n
:endfor
r{<-}heap
*/
 n = shape(v)[[0]];
 heap = iota(n);
 lim = n/2;
 for(i=lim-1; i>=0; i--) {
        heap = FixHeap(heap, v, i, heap[[i]], n);
 }
 return(heap);
}

int[] UnHeap(int[] heap, Parray * v)
{ /* Extract heap elements in top-to-bottom order */
  n = shape(v)[[0]];
  for(heapsize= n-1; heapsize>0; heapsize--){
        biggest = heap[[0]];
        heap = FixHeap(heap,v,0,heap[[heapsize]],heapsize);
        heap[[heapsize]] = biggest;
  }
 return(heap);
}

int[] FixHeap(int[] heap, Parray * v, int root,
        int heapitem, int heapsize)
{ /* Restore heap invariant: parent>= both children */
 vacant = root;
 lchild = 1+vacant+vacant;
 while( lchild < heapsize) {
        bigC = lchild;      /* Identify larger child, if any */
        rchild = lchild+1;
        if ((lchild<(heapsize-1))){
                li = heap[[lchild]];
                ri = heap[[rchild]];
                if ((GradeGT(v[[ri]],v[[li]])) ||
                        (match(v[[ri]], v[[li]])&&(ri>li))){ /* Stability */
                bigC = rchild; /* right child larger */
                }
        }
        /* parent vs big kid*/
        li = heap[[bigC]];
        if ((GradeGT( v[[li]], v[[heapitem]])) ||
                (match(v[[li]], v[[heapitem]]) &&(li>heapitem))) {
                        heap[[vacant]] = heap[[bigC]];
                        vacant = bigC;
                        lchild = 1+vacant+vacant;
        } else lchild = heapsize;   /* exitloop */
 }
 heap[[vacant]] = heapitem;
 return(heap);
}



int dtakIII(int x, Parray * y)
{ /* Scalar basevalue vector */
fixme
 ycols=shape(y);
 weights = genarray(ycols, toI(1));
 for (i=ycols[[0]]-2; i>=0; i--)
        weights[[i]] = weights[[i+1]]*toI(x);
 /* Now, we just do weights +.* y */
 z = with {
        ([0] <= iv < ycols)
                : weights[iv] * toI(y[iv]);
        } : fold(+, 0);
 return(z);
}

Parray * indrfr(int fr, Parray * X, $YTYPE I)
{ /* X[;;;I;;;], where I has fr (framerank) semicolons to its left */
  /* This is actually "I from"fr X" */
  frameshape = take([fr], shape(X));
  cellshape =  shape(I)++drop([fr+1], shape(X));
  cell = genarray(cellshape, 0);
 z = with {
        (. <= iv <= .)
                : indrfr0(X[iv], I);
        } : genarray(frameshape, cell);
 return(z);
}

Parray * indrfr0(Parray * X, $YTYPE I)
{ /* X[I;;;] or    I from X */
  cellshape =  drop([1], shape(X));
  cell = genarray(cellshape, 0);
 z = with {
        (. <= iv <= .)
                : sel( I[iv], X);
        } : genarray(shape(I), cell);
 return(z);
}



Parray * indrfr(int fr, Parray * X, int I)
{ /* X[;;;I;;;], where I has fr (framerank) semicolons to its left */
  /* This is actually "I from"fr X" */
 frameshape = take([fr], shape(X));
 cellshape = drop([1+fr],shape(X));
 cell = genarray(cellshape,0);
 z = with {
        (. <= iv <= .)
                : sel( I, X[iv]);
        } : genarray(frameshape, cell);
 return(z);
}


Parray * indrfr(int fr, Parray * X, $YTYPE I)
{ /* X[;;;I;;;], where I has fr (framerank) semicolons to its left */
  /* This is actually "I from"fr X" */
  frameshape = take([fr], shape(X));
  cellshape =  shape(I)++drop([fr+1], shape(X));
  cell = genarray(cellshape, ' ');
 z = with {
        (. <= iv <= .)
                : indrfr0(X[iv], I);
        } : genarray(frameshape, cell);
 return(z);
}

Parray * indrfr0(Parray * X, $YTYPE I)
{ /* X[I;;;] or    I from X */
  cellshape =  drop([1], shape(X));
  cell = genarray(cellshape, ' ');
 z = with {
        (. <= iv <= .)
                : sel( I[iv], X);
        } : genarray(shape(I), cell);
 return(z);
}



Parray * indrfr(int fr, Parray * X, int I)
{ /* X[;;;I;;;], where I has fr (framerank) semicolons to its left */
  /* This is actually "I from"fr X" */
 frameshape = take([fr], shape(X));
 cellshape = drop([1+fr],shape(X));
 cell = genarray(cellshape,' ');
 z = with {
        (. <= iv <= .)
                : sel( I, X[iv]);
        } : genarray(frameshape, cell);
 return(z);
}


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

int xrhoShp( int[] shp)
{  /* Compute product of shape vector elements */
  auto z = 1;
  for( auto i=0; i< shp.length; i++) {
    z = z * shp[i];
  }
  return( z);
}

Parray* TRANSPOSE(Parray *x, Parray* y)
{ /* Generic dyadic transpose utility, origin-0, non-scalar */
  /* See model T in UTTranspose.dws */

  auto shpy = y.getShp();
  auto valy = y.getI();

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
  auto ry = y.getI();
  auto valz = ry.dup;
  for(auto i=0; i<cast(int)valz.length; i++) {
    valz[i] = ry[ cp[i]];
  }
  auto z = new Parray( shpz, valz);
  return(z);
}




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

int RadixGradeGetIdx( int pas, int v)
{ /* Get masked value for pass pas and value v */
  bitsperint = 32;
  radixbase = 8;
  numpasses = bitsperint/radixbase;
  rad = 256;
  z = (rad - 1) BitAND BitShiftRight((( numpasses - 1) - pas) * radixbase, v);
  return(z);
}


Parray * TRANSPOSE(Parray *y)
{ /* Monadic transpose utility */
  auto shpx = VECTORREVERSE( IOTA( cast(int) y.getShp().length));
  auto valx = new Parray( [ cast(int)shpx.length], shpx);
  auto z = TRANSPOSE( valx, y);
  return( z);
}




int[] ABC(int[] I, int Xshape)
{ /* (OLD) Array bounds check for indexed ref X[nonscalarI] & indexed assign */
 z = I;
 return(z);
}

int ABC(int I, int Xshape)
{ /* (OLD) Array bounds check for indexed ref X[scalarI] & indexed assign */
 z = I;
 return(z);
}

int plusslXBI( Parray* y)
{ /* First/last axis slow reduction of vector.
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */

  auto v = y.getB();
  auto z = BtoI( 0);
  for( auto i=0; i<v.length; i++) {
    z = plusIII( z, BtoI( v[i]));
  }
  return(z);
}


bool GradeGT(int x, int y)
{ /* Integer Comparator for upgrade */
 return(x>y);
}

bool GradeGT(Parray * x, Parray * y)
{ /* Integer Array Comparator for upgrade */
  /* The ravels of the two arrays are compared.  */
  z = with {
       (0*shape(x) <= iv < shape(x))
                : x[iv] > y[iv];
        }: foldfix( &, true,false);
 return(z);
}

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




int MAXREDUCE( int[] y)
{ /* Max-reduce integer vector */
  auto KLUDGE_MININT = cast(int) -2147483648; /* can't find D macro */
  auto z = KLUDGE_MININT;
  for( auto i=0; i<y.length; i++) {
    z = max( z, y[i]);
  }
  return (z);
}

int[] AXISWEIGHTS( int[] y)
{ /* reverse times-scan reverse 1 drop shape(y),1 */
  auto z = new int[ cast(int)y.length];
  z[ cast(int)y.length-1] = 1;
  for( auto i=cast(int)y.length-2; i>=0; i--) {
    z[i] = z[i+1] * y[i+1];
  }
  return( z);
}

int[] IOTA( int y)
{ /* Index generator utility */
  auto z = new int[ y];
  foreach (i, ref el; z) {
    el = cast(int) i ;
  }
  return( z);
}

T1[] VECTORREVERSE(T1) (T1[] y)
{
  auto z = y.dup;
  auto len = y.length;
  for( auto i=0; i<len; i++) {
    z[i] = y[ (len-1) - i];
  }
  return( z);
}

Parray* TRANSPOSE(Parray *x, Parray* y)
{ /* Generic dyadic transpose utility, origin-0, non-scalar */
  /* See model T in UTTranspose.dws */

  auto shpy = y.getShp();
  auto valy = y.getB();

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
  auto ry = y.getB();
  auto valz = ry.dup;
  for(auto i=0; i<cast(int)valz.length; i++) {
    valz[i] = ry[ cp[i]];
  }
  auto z = new Parray( shpz, valz);
  return(z);
}




int[] TIMES( int x, int[] y)
{ /* SxV multiply */
  auto z = y.dup;
  foreach(i; 0 .. y.length) {
    z[i] = x * y[i];
  }
  return( z);
}

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

Parray * COPIESIII(Parray * A, Parray * B,int QUADio)
{ 
/*
 ?
*/
auto A_10=( -1);
 auto A_11=( false);
 auto A_20=comaBII(A_11,B);
 auto A_21=plusbslXII( A_20);
 auto A_25=dropIII(A_10,A_21);
 auto A_26=plusslXII( B);
 auto A_31=iotaXII( A_26,QUADio);
 A_33epsIIB(A_31,A_25) auto A_34=plusbslXBI( A_33);
 auto A_38=plusIII(A_10,A_34);
 A_39= ABC(toi(A_38)-QUADio,shape(A)[0]);
A_41indr(A,A_39) auto C_0=( A_41);
 return(C_0);
}

Parray * LINEARIII(int N, Parray * M)
{ 
/*
 ?
*/
auto A_10=( true);
 auto A_19=barIBI(M,A_10);
 auto A_20=dtakIII(N,A_19);
 auto Z_0=( A_20);
 return(Z_0);
}

Parray * PRIMESXIB(Parray * A ,int QUADio)
{ 
/*
 ?
*/
auto A_12=( false);
 auto A_13=( 2);
 auto A_27=rhoXII( A);
 auto A_28=mpyslXII( A_27);
 auto S_0=( A_28);
 auto A_34=iotaXII( S_0,QUADio);
 auto A_36=iotaXII( S_0,QUADio);
 auto A_37=jotdotmodIII(A_36,A_34);
 auto T_0=( A_37);
 auto A_47=eqIBB(T_0,A_12);
 auto A_48=plussl1XBI( A_47);
 auto T_1=( A_48);
 auto A_54=iotaXII( S_0,QUADio);
 auto A_56=eqIIB(A_13,T_1);
 auto A_57=slBII(A_56,A_54);
 A_59epsIIB(A,A_57) auto X_0=( A_59);
 return(X_0);
}

Parray * SPIRALIII(int N, Parray * L,double QUADct,int QUADio)
{ 
/*
 ?
*/
auto A_16=( 2);
 auto A_17=( 4);
 auto A_18=( 0.5);
 auto A_19=( -1);
 auto A_20=CV2Parray( [false,false,true]);
 auto A_21=( false);
 auto A_38=mpyIII(N,A_16);
 auto A_40=iotaXII( A_38,QUADio);
 auto A_0=( A_40);
 auto A_42=barbslXII( A_0);
 auto A_46=modXII( A_42);
 auto A_48=COPIESIII(A_0,A_46,QUADio);
 auto A_50=modIII(A_17,A_48);
 auto C_0=( A_50);
 auto A_52=divIID(N,A_16);
 auto A_53=plusDDD(A_18,A_52);
 auto A_55=minXDI( A_53,QUADct);
 auto G_0=( A_55);
 auto A_57=mpyIII(N,N);
 auto A_58=plusIII(A_19,A_57);
 auto A_59=takeIII(A_58,C_0);
 A_60= ABC(toi(A_59)-QUADio,shape(L)[1]);
A_63indrfr(1,L,A_60) auto E_0=( A_63);
 auto A_65=comaBII(A_21,E_0);
 auto A_66=plusbslXII( A_65);
 auto A_70=rhoIII(A_16,G_0);
 auto A_71=jotdotplusIII(A_70,A_66);
 auto A_79=tranBII(A_20,A_71,QUADio);
 auto A_80=LINEARIII(N,A_79);
 auto A_82=ugrdXII( A_80,QUADio);
 auto A_83=rhoIII(A_16,N);
 auto A_84=rhoIII(A_83,A_82);
 auto Z_0=( A_84);
 return(Z_0);
}

Parray * FOOXIC(int N ,double QUADct,int QUADio)
{ 
/*
 ?
*/
auto A_12=CV2Parray( [2, 4]);
 auto A_13=CV2Parray( [-1, 0, 1, 0, 0, 1, 0, -1]);
 auto A_14=CV2Parray( [' ','*']);
 auto A_23=rhoIII(A_12,A_13);
 auto A_26=SPIRALIII(N,A_23,QUADct,QUADio);
 auto A_28=PRIMESXIB( A_26,QUADio);
 A_29= ABC(toi(A_28)-QUADio,shape([' ','*'])[0]);
A_31indr(A_14,A_29) auto R_0=( A_31);
 return(R_0);
}

int main( string[] args)
{ 
/*
 ?
*/
auto A_11=( false);
 auto A_12=( 1.0e-13);
 auto A_13=( 10);
 auto A_14=( 80);
 auto A_15=( 16807);
 auto A_16=( 100);
 auto A_17=( true);
 auto A_18=( 1229);
 auto A_19=( '*');
 auto QUADio_0=( A_11);
 auto QUADct_0=( A_12);
 auto QUADpp_0=( A_13);
 auto QUADpw_0=( A_14);
 auto QUADrl_0=( A_15);
 auto QUADio_1=( A_11);
 auto A_48=FOOXIC( A_16,QUADct_0,QUADio_1);
 auto A_50=eqCCB(A_19,A_48);
 auto A_51=comaXBB( A_50);
 auto A_52=plusslXBI( A_51);
 auto r_0=( A_52);
 auto A_59=quadXII( A_52,QUADpp_0,QUADpw_0);
 auto A_61=eqIIB(r_0,A_18);
 auto A_62=barBBI(A_17,A_61);
 auto r_1=( A_62);
 return(r_1);
}

