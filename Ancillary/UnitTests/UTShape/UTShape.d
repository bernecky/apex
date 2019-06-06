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


/* Compiled by APEX Version: /home/apex/apex3/wss/plural8.dws2012-02-25 17:37:13.204 */

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
int plusBBI(bool x, bool y)
{ return(BtoI(x)+BtoI(y));
}

Parray * comaXII(int y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new int[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray* rhoBBB(bool x, bool y)
{ /* Scalar reshape scalar to vector) */
  auto xrho = BtoI( x);
  auto shpz = [ xrho];
  auto valz = new bool[ xrho];
  foreach( i; 0 .. xrho) {
    valz[i] = y;
  }
  auto z = new Parray( shpz, valz);
  return(z);
}

Parray* rhoIII(Parray * x, int y)
{ /* Vector reshape scalar to matrix) */
  auto xint = ItoI( x);
  auto shpz = xint.getI();
  auto xrho = xrhoShp( shpz);
  auto valz = new int[ xrho];
  foreach( i; 0 .. xrho) {
    valz[i] = y;
  }
  auto z = new Parray( shpz, valz);
  return(z);
}


Parray* rhoXBI(bool y)
{ /* Shape of scalar */
  auto shp = [0];
  auto val = new int[0];
  auto z = new Parray( shp, val);
  return( z);
}

Parray* rhoXII(Parray * y)
{ /* Shape of non-scalar */
  auto val = y.getShp();
  auto shp = [ cast(int) val.length];
  auto z = new Parray( shp, val);
  return( z);
}

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


bool sameIBB(Parray * x, Parray * y)
{ /* Non-scalar match non-scalar */
  auto z = x.getShp() == y.getShp(); /* shape/dim check */
  auto valx = x.getI();
  auto valy = y.getB();

  for( auto i=0; i<valx.length; i++) {
    z = z && eqIIB(ItoI( valx[i]),  BtoI( valy[i]));
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


bool eqIIB(int x, int y)
{ /* A=B on non-doubles */
  return(ItoI(x) == ItoI(y));
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

bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
  auto tolerance = QUADct * max(abs(x), abs(y));
  auto z = abs(x-y) <= tolerance;
  return(z);
}

Parray * testshapeXIB(int n )
{ 
/*
 ?
*/
auto A_10=( false);
 auto A_11=( false);
 auto A_12=CV2Parray( [4, 4]);
 auto A_13=( 2);
 auto A_14=CV2Parray( [2, 3, 4]);
 auto A_15=( 5);
 auto A_16=CV2Parray( [2, 3, 4]);
 auto A_27=rhoBBB(A_10,A_11);
 auto A_28=rhoXBI( A_10);
 auto A_30=sameIBB(A_28,A_27);
 auto r_0=( A_30);
 auto A_32=comaXII( A_13);
 auto A_33=rhoXII( A_12);
 auto A_35=sameIIB(A_33,A_32);
 auto A_36=comaBBB(r_0,A_35);
 auto r_1=( A_36);
 auto A_38=rhoIII(A_14,A_15);
 auto A_39=rhoXII( A_38);
 auto A_41=sameIIB(A_39,A_16);
 auto A_42=comaBBB(r_1,A_41);
 auto r_2=( A_42);
 return(r_2);
}

int main( string[] args)
{ 
/*
 ?
*/
auto A_12=( false);
 auto A_13=( 1.0e-13);
 auto A_14=( 10);
 auto A_15=( 80);
 auto A_16=( 16807);
 auto A_17=( 250000);
 auto A_18=( 16);
 auto A_19=( true);
 auto QUADio_0=( A_12);
 auto QUADct_0=( A_13);
 auto QUADpp_0=( A_14);
 auto QUADpw_0=( A_15);
 auto QUADrl_0=( A_16);
 auto QUADio_1=( A_12);
 auto n_0=( A_17);
 auto QUADrl_1=( A_16);
 auto QUADpp_1=( A_18);
 auto QUADpw_1=( A_15);
 auto A_55=testshapeXIB( n_0);
 auto r_0=( A_55);
 auto A_59=quadXBB( A_55,QUADpp_1,QUADpw_1);
 auto A_60=andslXBB( r_0);
 auto A_64=plusBBI(A_19,A_60);
 auto r_1=( A_64);
 auto A_68=quadXII( r_1,QUADpp_1,QUADpw_1);
 return(r_1);
}

