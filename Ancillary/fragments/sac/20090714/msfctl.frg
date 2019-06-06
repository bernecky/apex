% APEX code fragments for monadic scalar functions.
% R. Bernecky 2006-01-05

%Fragment msfctl x** x bidc bidc .
inline $ZTYPE[+]$SYSVARGOUT $FNAME($YTYPE[+] y$SYSVARGDECL)
{ /* Monadic scalar functions on array */
  z = with { 
	( . <= iv <= .)
		: $FNX$CT$ZT(to$CT(y[iv])$SYSVARGKER);
	} : genarray(shape(y), $OTFILL);
  return(z);
}
%Generate , $FN, $XT$CT$ZT, x00, ., $CT
