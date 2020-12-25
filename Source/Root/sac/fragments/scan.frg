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
 z = genarray(size,Ito$ZT($FRID));
 if (0 != size[[0]]) {
        /* real work to do */ 
        z[[0]] = $YTto$ZT(y[[0]]); /* Not sure about the coercion... */
        for ( i=1; i<size[[0]]; i++) {
                z[[i]] = $FN$ZT$ZT$ZT($YTto$ZT(z[[i-1]]),$YTto$ZT(y[[i]]));
        }
  }
 return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment  bsl1  x22 bid bid bid . 
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ /* Scan of matrix along first axis */
y = TRANSPOSE(y);
defcell = genarray(take([-1], shape(y)), $OTFILL);
z = with{
        (. <= iv <= .) :  $FNAME(y[iv]);
        } : genarray(drop([-1],shape(y)), defcell);
 return(TRANSPOSE(z));
}
%Generate $FN, bsl, X$YT$ZT, X11, ., $CT
%Generate , TRANSPOSE, X$YT$YT, X**, ., $CT
%Generate , TRANSPOSE, X$ZT$ZT, X**, ., $CT

%Fragment  bsl  x22 bid bid bid . 
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ /* Scan of matrix along last axis */
defcell = genarray(take([-1], shape(y)), $OTFILL);
z = with{
        (. <= iv <= .) :  $FNAME(y[iv]);
        } : genarray(drop([-1],shape(y)), defcell);
 return(z);
}
%Generate $FN, bsl, X$YT$ZT, X11, ., $CT

