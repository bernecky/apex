% Code fragments for outer product loop control.
%
% Robert Bernecky 2012-01-29 Plural code generator

%Fragment  jotdot 000 bidc bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* SxS outer product */
  z = $FN$CT$CT$ZT($XTto$CT(x),$YTto$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT

%Fragment  jotdot 0** bidc bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* SxA outer product */
  z = $FN$CT$CT$ZT($XTto$CT(x),$YTto$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 0**, ., $CT

%Fragment  jotdot *0* bidc bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* AxS outer product */
  z = $FN$CT$CT$ZT($XTto$CT(x),$YTto$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, *0*, ., $CT

%Fragment  jotdot *** bidc bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* AxA outer product */
 FIXME;
 cell = genarray(shape(y), $OTFILL);
 
 z = with {
        (. <= iv <= .) {
         xitem = to$CT(x[iv]);
        } : $FN$CT$CT$ZT(xitem, to$CT(y)$SYSVARGKER);
        } : genarray(shape(x), cell);
 return(z);
}
%Generate , $FN, $CT$CT$ZT, 0**, ., $CT