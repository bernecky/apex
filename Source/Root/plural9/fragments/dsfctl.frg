% Code fragments for dyadic scalar functions.
%
% R. Bernecky 2012-01-12 Plural code generator
%  
%  We can not provide full support for singleton
%  extension. Consider (1 1 1 rho 2) + iota n.
%  If n>1 then the result is a vector. 
%  If n=1, the result is a tensor!
%  Hence, we forbid ALL singletons.

% There is some redundancy in the code fragments below, because,
% e.g., we may mark a SxS operation as sx, sy, or neither...
%
% $FNAME: Name of the scalar function iterator we are building,
%	e.g., plusBII
% $FN: Name of the scalar-scalar function itself,
%       e.g., dplus
%      This will have types appended to it, to give complete name,
%       e.g., dplusBII
% $SYSVARDECL: string appended to function header for input system vars.
% $SYSVARGKER: string appended to scalar fn kernel call for system vars.
% $SYSVAROUT: string appended to function header for output system vars.
% $XT: type of x as BIDC.
% $YT: type of y as BIDC.
% $CT: compute type as BIDC.
% $ZT: result type as BIDC.
% $XTYPE: type of x as SAC name, e.g., bool, int, double, char
% $YTYPE: type of y as SAC name, e.g., bool, int, double, char
% $ZTYPE: result type as SAC name, e.g., bool, int, double, char 

%Fragment dsfctl   0**  bidc bidc bidc .
%Fragment dsfctlsx 0**  bidc bidc bidc . 
Parray* $FNAME( $XTYPE x, Parray* y $SYSVARGDECL) {
  /* SxA scalar function */
  auto v = new $ZTYPE[y.get$YT().length];
  auto xel = $XTto$CT(x);
  auto yels = y.get$YT();
  foreach( i; 0 .. y.get$YT().length) {
    v[i] = $FN$CT$CT$ZT(xel, $YTto$CT(yels[i])$SYSVARGKER);
  }
  auto z = new Parray( y.getShp(), v); 
  return( z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT

%Fragment dsfctl   *0* bidc bidc bidc .
%Fragment dsfctlsy *0* bidc bidc bidc .
Parray* $FNAME( Parray* x, $YTYPE y$SYSVARGDECL) {
  /* AxS scalar function */
  auto v = new $ZTYPE[x.get$XT().length];
  auto xels = x.get$XT();
  auto yel = $YTto$CT(y);
  foreach( i; 0 .. x.get$XT().length) {
    v[i] = $FN$CT$CT$ZT($XTto$CT(xels[i]),yel$SYSVARGKER);
  }
  auto z = new Parray( x.getShp(), v); 
  return( z);
}
%Generate , $FN, $XT$YT$ZT, 000, ., $CT

%Fragment dsfctlsl *** bidc bidc bidc .
ParraY* $FNAME( Parray* x, $YTYPE[] y$SYSVARGDECL) {
{ /* AxA Dyadic scalar fn, shapes unknown */
  auto v = new $ZTYPE[x.get$XT.length];
  auto xels = x.get$XT(); 
  auto yels = y.get$YT();
  foreach( i; 0 .. x.get$XT.length) {
    v[i] = $FN$CT$CT$ZT($XTto$CT(xels[i]), $YTto$CT(yels[i])$SYSVARGKER);
  }
  auto z = new Parray( x.getShp(), v); 
  return( z);
}
%Generate , $FN, $XT$YT$ZT, 000, ., $CT

