% Code fragments for dyadic structural functions
%
% Robert Bernecky 2012-01039
%
%Fragment rotr 000  bid bidc bidc .
%Fragment rot1 000  bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar rotate scalar, any axis */
 return(y);
}

%Fragment rotr 011  bid bidc bidc .
%Fragment rot1 011  bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar rotate first/last axis vector */
 ix = $XTtoI(x);
 rows = shape(y)[0];
 k = VectorRotateAmount(ix,rows); /* Normalize rotate count */
 z = drop( [k], y) ++ take( [k], y);
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 

%Fragment rot1 0**  bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar rotate first axis non-scalar */
 ix = $XTtoI(x);
 rows = shape(y)[0];
 cellshape = drop([1], shape(y));
 defcell = genarray(cellshape, $OTFILL);
 k = VectorRotateAmount(ix,rows); /* Normalize rotate count */
 z = drop( [k], y) ++ take( [k], y);
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 
   
%Fragment rotr 0**  bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar rotate matrix last axis */
 cols = shape(y)[[dim(y)-1]];
 ix = toi(x);
 k = VectorRotateAmount(ix,cols); /* Normalize rotate count */
 y2d = reshape([prod(drop([-1],shape(y))), cols], y);
 z = with {
        (. <= [i,j] <= .)
         { idx = (j+k) < cols ? (j+k) : (j+k) - cols;
         } : y2d[[ i, idx]];
        } : genarray(shape(y2d), $OTFILL);
 z = reshape(shape(y),z);       
 return (z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 

%Fragment rotr ***  bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Non-scalar rotate matrix last axis */
/* FIXME - needs validation of left rank vs right rank,
 * etc. rbe 2004-09-18 
 */
 cols = shape(y)[[dim(y)-1]];
 cell= genarray([cols],$OTFILL);
 ix = toi(x);
 k = VectorRotateAmount(ix,cols); /* Normalize rotate count */
 y2d = reshape([prod(drop([-1],shape(y))), cols], y);
 z = with {
        (. <= [i,j] <= .)
         { idx = (j+k[[i]]) < cols ? (j+k[[i]]) : (j+k[[i]]) - cols;
         } : y2d[[ i, idx]];
        } : genarray(shape(y2d), $OTFILL);
 z = reshape(shape(y),z);       
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, *0*, ., I 

%Fragment tran 100  bid bidc bidc .
$ZTYPE $FNAME($XTYPE x,  $YTYPE y)
{ /* Dyadic transpose of scalar */
  return(y);
}

%Fragment tran 1** bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, int QUADio)
{ /* General case of dyadic transpose  */
  /* Someone has to validate x here! FIXME */
  nx = $XTtoI(x) - QUADio;
  z = TRANSPOSE( nx, y);
  return( z);
}
%Generate , TRANSPOSE, I$YT$ZT,  1**, ., $CT 
