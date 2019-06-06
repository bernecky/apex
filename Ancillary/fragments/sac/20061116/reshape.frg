% Code fragments for reshape fragments
%
% Rewritten for sac with help from Sven-Bodo Scholz.
% Robert Bernecky 2004-09-17. Add SAC-like rank specifiers

%Fragment rho 001 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar reshape scalar to vector) */ 
	z = genarray([toi(x)], y);
	return(z);
}

%Fragment rho 100 bidc bidc bidc .
inline $ZTYPE $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Empty Vector reshape scalar to scalar */ 
 return(y);
}

%Fragment rho 10* bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Vector reshape scalar to matrix) */ 
	zxrho = prod(toi(x)); /* Result element count */
	z = genarray([zxrho], y); /* allocate result */
	z = reshape(toi(x),z);
	return(z);
}

%Fragment rho 0*1 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[*] y)
{ /* Scalar reshape non-scalar (to vector) */ 
 z = rhoI$YT$ZT([toi(x)],y);
 return(z);
}
%Generate , rho, I$YT$YT, 1*1, ., $YT

%Fragment rho 1** bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* APEX vector x reshape, with item reuse */ 
  ix = toi(x);
  ry = comaX$YT$YT(y); 
  zxrho = prod(ix); /* THIS NEEDS XRHO FOR CODE SAFETY!! */ 
  yxrho = shape(ry)[[0]];
  if( zxrho <= yxrho) { /* No element resuse case */
        z = take([zxrho],ry); 
 } else { 
        ncopies = zxrho/yxrho; /* # complete copies of y. */
        /* FIXME: y empty case !*/
        z = with(. <= [i] <= .)
                genarray( [ncopies], y,y);
        /* Now append the leftover bits */
        z = comaX$YT$YT(z) ++ take([zxrho-(ncopies*yxrho)],ry); 
 } 
 return(reshape(ix,z)); 
}
%Generate , coma, X$YT$YT, X*1, ., $YT


%Fragment rho *** bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[*] x, $YTYPE[*] y)
{ /* x rank>1! rank error! */
 APEXERROR("rank error"++__FILE__++__LINE__);
 return(y);
}
