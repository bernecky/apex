% Plural code fragments for monadic structural function loop structures.
% Robert Bernecky 2012-01-29
%
%Fragment tran x00  x bidc bidc .
%Fragment rotr x00  x bidc bidc .
%Fragment rot1 x00  x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Transpose and reverse on scalars are NOPs */ 
return(y);
}

%Fragment coma x01 x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Ravel of scalar */
  auto shpz = [1];
  auto valz = new $YTYPE[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

%Fragment comb x02 x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Table of scalar */
  auto shpz = [1, 1];
  auto valz = new $YTYPE[ 1];
       valz[0] = y;
  auto z = new Parray( shpz, valz);
  return(z);
}

// Can't have two fns w/same signature
//%Fragment comb x12 x bidc bidc .
//$ZTYPE $FNAME($YTYPE y)
//{ /* Table on vector */
//  auto shpz = y.getShp() ~ 1;
//  auto z = new Parray( shpz, y.get$YT());
//  return(z);
//}

// Can't have two fns w/same signature
//%Fragment comb x22 x bidc bidc .
//$ZTYPE $FNAME($YTYPE y)
//{ /* Table on table is NOP */
//        return(y);
//}

%Fragment comb x** x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Table on matrix */
  auto shpy = y.getShp();
  auto shp0 = shpy[0];
  auto shp1 = xrhoShp( shpy[ 1 .. shpy.length]);
  auto shpz = [ shp0, shp1];
  auto z = new Parray( shpz, y.get$YT());
  return(z);
}
%Generate , xrhoShp, XII, X10, ., I

// Can't have two fns w/same signature
//%Fragment tran x11 x bidc bidc .
//$ZTYPE $FNAME($YTYPE y)
//{ /* Transpose on vectors is NOP */ 
//        return(y);
//}

// This produces two functions taking Parray* as 
// argument, which confuses dmd: one for vector, and
// one for non-vector, but they have same type signatures.
//
//%Fragment coma x11 x bidc bidc .
//$ZTYPE $FNAME($YTYPE y)
//{ /* Ravel of vector is NOP */  
//        return(y);
//}


%Fragment coma x*1 x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Ravel of anything with rank>1 */
  auto yval = y.get$YT();
  auto shp = new int[ 1];
       shp[0] = cast( int) yval.length;
  auto z = new Parray( shp, yval);
  return(z);
}

%Fragment rot1 x** x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* First axis reverse on non-scalar */
  auto yt = TRANSPOSE( y);
  auto z = rotrX$YT$ZT( yt); 
  z = TRANSPOSE( z);
  return( z);
}
%Generate , TRANSPOSE, I$YT$ZT,   1**, ., $CT 
%Generate , rotr,      X$YT$ZT,   X**, ., $CT 

%Fragment rotr x** x bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{/* Last axis reverse on non-scalar */
  auto shpz = y.getShp();
  auto valy = y.get$YT();
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
%Generate , xrhoShp, XII, X10, ., I

%Fragment tran X** X bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Monadic transpose */
  auto z = TRANSPOSE( y);
  return( z);
}
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

