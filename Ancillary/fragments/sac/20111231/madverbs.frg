$ SAC 2006-08-09 rbernecky
% Code fragments for monadic adverbs: reduce, scan, and cut.
%
% NB. Replicate and expand are located in replicat.frg


%%%%%%%%%%%%%%%%%%%%% reduce on scalars %%%%%%%%%%%%%%%%%%%%555

%Fragment sl  x00 bidc bidc bidc .
%Fragment sl1 x00 bidc bidc bidc .
inline $ZTYPE $FNAME($YTYPE y)
{ /* Reduction of scalar */
        return(y);
}

%Fragment sl  x00 bidc bidc bidc QUICKSTOP 
%Fragment sl1 x00 bidc bidc bidc QUICKSTOP 
inline $ZTYPE $FNAMEQUICKSTOP($YTYPE y)
{ /* Reduction of scalar */
        return(y);
}

%Fragment sl  x00 bidc bidc bidc FOLD 
%Fragment sl1 x00 bidc bidc bidc FOLD 
inline $ZTYPE $FNAMEFOLD($YTYPE y)
{ /* Reduction of scalar */
        return(y);
}

% The identity elements for vector reductions are not exactly right.
% We use maxint() and minint() for integer min/max reduce, whereas
% APL uses maxdouble() and mindouble(). If we did this, we would
% end up with reduce ALWAYS having to produce a double result. 
% Bummer, Hal. 
% Purists can rewrite their integer reductions as:
%      min/maxdouble(), Y
% and get that double result they yearn for.

%%%%%%%%%%%%%%%%%%%%% reduce on vectors %%%%%%%%%%%%%%%%%%%%555

%Fragment sl  x10 bidc bidc bidc FOLD 
%Fragment sl1 x10 bidc bidc bidc FOLD 
inline $ZTYPE $FNAMEFOLD($YTYPE[.] y)
{ /* First/last axis fold-based reduction of vector */ 
  lim = shape(y)[0]-1;
  z = with {
        (0*shape(y) <= iv < shape(y)) 
                : to$ZT(y[lim-iv]);
       } :  fold( $FN$ZT$ZT$ZT, to$ZT($FRID));
  return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment sl  x10 bidc bidc bidc QUICKSTOP 
%Fragment sl1 x10 bidc bidc bidc QUICKSTOP 
inline $ZTYPE $FNAMEQUICKSTOP($YTYPE[.] y)
{ /* First/last axis reduction of vector with quick stop*/ 
  z = with {
         (0*shape(y) <= iv < shape(y)) 
                : to$CT(y[iv]);
        } : foldfix( $FN$ZT$CT$ZT, to$ZT($FRID), to$ZT($STOPONVALUE));
  return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment sl  x10 bidc bidc bidc . 
%Fragment sl1 x10 bidc bidc bidc . 
inline $ZTYPE $FNAME($YTYPE[.] y)
{ /* First/last axis slow reduction of vector. Can't use fold or quickstop */ 
 shp = shape(y)[[0]];
 if (0 == shp) {
   z = to$ZT($FRID); 
 } else {
   z = to$ZT(y[[shp-1]]);
   for (i=shp-2; i>=0; i--) {
     z = $FN$ZT$CT$ZT(to$CT(y[[i]]),to$CT(z));
   }
 }
 return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%%%%%%%%%%%%%%%%%%%%% last-axis reduce on rank>1 arrays  %%%%%%%%%%%%%%%%%%%%555

%Fragment  sl  x** bidc bidc bidc QUICKSTOP
inline $ZTYPE[+] $FNAMEQUICKSTOP($YTYPE[+] y)
{ /* last axis reduce rank-2 or greater matrix w/quickstop */
  sy = shape(y);
  zrho = drop([-1], sy);
  z = with {
         (. <= iv <= .) 
                : $FNAMEQUICKSTOP(y[iv]);
        } : genarray(zrho, $OTFILL); 
  return(z);
}
%Generate $FN, sl, X$YT$ZT, X10, QUICKSTOP, $ZT

%Fragment  sl  x** bidc bidc bidc FOLD
inline $ZTYPE[+] $FNAMEFOLD($YTYPE[+] y)
{ /* last axis reduce rank-2 or greater matrix w/folding */
  sy = shape(y);
  zrho = drop([-1], sy);
  z = with {
         (. <= iv <= .) 
                : $FNAMEFOLD(y[iv]);
        } : genarray(zrho, $OTFILL); 
  return(z);
}
%Generate $FN, sl, X$YT$ZT, X10, FOLD, $ZT

%Fragment  sl  x** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{ /* last axis reduce rank-2 or greater matrix w/no smarts */
  sy = shape(y);
  zrho = drop([-1], sy);
  z = with {
         (. <= iv <= .) 
                : $FNAME(y[iv]);
        } : genarray(zrho, $OTFILL); 
  return(z);
}
%Generate $FN, sl, X$YT$ZT, X10, ., $ZT


%%%%%%%%%%%%%%%%%%%%% first-axis reduce on rank-2 arrays  %%%%%%%%%%%%%%%%%%

%Fragment  sl1  x21 bidc bidc bidc QUICKSTOP
inline $ZTYPE[.] $FNAMEQUICKSTOP($YTYPE[.,.] y)
{ /* first-axis reduce rank-2 matrix with quickstop */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : $FNslX$YT$ZTQUICKSTOP(yt[iv]);
        } : genarray(zrho, $OTFILL);
  return(z);
}
%Generate $FN,  sl,             X$YT$ZT, X10,   QUICKSTOP, $ZT
%Generate ,     TRANSPOSE,      X$YT$YT, X**,   ., $YT
%Generate ,     TRANSPOSE,      X$ZT$ZT, X**,   ., $ZT


%Fragment  sl1  x21 bidc bidc bidc FOLD
inline $ZTYPE[.] $FNAMEFOLD($YTYPE[.,.] y)
{ /* first-axis reduce rank-2 matrix */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : $FNslX$YT$ZTFOLD(yt[iv]);
        } : genarray(zrho, $OTFILL);
  return(z);
}
%Generate $FN,  sl,             X$YT$ZT, X10,   FOLD, $ZT
%Generate ,     TRANSPOSE,      X$YT$YT, X**,   ., $YT
%Generate ,     TRANSPOSE,      X$ZT$ZT, X**,   ., $ZT

%Fragment  sl1  x21 bidc bidc bidc .
inline $ZTYPE[.] $FNAME($YTYPE[.,.] y)
{ /* first-axis reduce rank-2 matrix */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : $FNslX$YT$ZT(yt[iv]);
        } : genarray(zrho, $OTFILL);
  return(z);
}
%Generate $FN,  sl,             X$YT$ZT, X10,   ., $ZT
%Generate ,     TRANSPOSE,      X$YT$YT, X**,   ., $YT
%Generate ,     TRANSPOSE,      X$ZT$ZT, X**,   ., $ZT


