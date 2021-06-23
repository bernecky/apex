% Code fragments for monadic structural function loop structures.
% 2004-08-14
%
%Fragment tran x00  x bidc bidc .
%Fragment rotr x00  x bidc bidc .
%Fragment rot1 x00  x bidc bidc .
inline $ZTYPE $FNAME($YTYPE y)
{ /* Transpose and reverse on scalars are NOPs */ 
  return(y);
}

%Fragment coma x01 x bidc bidc .
inline $ZTYPE[.] $FNAME($YTYPE y)
{ /* Ravel of scalar */
  return([y]);
}

%Fragment comb x02 x bidc bidc .
inline $ZTYPE[1,1] $FNAME($YTYPE y)
{ /* Table of scalar */
 z = reshape([1,1],y);
 return(z);
}

%Fragment comb x12 x bidc bidc .
inline $ZTYPE[.,.] $FNAME($YTYPE[.] y)
{ /* Table on vector */
  shpz = shape(y) ++ [1];
  z = reshape(shpz, y);
  return(z);
}

%Fragment comb x22 x bidc bidc .
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ /* Table on table is NOP */
  return(y);
}

%Fragment comb x** x bidc bidc .
inline $ZTYPE[.,.] $FNAME($YTYPE[+] y)
{ /* Table on matrix */
 shpy = shape(y);
 shpz = take([1],shpy) ++ [prod(drop([1],shpy))];
 z = reshape( shpz, y);
 return(z);
}

%Fragment tran x11 x bidc bidc .
inline $ZTYPE[.] $FNAME($YTYPE[.] y)
{ /* Transpose on vectors is NOP */ 
        return(y);
}

%Fragment coma x11 x bidc bidc .
inline $ZTYPE[.] $FNAME($YTYPE[.] y)
{ /* Ravel of vector is NOP */  
        return(y);
}


%Fragment coma x*1 x bidc bidc .
inline $ZTYPE[.] $FNAME($YTYPE[+] y)
{ /* Ravel of anything with rank>1 */
  z = reshape([prod(shape(y))],y);
  return(z);
}

%Fragment rotr x11 x bidc bidc .
inline $ZTYPE[.] $FNAME($YTYPE[.] y)
{ /* Vector reverse */
  z = Array::reverse( 0, y);
  return( z);
}

%Fragment rot1 x** x bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{ /* First axis reverse on anything */
  z = Array::reverse( 0, y);
  return( z);
}

%Fragment rotr x** x bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{/* Last axis reverse on rank>1 */
  axis = _dim_A_( y) - 1;
  z = Array::reverse( axis, y);
  return( z);
}

%Fragment tran x22 x bidc bidc .
inline $ZTYPE[.,.] $FNAME($YTYPE[.,.] y)
{ /* Transpose on rank-2 */
        z = { [i,j] -> y[j,i] };
        return(z);
}

%Fragment tran x** x bidc bidc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y)
{ /* General transpose */
        z = TRANSPOSE(y);
        return(z);
}
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

