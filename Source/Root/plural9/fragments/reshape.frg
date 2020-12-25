% Code fragments for reshape fragments
%
% Robert Bernecky 2012-01-29   Plural code generator

%Fragment rho 001 bid bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar reshape scalar to vector) */ 
  auto xrho = $XTtoI( x);
  auto shpz = [ xrho];
  auto valz = new $YTYPE[ xrho];
  foreach( i; 0 .. xrho) {  
    valz[i] = y;
  }
  auto z = new Parray( shpz, valz);
  return(z);
}

%Fragment rho 100 bidc bidc bidc .
$ZTYPE $FNAME($XTYPE[0] x, $YTYPE y)
{ /* Empty Vector reshape scalar to scalar */ 
  return(y);
}

%Fragment rho 10* bidc bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{ /* Vector reshape scalar to matrix) */ 
  auto xint = $XTtoI( x);
  auto shpz = xint.getI();
  auto xrho = xrhoShp( shpz);
  auto valz = new $YTYPE[ xrho];
  foreach( i; 0 .. xrho) {
    valz[i] = y;
  }
  auto z = new Parray( shpz, valz);
  return(z);
}
%Generate , xrhoShp, III,     X10, ., I

%Fragment rho 0*1 bid bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar reshape non-scalar (to vector) */ 
  z = rhoI$YT$ZT([toi(x)],y);
  return(z);
}
%Generate , rho, I$YT$YT, 1*1, ., $YT

%Fragment rho 1** c bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{ /* Character-vector reshape anything. */

  /* Left argument must be empty vector! */
  writeln("fixme reshape");
  z = reshape([prod(shape(y))], y);
  return(z[[0]]);
}

%Fragment rho 1** bid bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{ /* Vector x reshape, with potential item reuse */ 

  auto shpz = x.getI();
  auto zrho = xrhoShp( shpz);
  auto yrho = xrhoShp( y.getShp());
  auto valy = y.get$YT();
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
%Generate  , xrhoShp, XII,     X10, ., I

%Fragment rho *** bidc bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{ /* x rank>1! rank error! */
 writeln("rank error"++__FILE__++__LINE__);
 return(y);
}

