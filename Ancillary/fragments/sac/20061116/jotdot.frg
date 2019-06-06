% SAC Code fragments for outer product loop control.
% Robert Bernecky 2005-11-05

%Fragment  jotdot 000 bidc bidc bidc .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* SxS outer product */
  z = $FN$CT$CT$ZT(to$CT(x),to$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT

%Fragment  jotdot 0** bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE x, $YTYPE[*] y$SYSVARFGDECL)
{ /* SxA outer product */
  z = $FN$CT$CT$ZT(to$CT(x),to$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 0**, ., $CT

%Fragment  jotdot *0* bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE [+] x, $YTYPE y$SYSVARFGDECL)
{ /* AxS outer product */
  z = $FN$CT$CT$ZT(to$CT(x),to$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, *0*, ., $CT

%Fragment  jotdot *** bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE [*] x, $YTYPE [*] y$SYSVARFGDECL)
{ /* AxA outer product */
 cell = genarray(shape(y), $OTFILL);
 z = with (. <= iv <= .) {
	 xitem = to$CT(x[iv]);
	}
       	 genarray(shape(x),
	 	 $FN$CT$CT$ZT(xitem, to$CT(y)$SYSVARGKER),cell);
 return(z);
}

%Generate , $FN, $CT$CT$ZT, 0**, ., $CT
