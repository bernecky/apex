% APEX code fragments for dyadic scalar functions.
% R. Bernecky 2005-10-07 
%  
%  We can not, in general, provide full support for singleton
%  extension. Consider the (1 1 1 rho 2)+ iota n.
%  If n>1 then the result is a vector. 
%  If n=1, the result is a tensor!
%  Hence, we should forbid ALL singletons of rank>1. 

%  We SHOULD forbid
%  vector singletons as well (things would run faster), but 
%  there is too much code that depends on this behavior. 1996-05-04

% There is some redundancy in the code fragments below, because,
% e.g., we may mark a SxS operation as sx, sy, or neither...
%
% $FNAME: Name of the scalar function iterator we are building,
%	e.g., plusBII
% $FN: Name of the scalar-scalar function itself,
%       e.g., dplus
%      This will have types appended to it, to give complete name,
%       e.g., dplusBII
% $SYSVARIN: string appended to function header for input system vars.
% $SYSVARG: string appended to scalar fn kernel call for system vars.
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
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y$SYSVARGDECL)
{ /* SxA scalar function */
  xel = to$CT(x);
  z = with {
	( . <= iv <= .) {
        	yel = to$CT(y[iv]);
      		} : $FN$CT$CT$ZT(xel,yel$SYSVARGKER);
	} : genarray(shape(y), $OTFILL);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT

%Fragment dsfctl   *0* bidc bidc bidc .
%Fragment dsfctlsy *0* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE y$SYSVARGDECL)
{ /* AxS scalar function */
  yel = to$CT(y);
  z = with { 
	( . <= iv <= .) {
		xel = to$CT(x[iv]);
	} : $FN$CT$CT$ZT(xel,yel$SYSVARGKER);
	} : genarray( shape(x), $OTFILL);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT

%Fragment dsfctlsl *** bidc bidc bidc .
inline $ZTYPE[+] $FNAMEsl($XTYPE[+] x, $YTYPE[+] y$SYSVARGDECL)
{ /* AxA Dyadic scalar fn, shapes unknown, but known to match */
  z = with {
	( . <= iv <= .) {
		xel = to$CT(x[iv]);
		yel = to$CT(y[iv]);
 	}: 	$FN$CT$CT$ZT(xel,yel$SYSVARGKER);
        genarray(shape(x), $OTFILL);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT

%Fragment dsfctl *** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[+] y$SYSVARGDECL)
{ /* AxA Dyadic scalar fn, shapes may or may not match */
	sx = shape(y);
	z = with {
		( . <= iv <= .) {
			xel = to$CT(x[iv]);
			yel = to$CT(y[iv]);
		} : $FN$CT$CT$ZT(xel,yel$SYSVARGKER);
        } : genarray(sx, $OTFILL);
  return(z);
}
%Generate , $FN, $CT$CT$ZT, 000, ., $CT
%Generate , $FN, $CT$CT$ZT, 0**, ., $CT
%Generate , $FN, $CT$CT$ZT, *0*, ., $CT
%Generate , coma, X$XT$XT, X*1, ., $XT 
%Generate , coma, X$YT$YT, X*1, ., $YT 

