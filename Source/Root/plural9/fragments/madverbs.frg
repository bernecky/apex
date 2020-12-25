% Code fragments for monadic adverbs: reduce, scan, and cut.
%
% R. Bernecky 2012-01-29 Plural code generator
%
% NB. Replicate and expand are located in replicat.frg


%%%%%%%%%%%%%%%%%%%%% reduce on scalars %%%%%%%%%%%%%%%%%%%%555

%Fragment sl  x00 bidc bidc bidc .
%Fragment sl1 x00 bidc bidc bidc .
$ZTYPE $FNAME($YTYPE y)
{ /* Reduction of scalar */
  return(y);
}

%Fragment sl  x00 bidc bidc bidc QUICKSTOP 
%Fragment sl1 x00 bidc bidc bidc QUICKSTOP 
$ZTYPE $FNAMEQUICKSTOP($YTYPE y)
{ /* Reduction of scalar */
  return(y);
}

%Fragment sl  x00 bidc bidc bidc FOLD 
%Fragment sl1 x00 bidc bidc bidc FOLD 
$ZTYPE $FNAMEFOLD($YTYPE y)
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

%Fragment sl  x10 bidc bidc bidc . 
%Fragment sl1 x10 bidc bidc bidc . 
%Fragment sl  x10 bidc bidc bidc FOLD 
%Fragment sl1 x10 bidc bidc bidc FOLD 
$ZTYPE $FNAME( Parray* y)
{ /* First/last axis slow reduction of vector. 
   * Can't use fold or quickstop.
   * D reduce won't work with user-defined fns.
   */
  
  auto v = y.get$YT();
  auto z = $YTto$CT( $FRID);
  for( auto i=0; i<v.length; i++) {
    z = $FN$ZT$ZT$ZT( z, $YTto$CT( v[i]));
  }
  return(z);
}
%Generate , $FN, $ZT$ZT$ZT, 000, ., $ZT

%Fragment sl  x10 bidc bidc bidc QUICKSTOP 
%Fragment sl1 x10 bidc bidc bidc QUICKSTOP 
$ZTYPE $FNAMEQUICKSTOP( Parray* y)
{ /* First/last axis quickstop reduction of vector. 
   * We don't have quickstop yet, so just call normal reduce.
   */
  z = $FNAME( y);
  return( z);
}
%Generate  $FN,     sl, X$YT$ZT, X10, ., $ZT

%%%%%%%%%%%%%%%%%%%%% last-axis reduce on rank>1 arrays  %%%%%%%%%%%%%%%%%%%%555

%Fragment  sl  x** bidc bidc bidc QUICKSTOP
%Fragment  sl  x** bidc bidc bidc FOLD
%Fragment  sl  x** bidc bidc bidc .
$ZTYPE $FNAME(Parray * y)
{ /* last axis reduce rank-2 or greater matrix w/no smarts */
  
  auto shp = y.getShp();
  auto zshp = shp[ 0 .. shp.length-1];   /* ¯1↓⍴y */
  auto cnt = xrhoShp( zahp ); 
  auto cols = shp[ shp.length-1];
  auto val = y.get$YT();
  auto zval = $ZT[0];
  for( auto i=0; i<cnt; i++) {
    offset = i*cols;
    auto row = val[ offset .. (offset + cols)];
    auto zrow = $FN$ZT$ZT$ZT( $YTto$CT( row);
    zval = zval ~ zrow.getVal$ZT();
  }
  auto z = new Parray( zshp, zval); 
  return( z);
}
%Generate  $FN,     sl, X$YT$ZT, X10, ., $ZT
%Generate , xrhoShp, XII,     X10, ., I

%%%%%%%%%%%%%%%%%%%%% first-axis reduce on rank-2 arrays  %%%%%%%%%%%%%%%%%%

%Fragment  sl1  x21 bidc bidc bidc QUICKSTOP
$ZTYPE $FNAMEQUICKSTOP($YTYPE y)
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
$ZTYPE $FNAMEFOLD($YTYPE y)
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
$ZTYPE $FNAME($YTYPE y)
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
$ZTYPE $FNAMEQUICKSTOP($YTYPE y)
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
$ZTYPE $FNAMEFOLD($YTYPE y)
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
$ZTYPE $FNAME($YTYPE y)
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

