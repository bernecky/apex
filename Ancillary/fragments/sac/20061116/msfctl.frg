% APEX code fragments for monadic scalar functions.
% R. Bernecky 2006-01-05

%Fragment msfctl x** x bidc bidc .
inline $ZTYPE[+]$SYSVARGOUT $FNAME($YTYPE[+] y$SYSVARGDECL)
{ /* Monadic scalar functions on array */
  z = with( . <= iv <= .)
        genarray(shape(y), 
	$FNX$CT$ZT(to$CT(y[iv])$SYSVARGKER),$OTFILL);
  return(z);
}
%Generate , $FN, $XT$CT$ZT, x00, ., $CT
