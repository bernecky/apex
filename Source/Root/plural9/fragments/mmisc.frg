/*
 * Monadic miscfns:
 *
 *      shape, index generator, matrix inverse,
 *      dex, nubsieve, thorn
 */

%Fragment iota X11 x bidc i .
Parray* $FNAME(Parray* y, int QUADio)
{ /* Index generator on 1-element vector */
  /* HELP! Needs domain check for negative shp */
  assert( 1 == y.getShp()); /* Vector y */
  auto v = y.getInt();
  assert( 1 == v.length); /* 1-el vector y */
  auto z = $FNAME( y, QUADio);
  return( z);
}
%Generate , $FNAME, XII, 001, ., I

%Fragment iota x01 x bidc i .
Parray* $FNAME($YTYPE y, int QUADio)
{ /* Index generator on Scalar */
  auto v = $YTtoI( y);
  auto s = [ v];
  auto val = new int[ v];

  foreach (i, ref el; val) {
    el = QUADio + cast(int) i ;
  }

  auto z = new Parray( s, val);
  return( z);
}
//unittest {
//  auto vec = $FNAME(5);
//  auto shp = vec.getShp();
//  auto val = vec.getInt();
//  assert( 5 == shp[0]);
//  writeln(" iota shape is %d\n",  shp);
//  writeln(" iota value is %d\n",  val);
//}

%
%Fragment iota x01 x bidc i NonNeg
Parray* $FNAMENonNeg($YTYPE y, int QUADio)
{ /* Index generator on ScalarN when N is non-negative integer */
  auto z = $FNAME( y, QUADio);
  return( z);
}
%Generate , $FNAME, XII, 001, ., I

%Fragment ltak X00 X    bidc bidc .
%Fragment ltak 000 bidc bidc bidc .
$ZTYPE $FNAME($YTYPE y) 
{ /* Dex on scalar */
  return(y);
}

%Fragment ltak *** x bidc bidc .
Parray* $FNAME(Parray* y) 
{ /* Dex on non-scalar */
  return(y);
}

%Fragment rho x01 x bidc i . 
Parray* $FNAME($YTYPE y) 
{ /* Shape of scalar */
  auto shp = [0];
  auto val = new int[0];
  auto z = new Parray( shp, val);
  return( z);
}

%Fragment rho x** x bidc i .
Parray* $FNAME($YTYPE y) 
{ /* Shape of non-scalar */
  auto val = y.getShp();
  auto shp = [ cast(int) val.length];
  auto z = new Parray( shp, val); 
  return( z);
}

%Fragment quad x00 x bidc bidc .
$ZTYPE $FNAME($YTYPE y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar */
  writeln(y);
  return(y);
}
%Fragment quad x** x bidc bidc .
Parray* $FNAME(Parray* y, int QUADpp, int QUADpw)
{ /* {quad}{<-} non-scalar */
  writeln(y.get$YT());
  return(y);
}

