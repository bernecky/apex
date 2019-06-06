% Plural code fragments for monadic scalar functions.
% R. Bernecky 2012-01-29

%Fragment msfctl x** x bidc bidc .
Parray* $SYSVARGOUT $FNAME(Parray* y$SYSVARGDECL)
{ /* Monadic scalar functions on array */
  auto shp = y.getShp();
  auto val = new $ZT[ xrhoShp( shp)];
  foreach ( i; 0 .. val.length) {
    val[i] = $FNX$CT$ZT($YTto$CT(y.get$YT()[i])$SYSVARGKER);
  }
  auto z = new Parray( shp, val);

  return(z);
}
%Generate , $FN, $XT$CT$ZT, x00, ., $CT
%Generate , xrhoShp, III,     X10, ., I
