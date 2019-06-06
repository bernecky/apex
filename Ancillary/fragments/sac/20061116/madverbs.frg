$ SAC 2006-08-09 rbernecky
% Code fragments for monadic adverbs: reduce, scan, and cut.
%
% NB. Replicate and expand are located in replicat.frg
%
%Fragment sl  x00 bidc bidc bidc .
%Fragment sl1 x00 bidc bidc bidc .
%Fragment sl  x00 bidc bidc bidc QUICKSTOP 
%Fragment sl1 x00 bidc bidc bidc QUICKSTOP 
%Fragment sl  x00 bidc bidc bidc FOLD 
%Fragment sl1 x00 bidc bidc bidc FOLD 
inline $ZTYPE $FNAME($YTYPE y)
{ /* Reduction of scalar */
	return(y);
}

%Fragment sl  x10 bidc bidc bidc FOLD 
%Fragment sl1 x10 bidc bidc bidc FOLD 
inline $ZTYPE $FNAME($YTYPE[.] y)
{ /* First/last axis fold-based reduction of vector */ 
  lim = shape(y)[0]-1;
  z = with (0*shape(y) <= iv < shape(y)) 
        fold( $FN$ZT$ZT$ZT, to$ZT($FRID), to$ZT(y[lim-iv]));
  return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT


%Fragment sl  x10 bidc bidc bidc QUICKSTOP 
%Fragment sl1 x10 bidc bidc bidc QUICKSTOP 
inline $ZTYPE $FNAME($YTYPE[.] y)
{ /* First/last axis reduction of vector with quick stop*/ 
  z = with (0*shape(y) <= iv < shape(y)) 
        foldfix( $FN$ZT$CT$ZT, to$ZT($FRID), to$ZT($STOPONVALUE), to$CT(y[iv]));
  return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment sl  x10 bidc bidc bidc . 
%Fragment sl1 x10 bidc bidc bidc . 
inline $ZTYPE $FNAME($YTYPE[.] y)
{ /* First/last axis slow reduction of vector. Can't use fold or quickstop */ 
 shp = shape(y)[[0]];
 if (0 == shp)
  z = to$ZT($FRID); 
 else {
  z = to$ZT(y[[shp-1]]);
  for (i=shp-2; i>=0; i--)
   z = $FN$ZT$CT$ZT(to$CT(y[[i]]),to$CT(z));
 }
 return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment  sl  x** bidc bidc bidc FOLD
%Fragment  sl  x** bidc bidc bidc QUICKSTOP
%Fragment  sl  x** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{ /* last axis reduce rank-2 or greater matrix */
  sy = shape(y);
  zrho = drop([-1], sy);
  z = with (. <= iv <= .) 
	genarray(zrho, 
	$FNAME(y[iv]),$OTFILL); 
  return(z);
}
%Generate $FN, sl, X$YT$ZT, X10, ., $ZT

%Fragment  sl1  x** bidc bidc bidc FOLD
%Fragment  sl1  x** bidc bidc bidc QUICKSTOP
%Fragment  sl1  x** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{ /* first-axis reduce rank-2 or greater matrix */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with(. <= iv <= .)
	genarray(zrho, $FNslX$YT$ZT(yt[iv]),$OTFILL);
  z = TRANSPOSE(z);
  return(z);
}
%Generate $FN, 	sl, 		X$YT$ZT, X10,	., $ZT
%Generate ,  	TRANSPOSE,	X$YT$YT, X**,	., $YT
%Generate ,  	TRANSPOSE,	X$ZT$ZT, X**,	., $ZT


