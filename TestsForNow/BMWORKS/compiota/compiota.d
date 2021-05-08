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


/* Compiled by APEX Version: /home/apex/apex3/wss/plural1.dws2012-02-10 14:54:33.042 */

bool eqDDB(double x, double y, double QUADct)
{ /* A=B on doubles */
  return((DtoD(x) == DtoD(y)) || APEXFUZZEQ(DtoD(x),DtoD(y),QUADct));
}


int plusBBI(bool x, bool y)
{ return(BtoI(x)+BtoI(y));
}

Parray* eqCCB( char x, Parray* y ) {
  /* SxA scalar function */
  auto v = new bool[y.getC().length];
  auto xel = CtoC(x);
  auto yels = y.getC();
  foreach( i; 0 .. y.getC().length) {
    v[i] = eqCCB(xel, CtoC(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


Parray* plusDID( double x, Parray* y ) {
  /* SxA scalar function */
  auto v = new double[y.getI().length];
  auto xel = DtoD(x);
  auto yels = y.getI();
  foreach( i; 0 .. y.getI().length) {
    v[i] = plusDDD(xel, ItoD(yels[i]));
  }
  auto z = new Parray( y.getShp(), v);
  return( z);
}


char rhoICC(int x, char y)
{ /* Scalar reshape non-scalar (to vector) */
  z = rhoICC([toi(x)],y);
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
char quadavXXC()
{ /* QUADav - system character set */
 auto z = Parray( [256]);

 foreach( i; 0 .. 256) {
   z[i] = cast(char) i;
 }
 return(z);
}

char[*] indr(char[+] X, int I)
{ /* X[scalarI;;;] */
  /* Used only in conjunction with other indexing, e.g.,
   * X[scalarI;;j;]
   */
 z = X[[I]];
 return(z);
}




int[.] slBII(bool[.] x, int[.] y)
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


bool eqCCB(char x, char y)
{ /* A=B on non-doubles */
  return(CtoC(x) == CtoC(y));
}

double plusDDD(double x, double y)
{ return(DtoD(x)+DtoD(y));
}

char rhoICC(int x, char y)
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


char[*] indrfr(int fr, char[+] X, int[+] I)
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

char[*] indrfr0(char[+] X, int[+] I)
{ /* X[I;;;] or    I from X */
  cellshape =  drop([1], shape(X));
  cell = genarray(cellshape, ' ');
 z = with {
        (. <= iv <= .)
                : sel( I[iv], X);
        } : genarray(shape(I), cell);
 return(z);
}



char[*] indrfr(int fr, char[+] X, int I)
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


bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
  auto tolerance = QUADct * max(abs(x), abs(y));
  auto z = abs(x-y) <= tolerance;
  return(z);
}

int ABC(int I, int Xshape)
{ /* (OLD) Array bounds check for indexed ref X[scalarI] & indexed assign */
 z = I;
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

int[+] ABC(int[+] I, int Xshape)
{ /* (OLD) Array bounds check for indexed ref X[nonscalarI] & indexed assign */
 z = I;
 return(z);
}

double compiotaXID(int n ,int QUADio)
{ 
/*
 ?
*/
auto A_25=iotaXII( n,QUADio);
 auto A_26=quadavXXC( );
 auto A_27=rhoICC(n,A_26);
 auto A_29=quadavXXC( );
 A_28= ABC(toi(32)-QUADio,shape(A_29)[0]);
auto A_31=A_29[[A_28]];
 /* dsf scalar(s) */
auto A_33=eqCCB(A_31,A_27);
 auto A_34=slBII(A_33,A_25);
 /* dsf scalar(s) */
auto A_35=plusDID(0.5,A_34);
 auto A_36=plusslXDD( A_35);
 auto r_0=( A_36);
 return(r_0);
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
 auto QUADct_1=( 1.0e-13);
 auto QUADpp_1=( 16);
 auto QUADpw_1=( 80);
 auto n_0=( 40000000);
 auto A_61=compiotaXID( n_0,QUADio_1);
 auto r_0=( A_61);
 auto A_65=quadXDD( A_61,QUADpp_1,QUADpw_1);
 /* dsf scalar(s) */
auto A_67=eqDDB(r_0,3124985078125.0,QUADct_1);
/* dsf scalar(s) */
auto A_68=plusBBI(true,A_67);
 auto r_1=( A_68);
 auto A_72=quadXII( A_68,QUADpp_1,QUADpw_1);
 return(r_1);
}

