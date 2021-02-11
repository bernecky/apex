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


/* Compiled by APEX Version: /home/apex/apex3/wss/plural8.dws2012-02-25 18:59:42.753 */

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
Parray*  divXID(Parray* y)
{ /* Monadic scalar functions on array */
  auto shp = y.getShp();
  auto val = new D[ xrhoShp( shp)];
  foreach ( i; 0 .. val.length) {
    val[i] = divXDD(ItoD(y.getI()[i]));
  }
  auto z = new Parray( shp, val);

  return(z);
}


int plusBBI(bool x, bool y)
{ return(BtoI(x)+BtoI(y));
}

Parray* plusDID( double x, Parray* y ) {
  /* SxA scalar function */
  auto v = new Parray *[y.getI().length];
  auto xel = DtoD(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = plusDDD(xel, ItoD(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* plusBII( bool x, Parray* y ) {
  /* SxA scalar function */
  auto v = new Parray *[y.getI().length];
  auto xel = BtoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = plusIII(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* plusIDD( Parray* x, double y) {
  /* AxS scalar function */
  auto v = new Parray *[x.getI().length];
  auto xels = x.getI();
  auto yel = DtoD(y);
  foreach( i; 0 .. x.getI().length) {
    v[i] = plusDDD(ItoD(xels[i]),yel);
  }
  auto z = new Parray( x.getShp(), v);
  return( z);
}


int rotrXII(int y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

char rotrXCC(char y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

char rot1XCC(char y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

bool rotrXBB(bool y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

bool rot1XBB(bool y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

double rotrXDD(double y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

double rot1XDD(double y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

Parray * comaXBB(bool y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new bool[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray * rotrXBB(Parray * y)
{/* Last axis reverse on non-scalar */
  auto shpz = y.getShp();
  auto valy = y.getB();
  auto len = valy.length;
  auto valz = valy.dup;
  auto numcells = xrhoShp( shpz[ 0 .. shpz.length-1]);
  auto rowlen = shpz[ shpz.length -1];

  foreach( cell; 0 .. numcells) {
    auto zoffset = cell * rowlen;
    foreach( i; 0 .. rowlen) {
      valz[zoffset + i] = valy[ zoffset + (rowlen - 1) - i];
    }
  }

  auto z = new Parray( shpz, valz);
  return(z);
}


Parray * rot1XBB(Parray * y)
{ /* First axis reverse on non-scalar */
  auto yt = TRANSPOSE( y);
  auto z = rotrXBB( yt);
  z = TRANSPOSE( z);
  return( z);
}



Parray * comaXII(int y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new int[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray * rotrXII(Parray * y)
{/* Last axis reverse on non-scalar */
  auto shpz = y.getShp();
  auto valy = y.getI();
  auto len = valy.length;
  auto valz = valy.dup;
  auto numcells = xrhoShp( shpz[ 0 .. shpz.length-1]);
  auto rowlen = shpz[ shpz.length -1];

  foreach( cell; 0 .. numcells) {
    auto zoffset = cell * rowlen;
    foreach( i; 0 .. rowlen) {
      valz[zoffset + i] = valy[ zoffset + (rowlen - 1) - i];
    }
  }

  auto z = new Parray( shpz, valz);
  return(z);
}


Parray * rot1XII(Parray * y)
{ /* First axis reverse on non-scalar */
  auto yt = TRANSPOSE( y);
  auto z = rotrXII( yt);
  z = TRANSPOSE( z);
  return( z);
}



Parray * comaXDD(double y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new double[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray * rotrXDD(Parray * y)
{/* Last axis reverse on non-scalar */
  auto shpz = y.getShp();
  auto valy = y.getD();
  auto len = valy.length;
  auto valz = valy.dup;
  auto numcells = xrhoShp( shpz[ 0 .. shpz.length-1]);
  auto rowlen = shpz[ shpz.length -1];

  foreach( cell; 0 .. numcells) {
    auto zoffset = cell * rowlen;
    foreach( i; 0 .. rowlen) {
      valz[zoffset + i] = valy[ zoffset + (rowlen - 1) - i];
    }
  }

  auto z = new Parray( shpz, valz);
  return(z);
}


Parray * rot1XDD(Parray * y)
{ /* First axis reverse on non-scalar */
  auto yt = TRANSPOSE( y);
  auto z = rotrXDD( yt);
  z = TRANSPOSE( z);
  return( z);
}



Parray * comaXCC(char y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new char[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray * rotrXCC(Parray * y)
{/* Last axis reverse on non-scalar */
  auto shpz = y.getShp();
  auto valy = y.getC();
  auto len = valy.length;
  auto valz = valy.dup;
  auto numcells = xrhoShp( shpz[ 0 .. shpz.length-1]);
  auto rowlen = shpz[ shpz.length -1];

  foreach( cell; 0 .. numcells) {
    auto zoffset = cell * rowlen;
    foreach( i; 0 .. rowlen) {
      valz[zoffset + i] = valy[ zoffset + (rowlen - 1) - i];
    }
  }

  auto z = new Parray( shpz, valz);
  return(z);
}


Parray * rot1XCC(Parray * y)
{ /* First axis reverse on non-scalar */
  auto yt = TRANSPOSE( y);
  auto z = rotrXCC( yt);
  z = TRANSPOSE( z);
  return( z);
}



Parray* rhoIBB(Parray * x, Parray * y)
{ /* Vector x reshape, with potential item reuse */

  auto shpz = x.getI();
  auto zrho = xrhoShp( shpz);
  auto yrho = xrhoShp( y.getShp());
  auto valy = y.getB();
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


Parray* rhoIDD(Parray * x, Parray * y)
{ /* Vector x reshape, with potential item reuse */

  auto shpz = x.getI();
  auto zrho = xrhoShp( shpz);
  auto yrho = xrhoShp( y.getShp());
  auto valy = y.getD();
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


int iotaCCIQUADAV(Parray *[256] x, char y,int QUADio)
{ /* QUADav iota character scalar */
 return(CtoI(y)+QUADio);
}

Parray* rhoICC(Parray * x, Parray * y)
{ /* Vector x reshape, with potential item reuse */

  auto shpz = x.getI();
  auto zrho = xrhoShp( shpz);
  auto yrho = xrhoShp( y.getShp());
  auto valy = y.getC();
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
  assert( 1 == y.getC().length); /* FIXME: Higher-rank generalized drop */
  auto shp = max(0, y.getC().length - abs(i));
  auto offset = i<0 ? 0 : i;
  auto val = y[ offset .. shp].dup;
  auto z = new Parray( shp, val);
  return( z);
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

Parray* quadXBB(Parray* y, int QUADpp, int QUADpw)
{ /* {quad}{<-} non-scalar */
  writeln(y.getB());
  return(y);
}

int quadXII(int y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar */
  writeln(y);
  return(y);
}
Parray * quadavXXC()
{ /* QUADav - system character set */
 auto z = Parray( [256]);

 foreach( i; 0 .. 256) {
   z[i] = cast(char) i;
 }
 return(z);
}

Parray* comaBBB(bool x, bool y)
{/* SxS catenate first (or last) axis */
  auto shpz = [2];
  auto valz = [ BtoB( x), BtoB( y)];
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray* comaBBB(Parray* x, bool y)
{/* VxS catenate first (or last) axis */
  auto shpz = [ 1 + xrhoShp( x.getShp())];
  auto valz = BtoB( x.getB()) ~ BtoB( y);
  auto z = new Parray( shpz, valz);
  return(z);
}


bool sameIIB(int x, int y)
{ /* Scalar match scalar */
  auto z = eqIIB(ItoI(x), ItoI(y));
  return(z);
}



bool sameCCB(char x, char y)
{ /* Scalar match scalar */
  auto z = eqCCB(CtoC(x), CtoC(y));
  return(z);
}



bool sameBBB(bool x, bool y)
{ /* Scalar match scalar */
  auto z = eqBBB(BtoB(x), BtoB(y));
  return(z);
}



bool sameDDB(double x, double y,double QUADct)
{ /* Scalar match scalar */
  auto z = eqDDB(DtoD(x), DtoD(y), QUADct);
  return(z);
}



bool sameBBB(Parray * x, Parray * y)
{ /* Non-scalar match non-scalar */
  auto z = x.getShp() == y.getShp(); /* shape/dim check */
  auto valx = x.getB();
  auto valy = y.getB();

  for( auto i=0; i<valx.length; i++) {
    z = z && eqBBB(BtoB( valx[i]),  BtoB( valy[i]));
    if( !z) {
      i = cast(int) valx.length;
    }
  }
  return(z);
}



bool sameIIB(Parray * x, Parray * y)
{ /* Non-scalar match non-scalar */
  auto z = x.getShp() == y.getShp(); /* shape/dim check */
  auto valx = x.getI();
  auto valy = y.getI();

  for( auto i=0; i<valx.length; i++) {
    z = z && eqIIB(ItoI( valx[i]),  ItoI( valy[i]));
    if( !z) {
      i = cast(int) valx.length;
    }
  }
  return(z);
}



bool sameDDB(Parray * x, Parray * y,double QUADct)
{ /* Non-scalar match non-scalar */
  auto z = x.getShp() == y.getShp(); /* shape/dim check */
  auto valx = x.getD();
  auto valy = y.getD();

  for( auto i=0; i<valx.length; i++) {
    z = z && eqDDB(DtoD( valx[i]),  DtoD( valy[i]), QUADct);
    if( !z) {
      i = cast(int) valx.length;
    }
  }
  return(z);
}



bool sameCCB(Parray * x, Parray * y)
{ /* Non-scalar match non-scalar */
  auto z = x.getShp() == y.getShp(); /* shape/dim check */
  auto valx = x.getC();
  auto valy = y.getC();

  for( auto i=0; i<valx.length; i++) {
    z = z && eqCCB(CtoC( valx[i]),  CtoC( valy[i]));
    if( !z) {
      i = cast(int) valx.length;
    }
  }
  return(z);
}



bool andslXBB( Parray* y)
{ /* First/last axis slow reduction of vector.
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */

  auto v = y.getB();
  auto z = BtoB( 1);
  for( auto i=0; i<v.length; i++) {
    z = andBBB( z, BtoB( v[i]));
  }
  return(z);
}


double divXDD(double y)
{ return(1.0/Dtod(y));
}

double plusDDD(double x, double y)
{ return(DtoD(x)+DtoD(y));
}

int plusIII(int x, int y)
{ return(ItoI(x)+ItoI(y));
}

double plusIDD(int x, double y)
{ return(ItoD(x)+DtoD(y));
}

bool eqIIB(int x, int y)
{ /* A=B on non-doubles */
  return(ItoI(x) == ItoI(y));
}

bool eqCCB(char x, char y)
{ /* A=B on non-doubles */
  return(CtoC(x) == CtoC(y));
}

bool eqBBB(bool x, bool y)
{ /* A=B on non-doubles */
  return(BtoB(x) == BtoB(y));
}

bool eqDDB(double x, double y, double QUADct)
{ /* A=B on doubles */
  return((DtoD(x) == DtoD(y)) || APEXFUZZEQ(DtoD(x),DtoD(y),QUADct));
}


bool andBBB(bool x, bool y)
{
  return(BtoB(x)&BtoB(y));
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




Parray* TRANSPOSE(Parray *x, Parray* y)
{ /* Generic dyadic transpose utility, origin-0, non-scalar */
  /* See model T in UTTranspose.dws */

  auto shpy = y.getShp();
  auto valy = y.getD();

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
  auto ry = y.getD();
  auto valz = ry.dup;
  for(auto i=0; i<cast(int)valz.length; i++) {
    valz[i] = ry[ cp[i]];
  }
  auto z = new Parray( shpz, valz);
  return(z);
}




Parray* TRANSPOSE(Parray *x, Parray* y)
{ /* Generic dyadic transpose utility, origin-0, non-scalar */
  /* See model T in UTTranspose.dws */

  auto shpy = y.getShp();
  auto valy = y.getC();

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
  auto ry = y.getC();
  auto valz = ry.dup;
  for(auto i=0; i<cast(int)valz.length; i++) {
    valz[i] = ry[ cp[i]];
  }
  auto z = new Parray( shpz, valz);
  return(z);
}




bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
  auto tolerance = QUADct * max(abs(x), abs(y));
  auto z = abs(x-y) <= tolerance;
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

Parray * UTReverseXXB(int QUADio,double QUADct)
{ 
/*
 ?
*/
auto A_11=( 5);
 auto A_12=( 5);
 auto A_13=( false);
 auto A_14=( 0.5);
 auto A_15=( true);
 auto A_16=( true);
 auto A_17=( 2);
 auto A_18=( 2.5);
 auto A_19=CV2Parray( [false,true,false,false]);
 auto A_20=CV2Parray( [false,true,false,false]);
 auto A_21=( 20);
 auto A_22=CV2Parray( [2, 3]);
 auto A_23=CV2Parray( [false,true,false,true,false,true]);
 auto A_24=CV2Parray( [4, 5]);
 auto A_25=CV2Parray( [5, 6]);
 auto A_26=( 30);
 auto A_27=CV2Parray( [6, 7]);
 auto A_28=CV2Parray( [2, 3, 4]);
 auto A_29=CV2Parray( [false,true]);
 auto A_30=CV2Parray( [3, 4, 5]);
 auto A_31=( 120);
 auto A_32=( 'x');
 auto A_33=CV2Parray( ['a','b','c','d','e']);
 auto A_34=( 'a');
 auto A_90=rotrXII( A_12);
 auto A_92=sameIIB(A_11,A_90);
 auto r_0=( A_92);
 auto A_94=rotrXCC( A_32);
 auto A_96=sameCCB(A_32,A_94);
 auto A_97=comaBBB(r_0,A_96);
 auto r_1=( A_97);
 auto A_99=rot1XCC( A_32);
 auto A_101=sameCCB(A_32,A_99);
 auto A_102=comaBBB(r_1,A_101);
 auto r_2=( A_102);
 auto A_104=rotrXBB( A_13);
 auto A_106=sameBBB(A_13,A_104);
 auto A_107=comaBBB(r_2,A_106);
 auto r_3=( A_107);
 auto A_109=rot1XBB( A_13);
 auto A_111=sameBBB(A_13,A_109);
 auto A_112=comaBBB(r_3,A_111);
 auto r_4=( A_112);
 auto A_114=rotrXDD( A_14);
 auto A_116=sameDDB(A_14,A_114,QUADct);
 auto A_117=comaBBB(r_4,A_116);
 auto r_5=( A_117);
 auto A_119=rot1XDD( A_14);
 auto A_121=sameDDB(A_14,A_119,QUADct);
 auto A_122=comaBBB(r_5,A_121);
 auto r_6=( A_122);
 auto A_124=comaXBB( A_16);
 auto A_125=rotrXBB( A_124);
 auto A_126=comaXBB( A_15);
 auto A_128=sameBBB(A_126,A_125);
 auto A_129=comaBBB(r_6,A_128);
 auto r_7=( A_129);
 auto A_131=comaXBB( A_15);
 auto A_132=rot1XBB( A_131);
 auto A_133=comaXBB( A_15);
 auto A_135=sameBBB(A_133,A_132);
 auto A_136=comaBBB(r_7,A_135);
 auto r_8=( A_136);
 auto A_138=comaXII( A_17);
 auto A_139=rotrXII( A_138);
 auto A_140=comaXII( A_17);
 auto A_142=sameIIB(A_140,A_139);
 auto A_143=comaBBB(r_8,A_142);
 auto r_9=( A_143);
 auto A_145=comaXII( A_17);
 auto A_146=rot1XII( A_145);
 auto A_147=comaXII( A_17);
 auto A_149=sameIIB(A_147,A_146);
 auto A_150=comaBBB(r_9,A_149);
 auto r_10=( A_150);
 auto A_152=comaXDD( A_18);
 auto A_153=rotrXDD( A_152);
 auto A_154=comaXDD( A_18);
 auto A_156=sameDDB(A_154,A_153,QUADct);
 auto A_157=comaBBB(r_10,A_156);
 auto r_11=( A_157);
 auto A_159=comaXDD( A_18);
 auto A_160=rot1XDD( A_159);
 auto A_161=comaXDD( A_18);
 auto A_163=sameDDB(A_161,A_160,QUADct);
 auto A_164=comaBBB(r_11,A_163);
 auto r_12=( A_164);
 auto A_166=comaXCC( A_32);
 auto A_167=rotrXCC( A_166);
 auto A_168=comaXCC( A_32);
 auto A_170=sameCCB(A_168,A_167);
 auto A_171=comaBBB(r_12,A_170);
 auto r_13=( A_171);
 auto A_173=comaXCC( A_32);
 auto A_174=rot1XCC( A_173);
 auto A_175=comaXCC( A_32);
 auto A_177=sameCCB(A_175,A_174);
 auto A_178=comaBBB(r_13,A_177);
 auto r_14=( A_178);
 auto A_180=rotrXBB( A_20);
 auto A_181=rotrXBB( A_180);
 auto A_183=sameBBB(A_19,A_181);
 auto A_184=comaBBB(r_14,A_183);
 auto r_15=( A_184);
 auto A_186=rot1XBB( A_19);
 auto A_187=rot1XBB( A_186);
 auto A_189=sameBBB(A_19,A_187);
 auto A_190=comaBBB(r_15,A_189);
 auto r_16=( A_190);
 auto A_193=iotaXII( A_11,QUADio);
 auto A_194=rotrXII( A_193);
 auto A_195=rotrXII( A_194);
 auto A_197=iotaXII( A_11,QUADio);
 auto A_199=sameIIB(A_197,A_195);
 auto A_200=comaBBB(r_16,A_199);
 auto r_17=( A_200);
 auto A_203=iotaXII( A_11,QUADio);
 auto A_204=rot1XII( A_203);
 auto A_205=rot1XII( A_204);
 auto A_207=iotaXII( A_11,QUADio);
 auto A_209=sameIIB(A_207,A_205);
 auto A_210=comaBBB(r_17,A_209);
 auto r_18=( A_210);
 auto A_213=iotaXII( A_21,QUADio);
 auto A_214=plusDID(A_14,A_213);
 auto A_215=rotrXDD( A_214);
 auto A_216=rotrXDD( A_215);
 auto A_218=iotaXII( A_21,QUADio);
 auto A_219=plusDID(A_14,A_218);
 auto A_221=sameDDB(A_219,A_216,QUADct);
 auto A_222=comaBBB(r_18,A_221);
 auto r_19=( A_222);
 auto A_225=iotaXII( A_21,QUADio);
 auto A_226=plusDID(A_14,A_225);
 auto A_227=rot1XDD( A_226);
 auto A_228=rot1XDD( A_227);
 auto A_230=iotaXII( A_21,QUADio);
 auto A_231=plusDID(A_14,A_230);
 auto A_233=sameDDB(A_231,A_228,QUADct);
 auto A_234=comaBBB(r_19,A_233);
 auto r_20=( A_234);
 auto A_236=rotrXCC( A_33);
 auto A_237=rotrXCC( A_236);
 auto A_239=sameCCB(A_33,A_237);
 auto A_240=comaBBB(r_20,A_239);
 auto r_21=( A_240);
 auto A_242=rot1XCC( A_33);
 auto A_243=rot1XCC( A_242);
 auto A_245=sameCCB(A_33,A_243);
 auto A_246=comaBBB(r_21,A_245);
 auto r_22=( A_246);
 auto A_248=rhoIBB(A_22,A_23);
 auto b_0=( A_248);
 auto A_250=rotrXBB( b_0);
 auto A_251=rotrXBB( A_250);
 auto A_253=sameBBB(b_0,A_251);
 auto A_254=comaBBB(r_22,A_253);
 auto r_23=( A_254);
 auto A_256=rot1XBB( b_0);
 auto A_257=rot1XBB( A_256);
 auto A_259=sameBBB(b_0,A_257);
 auto A_260=comaBBB(r_23,A_259);
 auto r_24=( A_260);
 auto A_263=iotaXII( A_21,QUADio);
 auto A_264=rhoIII(A_24,A_263);
 auto b_1=( A_264);
 auto A_266=rotrXII( b_1);
 auto A_267=rotrXII( A_266);
 auto A_269=sameIIB(b_1,A_267);
 auto A_270=comaBBB(r_24,A_269);
 auto r_25=( A_270);
 auto A_272=rot1XII( b_1);
 auto A_273=rot1XII( A_272);
 auto A_275=sameIIB(b_1,A_273);
 auto A_276=comaBBB(r_25,A_275);
 auto r_26=( A_276);
 auto A_279=iotaXII( A_26,QUADio);
 auto A_280=plusBII(A_15,A_279);
 auto A_281=divXID( A_280);
 auto A_282=rhoIDD(A_25,A_281);
 auto b_2=( A_282);
 auto A_284=rotrXDD( b_2);
 auto A_285=rotrXDD( A_284);
 auto A_287=sameDDB(b_2,A_285,QUADct);
 auto A_288=comaBBB(r_26,A_287);
 auto r_27=( A_288);
 auto A_290=rot1XDD( b_2);
 auto A_291=rot1XDD( A_290);
 auto A_293=sameDDB(b_2,A_291,QUADct);
 auto A_294=comaBBB(r_27,A_293);
 auto r_28=( A_294);
 auto A_296=quadavXXC( );
 auto A_297=quadavXXC( );
 A_300=iotaCCIQUADAV(A_297,A_34,QUADio);
 auto A_301=dropICC(A_300,A_296);
 auto A_302=rhoICC(A_27,A_301);
 auto b_3=( A_302);
 auto A_304=rotrXCC( b_3);
 auto A_305=rotrXCC( A_304);
 auto A_307=sameCCB(b_3,A_305);
 auto A_308=comaBBB(r_28,A_307);
 auto r_29=( A_308);
 auto A_310=rot1XCC( b_3);
 auto A_311=rot1XCC( A_310);
 auto A_313=sameCCB(b_3,A_311);
 auto A_314=comaBBB(r_29,A_313);
 auto r_30=( A_314);
 auto A_316=rhoIBB(A_28,A_29);
 auto b_4=( A_316);
 auto A_318=rotrXBB( b_4);
 auto A_319=rotrXBB( A_318);
 auto A_321=sameBBB(b_4,A_319);
 auto A_322=comaBBB(r_30,A_321);
 auto r_31=( A_322);
 auto A_324=rot1XBB( b_4);
 auto A_325=rot1XBB( A_324);
 auto A_327=sameBBB(b_4,A_325);
 auto A_328=comaBBB(r_31,A_327);
 auto r_32=( A_328);
 auto A_331=iotaXII( A_31,QUADio);
 auto A_332=rhoIII(A_30,A_331);
 auto b_5=( A_332);
 auto A_334=rotrXII( b_5);
 auto A_335=rotrXII( A_334);
 auto A_337=sameIIB(b_5,A_335);
 auto A_338=comaBBB(r_32,A_337);
 auto r_33=( A_338);
 auto A_340=rot1XII( b_5);
 auto A_341=rot1XII( A_340);
 auto A_343=sameIIB(b_5,A_341);
 auto A_344=comaBBB(r_33,A_343);
 auto r_34=( A_344);
 auto A_346=plusIDD(b_5,A_14);
 auto b_6=( A_346);
 auto A_348=rotrXDD( b_6);
 auto A_349=rotrXDD( A_348);
 auto A_351=sameDDB(b_6,A_349,QUADct);
 auto A_352=comaBBB(r_34,A_351);
 auto r_35=( A_352);
 auto A_354=rot1XDD( b_6);
 auto A_355=rot1XDD( A_354);
 auto A_357=sameDDB(b_6,A_355,QUADct);
 auto A_358=comaBBB(r_35,A_357);
 auto r_36=( A_358);
 auto A_360=quadavXXC( );
 auto A_361=rhoICC(A_30,A_360);
 auto b_7=( A_361);
 auto A_363=rotrXCC( b_7);
 auto A_364=rotrXCC( A_363);
 auto A_366=sameCCB(b_7,A_364);
 auto A_367=comaBBB(r_36,A_366);
 auto r_37=( A_367);
 auto A_369=rot1XCC( b_7);
 auto A_370=rot1XCC( A_369);
 auto A_372=sameCCB(b_7,A_370);
 auto A_373=comaBBB(r_37,A_372);
 auto r_38=( A_373);
 return(r_38);
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
 auto A_16=( true);
 auto QUADio_0=( A_11);
 auto QUADct_0=( A_12);
 auto QUADpp_0=( A_13);
 auto QUADpw_0=( A_14);
 auto QUADrl_0=( A_15);
 auto A_43=UTReverseXXB( QUADio_0,QUADct_0);
 auto r_0=( A_43);
 auto A_47=quadXBB( r_0,QUADpp_0,QUADpw_0);
 auto A_48=andslXBB( r_0);
 auto A_52=plusBBI(A_16,A_48);
 auto r_1=( A_52);
 auto A_56=quadXII( A_52,QUADpp_0,QUADpw_0);
 return(r_1);
}

