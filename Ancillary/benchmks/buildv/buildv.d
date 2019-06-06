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


/* Compiled by APEX Version: /home/apex/apex3/wss/plural1.dws2012-02-13 12:17:57.624 */

int plusBBI(bool x, bool y)
{ return(BtoI(x)+BtoI(y));
}

Parray* plusIII( int x, Parray* y ) {
  /* SxA scalar function */
  auto v = new int[y.getI().length];
  auto xel = ItoI(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = plusIII(xel, ItoI(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* plusIDD( Parray* x, double y) {
  /* AxS scalar function */
  auto v = new double[x.getI().length];
  auto xels = x.getI();
  auto yel = DtoD(y);
  foreach( i; 0 .. x.getI().length) {
    v[i] = plusDDD(ItoD(xels[i]),yel);
  }
  auto z = new Parray( x.getShp(), v);
  return( z);
}


Parray* iotaXBI(bool y, int QUADio)
{ /* Index generator on Scalar */
  auto v = BtoI( y);
  auto s = [ v];
  auto val = new int[ v];

  foreach (i, ref el; val) {
    el = QUADio + cast(int) i ;
  }

  auto z = new Parray( s, val);
  return( z);
}
//unittest {
//  auto vec = iotaXBI(5);
//  auto shp = vec.getShp();
//  auto val = vec.getInt();
//  assert( 5 == shp[0]);
//  writeln(" iota shape is %d\n",  shp);
//  writeln(" iota value is %d\n",  val);
//}

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

double quadXDD(double y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar */
  writeln(y);
  return(y);
}
int quadXII(int y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar */
  writeln(y);
  return(y);
}
int comaIII(int x, int y)
{ /* VxV catenate first or last axis */
  auto shpz = xrhoShp( x.getShp()) + xrhoShp( y.getShp());
  auto valz = ItoI( x.getI()) ~ ItoI( y.getI());
  auto z = new Parray( shpz, valz);
  return(z);
}


bool sameDDB(double x, double y,double QUADct)
{ /* Scalar match scalar */
  auto z = eqDDB(DtoD(x), DtoD(y), QUADct);
  return(z);
}



double plusslXDD( Parray* y)
{ /* First/last axis slow reduction of vector.
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */

  auto v = y.getD();
  auto z = DtoD( 0);
  for( auto i=0; i<v.length; i++) {
    z = plusDDD( z, DtoD( v[i]));
  }
  return(z);
}


int plusIII(int x, int y)
{ return(ItoI(x)+ItoI(y));
}

double plusIDD(int x, double y)
{ return(ItoD(x)+DtoD(y));
}

bool eqDDB(double x, double y, double QUADct)
{ /* A=B on doubles */
  return((DtoD(x) == DtoD(y)) || APEXFUZZEQ(DtoD(x),DtoD(y),QUADct));
}


double plusDDD(double x, double y)
{ return(DtoD(x)+DtoD(y));
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

double buildvXID(int y ,int QUADio)
{ 
/*
 ?
*/
auto A_33=iotaXBI( false,QUADio);
 auto r_0=( A_33);
 auto A_36=iotaXII( y,QUADio);
 A_CTR37_= 0;
A_CTR37z_ = (shape(A_36)[[0]])-1;
r_2=toI(r_0);
for(; A_CTR37_ <= A_CTR37z_; A_CTR37_++){
i_0 = A_36[[A_CTR37_]];
 auto A_40=iotaXII( i_0,QUADio);
 /* dsf scalar(s) */
auto A_41=plusIII(1000000,A_40);
 auto A_42=comaIII(r_2,A_41);
 auto r_2=( A_42);
 }
 /* dsf scalar(s) */
auto A_45=plusIDD(r_2,0.5);
 auto A_46=plusslXDD( A_45);
 auto r_3=( A_46);
 return(r_3);
}

int main( string[] args)
{ 
/*
 ?
*/
auto QUADio_0=BtoI(( false));
 auto QUADct_0=( 1.0e-13);
 auto QUADpp_0=( 10);
 auto QUADpw_0=( 80);
 auto QUADrl_0=( 16807);
 auto QUADio_1=BtoI(( false));
 auto n_0=( 2000);
 auto QUADrl_1=( 16807);
 auto QUADpp_1=( 10);
 auto QUADpw_1=( 80);
 auto QUADct_1=( 1.0e-10);
 auto A_62=buildvXID( n_0,QUADio_1);
 auto r_0=( A_62);
 auto A_66=quadXDD( A_62,QUADpp_1,QUADpw_1);
 auto A_68=sameDDB(r_0,2000332333500.0,QUADct_1);
 /* dsf scalar(s) */
auto A_69=plusBBI(true,A_68);
auto r_1=( A_69);
 auto A_73=quadXII( A_69,QUADpp_1,QUADpw_1);
 return(r_1);
}