%%%%%%%%%%%%%%%%%%%%% first-axis reduce on rank>2 arrays  %%%%%%%%%%%%%%%%%%

%Fragment  sl1  x** bidc bidc bidc QUICKSTOP
inline $ZTYPE[+] $FNAMEQUICKSTOP($YTYPE[+] y)
{ /* first-axis reduce rank-3 or greater matrix with quickstop */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : $FNslX$YT$ZTQUICKSTOP(yt[iv]);
        } : genarray(zrho, $OTFILL);
  z = TRANSPOSE(z);
  return(z);
}
%Generate $FN,  sl,             X$YT$ZT, X10,   QUICKSTOP, $ZT
%Generate ,     TRANSPOSE,      X$YT$YT, X**,   ., $YT
%Generate ,     TRANSPOSE,      X$ZT$ZT, X**,   ., $ZT
% We distinguish rank-2 from rank-3 and up reductions, because
% the former doesn't want the trailing TRANSPOSE.


%Fragment  sl1  x** bidc bidc bidc FOLD
inline $ZTYPE[+] $FNAMEFOLD($YTYPE[+] y)
{ /* first-axis reduce rank-3 or greater matrix */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : $FNslX$YT$ZTFOLD(yt[iv]);
        } : genarray(zrho, $OTFILL);
  z = TRANSPOSE(z);
  return(z);
}
%Generate $FN,  sl,             X$YT$ZT, X10,   FOLD, $ZT
%Generate ,     TRANSPOSE,      X$YT$YT, X**,   ., $YT
%Generate ,     TRANSPOSE,      X$ZT$ZT, X**,   ., $ZT

%Fragment  sl1  x** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{ /* first-axis reduce rank-3 or greater matrix */
  yt = TRANSPOSE(y);
  zrho = drop([-1], shape(yt));
  z = with {
        (. <= iv <= .)
                : $FNslX$YT$ZT(yt[iv]);
        } : genarray(zrho, $OTFILL);
  z = TRANSPOSE(z);
  return(z);
}
%Generate $FN,  sl,             X$YT$ZT, X10,   ., $ZT
%Generate ,     TRANSPOSE,      X$YT$YT, X**,   ., $YT
%Generate ,     TRANSPOSE,      X$ZT$ZT, X**,   ., $ZT

