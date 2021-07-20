% Code fragments for scans
% 1995-07-04
%
%Fragment bsl x00 bid bid bid .
inline $ZTYPE $FNAME($YTYPE y)
{ /* Scan of a scalar */
 return(y);
}

%Fragment bsl x11 bid bid bid .
inline $ZTYPE[.] $FNAME($YTYPE[.] y)
{ // Scan of vector 
 shp = shape(y)[0];
 z = genarray([shp],Ito$ZT($FRID));
 if (0 != shp) { // real work to do
        z[[0]] = $YTto$ZT(y[[0]]); // Not sure about coercion
        for ( i=1; i<shp; i++) {
           z[[i]] = $FN$ZT$ZT$ZT($YTto$ZT(z[[i-1]]),$YTto$ZT(y[[i]]));
        }
  }
 return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment  bsl1  x** bid bid bid . 
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ // first-axis matrix/tensor scan
 z = TRANSPOSE( $FNAME(TRANSPOSE(y)));
 return(z);
}
%Generate , bsl,       X$YT$YT, X**, ., $CT
%Generate , TRANSPOSE, X$YT$YT, X**, ., $CT
%Generate , TRANSPOSE, X$ZT$ZT, X**, ., $CT

%Fragment  bsl  x22 bid bid bid . 
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ // last-axis matrix/tensor scan
defcell = genarray(take([-1], shape(y)), $OTFILL);
z = with{
        (. <= iv <= .) :  $FNAME(y[iv]);
        } : genarray(drop([-1],shape(y)), defcell);
 return(z);
}
%Generate $FN, bsl, X$YT$ZT, X11, ., $CT

