import std.stdio;
import std.algorithm;
import parray;
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


/* Compiled by APEX Version: /home/apex/apex3/wss/plural1.dws2012-02-09 15:40:52.897 */

bool eqIIB(int x, int y)
{ /* A=B on non-doubles */
  return(ItoI(x) == ItoI(y));
}

int plusBBI(bool x, bool y)
{ return(BtoI(x)+BtoI(y));
}

Parray* eqBIB( bool x, Parray* y ) {
  /* SxA scalar function */
  auto v = new bool[y.getI().length];
  auto xel = BtoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = eqIIB(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* eqIIB( int x, Parray* y ) {
  /* SxA scalar function */
  auto v = new bool[y.getI().length];
  auto xel = ItoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = eqIIB(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


int comaXII(int y)
{ /* Ravel of anything with rank>1 */
  auto yval = y.getI();
  auto shp = new int[ 1];
       shp[0] = cast( int) yval.length;
  auto z = new Parray( shp, yval);
  return(z);
}

int comaXII(int y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new int[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

int rhoIII(int x, int y)
{ /* Scalar reshape non-scalar (to vector) */
  z = rhoIII([toi(x)],y);
  return(z);
}


int rhoIII(int x, int y)
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


Parray* rhoXII(int y)
{ /* Shape of scalar */
  auto shp = int[0];
  auto z = new Parray( shp)
  return( z);
}

int quadXII(int y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar */
  writeln(y);
  return(y);
}
int comaBII(bool x, int y)
{/* SxV catenate first (or last) axis */
  auto shpz = [ 1 + xrhoShp( y.getShp2)];
  auto valz = BtoI( x) ~ ItoI( y.getI());
  auto z = new Parray( shpz, valz);
  return(z);
}


int combIII(int x, int y)
{/* VxS catenate first (or last) axis */
  auto shpz = [ 1 + xrhoShp( x.getShp())];
  auto valz = ItoI( x.getI()) ~ ItoI( y);
  auto z = new Parray( shpz, valz);
  return(z);
}


int CommandLineArgvXBI( string[] args, bool y)
{ /* Get Command-line argument element #y as integer scalar */

  auto z = to!int( args[ BtoI( y)]);
  return( z);
}

int plussl1XBI( Parray* y)
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


int plusIII(int x, int y)
{ return(ItoI(x)+ItoI(y));
}

int rhoIII(int x, int y)
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


int xrhoShp( int[] shp)
{  /* Compute product of shape vector elements */
  auto z = 1;
  for( auto i=0; i< shp.length; i++) {
    z = z * shp[i];
  }
  return( z);
}

int[.] snpMakeXII(int n )
{ 
/*
 ?
*/
auto A_23=rhoIII(n,[0, 1, 2, 0, 1, 0, 0, 1]);
auto r_0=( A_23);
 return(r_0);
}

int[.] snpcount4XII(int[.] snp)
{ 
/*
 ?
*/
/* dsf scalar(s) */
auto A_28=eqBIB(false,snp);
auto A_29=plussl1XBI( A_28);
 auto r_0=( A_29);
 auto A_34=rhoXII( r_0);
 auto A_35=comaBII(true,A_34);
 auto A_36=rhoIII(A_35,r_0);
 auto r_1=( A_36);
 /* dsf scalar(s) */
auto A_39=eqBIB(true,snp);
 auto A_40=plussl1XBI( A_39);
 auto A_44=combIII(r_1,A_40);
 auto r_2=( A_44);
 /* dsf scalar(s) */
auto A_47=eqIIB(2,snp);
 auto A_48=plussl1XBI( A_47);
 auto A_52=combIII(r_2,A_48);
 auto r_3=( A_52);
 return(r_3);
}

int main( string[] args)
{ 
/*
 ?
*/
auto n=CommandLineArgvXBI(args, true);
 auto QUADio_0=BtoI(( false));
 auto QUADct_0=( 1.0e-13);
 auto QUADpp_0=( 10);
 auto QUADpw_0=( 80);
 auto QUADrl_0=( 16807);
 auto QUADio_1=BtoI(( false));
 auto A_61=snpMakeXII( n);
 auto snp_0=( A_61);
 auto A_63=snpcount4XII( snp_0);
 auto r4_0=( A_63);
 auto r_0=( r4_0);
 auto A_66=comaXII( r_0);
 auto A_67=plusslXII( A_66);
 auto z_0=( A_67);
 auto A_74=quadXII( z_0,QUADpp_0,QUADpw_0);
 auto A_75=comaXII( z_0);
 auto A_76=plusslXII( A_75);
 /* dsf scalar(s) */
auto A_81=eqIIB(800000000,A_76);
/* dsf scalar(s) */
auto A_82=plusBBI(true,A_81);
 auto r_1=( A_82);
 auto A_86=quadXII( A_82,QUADpp_0,QUADpw_0);
 return(r_1);
}

