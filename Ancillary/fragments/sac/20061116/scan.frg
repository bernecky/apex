% Code fragments for scans
% 1995-07-04
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%
%Fragment bsl x00 bid bid bid .
inline $ZTYPE $FNAME($YTYPE y)
{ /* Scan of a scalar */
 return(y);
}

%Fragment bsl x11 bid bid bid .
inline $ZTYPE[.] $FNAME($YTYPE[.] y)
{ /* Scan of vector */
/* This does the scan in the wrong direction, but since
 * we assume associative functions only, it should be ok.
 */
 size = shape(y);
 z = genarray(size,to$ZT($FRID));
 if (0 != size[[0]]) {
 	/* real work to do */ 
 	z[[0]] = to$ZT(y[[0]]); /* Not sure about the coercion... */
 	for ( i=1; i<size[[0]]; i++) {
  		z[[i]] = $FN$ZT$CT$ZT(to$CT(z[[i-1]]),to$CT(y[[i]]));
 	}
  }
 return(z);
}
%Generate , $FN, $ZT$CT$ZT, 000, ., $CT



%Fragment  bsl1  x22 bid bid bid . 
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ /* Scan of matrix along first axis */
??
}

%Fragment  bsl  x22 bid bid bid . 
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ /* Scan of matrix along last axis */
??
}

