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


/* Compiled by APEX Version: /home/apex/apex3/wss/plural8.dws2012-02-27 15:29:39.005 */

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

Parray * comaXII(Parray * y)
{ /* Ravel of anything with rank>1 */
  auto yval = y.getI();
  auto shp = new int[ 1];
       shp[0] = cast( int) yval.length;
  auto z = new Parray( shp, yval);
  return(z);
}

Parray * combXII(int y)
{ /* Table of scalar */
  auto shpz = [1, 1];
  auto valz = new int[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

// Can't have two fns w/same signature
//%Fragment comb x12 x bidc bidc .
//Parray * combXII(int y)
//{ /* Table on vector */
//  auto shpz = y.getShp() ~ 1;
//  auto z = new Parray( shpz, y.getI());
//  return(z);
//}

// Can't have two fns w/same signature
//%Fragment comb x22 x bidc bidc .
//Parray * combXII(int y)
//{ /* Table on table is NOP */
//        return(y);
//}

Parray * combXII(Parray * y)
{ /* Table on matrix */
  auto shpy = y.getShp();
  auto shp0 = shpy[0];
  auto shp1 = xrhoShp( shpy[ 1 .. shpy.length]);
  auto shpz = [ shp0, shp1];
  auto z = new Parray( shpz, y.getI());
  return(z);
}


// Can't have two fns w/same signature
//%Fragment tran x11 x bidc bidc .
//Parray * combXII(Parray * y)
//{ /* Transpose on vectors is NOP */
//        return(y);
//}

// This produces two functions taking Parray* as
// argument, which confuses dmd: one for vector, and
// one for non-vector, but they have same type signatures.
//
//%Fragment coma x11 x bidc bidc .
//Parray * combXII(Parray * y)
//{ /* Ravel of vector is NOP */
//        return(y);
//}


int tranXII(int y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

Parray * tranXII(Parray * y)
{ /* Monadic transpose */
  auto z = TRANSPOSE( y);
  return( z);
}


int rotrXII(int y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
}

int rot1XII(int y)
{ /* Transpose and reverse on scalars are NOPs */
return(y);
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



Parray* rhoBII(bool x, int y)
{ /* Scalar reshape scalar to vector) */
  auto xrho = BtoI( x);
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


Parray* rhoBII(Parray * x, int y)
{ /* Vector reshape scalar to matrix) */
  auto xint = BtoI( x);
  auto shpz = xint.getI();
  auto xrho = xrhoShp( shpz);
  auto valz = new int[ xrho];
  foreach( i; 0 .. xrho) {
    valz[i] = y;
  }
  auto z = new Parray( shpz, valz);
  return(z);
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



bool sameIIB(int x, int y)
{ /* Scalar match scalar */
  auto z = eqIIB(ItoI(x), ItoI(y));
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

Parray * TRANSPOSE(Parray * y)
{ /* Monadic transpose utility */
  auto shpx = VECTORREVERSE( IOTA( cast(int) y.getShp().length));
  auto valx = new Parray( [ cast(int)shpx.length], shpx);
  auto z = TRANSPOSE( valx, y);
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




bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
  auto tolerance = QUADct * max(abs(x), abs(y));
  auto z = abs(x-y) <= tolerance;
  return(z);
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

Parray * testmstructXXB(int QUADio)
{ 
/*
 ?
*/
auto A_10=( 5);
 auto A_11=( true);
 auto A_12=( 5);
 auto A_13=CV2Parray( [4, 5]);
 auto A_14=CV2Parray( [4, 5]);
 auto A_15=CV2Parray( [2, 3, 4]);
 auto A_16=( 24);
 auto A_17=( 24);
 auto A_18=CV2Parray( [true,true]);
 auto A_19=( 5);
 auto A_20=CV2Parray( [2, 3]);
 auto A_21=CV2Parray( [2, 1]);
 auto A_22=CV2Parray( [2, 3]);
 auto A_23=CV2Parray( [2, 12]);
 auto A_24=( 24);
 auto A_25=( 5);
 auto A_26=CV2Parray( [2, 3]);
 auto A_27=( 6);
 auto A_28=CV2Parray( [3, 2]);
 auto A_29=CV2Parray( [0, 3, 1, 4, 2, 5]);
 auto A_30=CV2Parray( [4, 3, 2]);
 auto A_31=CV2Parray( [0, 12, 4, 16, 8, 20, 1, 13, 5, 17, 9, 21, 2, 14, 6, 18, 10, 22, 3, 15, 7, 19, 11, 23]);
 auto A_32=( 5);
 auto A_33=CV2Parray( [1, 2, 3]);
 auto A_34=CV2Parray( [3, 2, 1]);
 auto A_35=CV2Parray( [3, 2, 1]);
 auto A_36=CV2Parray( [2, 1, 0, 5, 4, 3]);
 auto A_37=CV2Parray( [3, 4, 5, 0, 1, 2]);
 auto A_38=CV2Parray( [3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12, 19, 18, 17, 16, 23, 22, 21, 20]);
 auto A_39=CV2Parray( [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]);
 auto A_65=rhoBII(A_11,A_12);
 auto A_66=comaXII( A_10);
 auto A_68=sameIIB(A_66,A_65);
 auto r_0=( A_68);
 auto A_70=comaXII( A_13);
 auto A_72=sameIIB(A_70,A_14);
 auto A_73=comaBBB(r_0,A_72);
 auto r_1=( A_73);
 auto A_76=iotaXII( A_17,QUADio);
 auto A_78=iotaXII( A_16,QUADio);
 auto A_79=rhoIII(A_15,A_78);
 auto A_80=comaXII( A_79);
 auto A_82=sameIIB(A_80,A_76);
 auto A_83=comaBBB(r_1,A_82);
 auto r_2=( A_83);
 auto A_85=rhoBII(A_18,A_19);
 auto A_86=combXII( A_10);
 auto A_88=sameIIB(A_86,A_85);
 auto A_89=comaBBB(r_2,A_88);
 auto r_3=( A_89);
 auto A_91=rhoIII(A_21,A_22);
 auto A_92=combXII( A_20);
 auto A_94=sameIIB(A_92,A_91);
 auto A_95=comaBBB(r_3,A_94);
 auto r_4=( A_95);
 auto A_98=iotaXII( A_24,QUADio);
 auto A_99=rhoIII(A_23,A_98);
 auto A_101=iotaXII( A_16,QUADio);
 auto A_102=rhoIII(A_15,A_101);
 auto A_103=combXII( A_102);
 auto A_105=sameIIB(A_103,A_99);
 auto A_106=comaBBB(r_4,A_105);
 auto r_5=( A_106);
 auto A_108=tranXII( A_10);
 auto A_110=sameIIB(A_108,A_25);
 auto A_111=comaBBB(r_5,A_110);
 auto r_6=( A_111);
 auto A_113=tranXII( A_20);
 auto A_115=sameIIB(A_113,A_26);
 auto A_116=comaBBB(r_6,A_115);
 auto r_7=( A_116);
 auto A_118=rhoIII(A_28,A_29);
 auto A_120=iotaXII( A_27,QUADio);
 auto A_121=rhoIII(A_20,A_120);
 auto A_122=tranXII( A_121);
 auto A_124=sameIIB(A_122,A_118);
 auto A_125=comaBBB(r_7,A_124);
 auto r_8=( A_125);
 auto A_127=rhoIII(A_30,A_31);
 auto A_129=iotaXII( A_16,QUADio);
 auto A_130=rhoIII(A_15,A_129);
 auto A_131=tranXII( A_130);
 auto A_133=sameIIB(A_131,A_127);
 auto A_134=comaBBB(r_8,A_133);
 auto r_9=( A_134);
 auto A_136=rotrXII( A_10);
 auto A_138=sameIIB(A_136,A_32);
 auto A_139=comaBBB(r_9,A_138);
 auto r_10=( A_139);
 auto A_141=rot1XII( A_10);
 auto A_143=sameIIB(A_141,A_10);
 auto A_144=comaBBB(r_10,A_143);
 auto r_11=( A_144);
 auto A_146=rotrXII( A_33);
 auto A_148=sameIIB(A_146,A_34);
 auto A_149=comaBBB(r_11,A_148);
 auto r_12=( A_149);
 auto A_151=rot1XII( A_33);
 auto A_153=sameIIB(A_151,A_35);
 auto A_154=comaBBB(r_12,A_153);
 auto r_13=( A_154);
 auto A_156=rhoIII(A_20,A_36);
 auto A_158=iotaXII( A_27,QUADio);
 auto A_159=rhoIII(A_20,A_158);
 auto A_160=rotrXII( A_159);
 auto A_162=sameIIB(A_160,A_156);
 auto A_163=comaBBB(r_13,A_162);
 auto r_14=( A_163);
 auto A_165=rhoIII(A_20,A_37);
 auto A_167=iotaXII( A_27,QUADio);
 auto A_168=rhoIII(A_20,A_167);
 auto A_169=rot1XII( A_168);
 auto A_171=sameIIB(A_169,A_165);
 auto A_172=comaBBB(r_14,A_171);
 auto r_15=( A_172);
 auto A_174=rhoIII(A_15,A_38);
 auto A_176=iotaXII( A_16,QUADio);
 auto A_177=rhoIII(A_15,A_176);
 auto A_178=rotrXII( A_177);
 auto A_180=sameIIB(A_178,A_174);
 auto A_181=comaBBB(r_15,A_180);
 auto r_16=( A_181);
 auto A_183=rhoIII(A_15,A_39);
 auto A_185=iotaXII( A_16,QUADio);
 auto A_186=rhoIII(A_15,A_185);
 auto A_187=rot1XII( A_186);
 auto A_189=sameIIB(A_187,A_183);
 auto A_190=comaBBB(r_16,A_189);
 auto r_17=( A_190);
 return(r_17);
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
 auto A_56=testmstructXXB( QUADio_1);
 auto r_0=( A_56);
 auto A_60=quadXBB( A_56,QUADpp_1,QUADpw_1);
 auto A_61=andslXBB( r_0);
 auto A_65=plusBBI(A_19,A_61);
 auto r_1=( A_65);
 auto A_69=quadXII( r_1,QUADpp_1,QUADpw_1);
 return(r_1);
}

