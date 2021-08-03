% Code fragments for replicate and expand
% Rewritten for SAC 2004-08-02 rbe

%Fragment sl  001 bid bidc bidc ONEEL
%Fragment sl1 001 bid bidc bidc ONEEL
%Fragment sl  001 bid bidc bidc .
%Fragment sl1 001 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ // Scalar replicate scalar
 z = genarray([toi(x)], y);
 return(z);
} 

%Fragment sl  101 b bidc bidc .
%Fragment sl1 101 b bidc bidc .
%Fragment sl  101 bid bidc bidc .
%Fragment sl1 101 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{ // Vector compress/replicate scalar
 shpz = sum(toi(x));
 z = genarray([shpz],y);
 return(z);
}

%Fragment sl  111 b bidc bidc . 
%Fragment sl1 111 b bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE[.] y)
{ // Boolean vector compress vector
  zxrho = sum(toi(x));
  z = genarray([zxrho], $OTFILL);
  zi = 0;
  for(i=0; i<shape(x)[0]; i++)
    if ( x[i]) {
      z[[zi]] = y[[i]];
      zi++;
    }
  return(z);
}

%Fragment sl  111 id bidc bidc . 
%Fragment sl1 111 id bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE[.] y)
{ // Non-Boolean vector compress/replicate vector 
  // FIXME! non-boolean left argument needs a range check
  intx = toi(x);
  zxrho = sum(intx);
  z = genarray([zxrho], $OTFILL);
  zi = 0;
  for(i=0; i<shape(x)[0]; i++)
    for(k=0; k<intx[[i]]; k++){
     z[[zi]] = y[[i]];
     zi++;
    }
  return(z);
}

%Fragment sl  011 bid bidc bidc .
%Fragment sl1 011 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{ // Scalar replicate vector
 cell = genarray([toi(x)], $OTFILL);
 z = with {
        (. <= iv <= .)
                : genarray([toi(x)], y[iv]);
        } : genarray(shape(y), cell);
 z = comaX$ZT$ZT(z);
 return(z);
}
%Generate , coma, X$ZT$ZT, X*1, ., $ZT

%Fragment sl 0** b bidc bidc ONEEL
%Fragment sl 0** b bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ // Boolean scalar compress non-scalar
  sy = shape(y);
  z = (true == toB(x)) ?  y  : genarray(drop([-1],sy)++[0],$OTFILL);
  z = genarray(
  return(z);
}       

%Fragment sl 0** id bidc bidc .
%Fragment sl 0** id bidc bidc ONEEL
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{/* Non-Boolean scalar replicate non-scalar */
 /* FIXME : domain check needed on x */
 ix = [toi(x)];
 frameshape = drop([-1],shape(y));  
 cellshape = $XTtoI( x) * take([-1], shape(y));
 defcell = genarray( cellshape, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FN$XT$YT$ZT(x, y[iv]);
        }: genarray(frameshape, defcell);
 return(z);
}
%Generate , $FN, $XT$YT$ZT, 011, ., $CT

%Fragment sl 1** bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* last-axis vector compress/replicate matrix */
  /* This needs conformability check FIXME */
  /* Also, x may be one-element vector */
 frameshape = drop([-1],shape(y));
 cellshape = sum($XTtoI( x));
 defcell = genarray([cellshape],$OTFILL);

 z = with {
   (. <= iv <= .) : $FN$XT$YT$ZT( x, y[iv]);
   } : genarray( frameshape, defcell);

return(z);
}
%Generate ,   TRANSPOSE, X$YT$ZT, X**, ., $YT
%Generate ,   $FN,  $XT$YT$ZT, 111, ., $YT

% ------------------ Code fragments for first axis replicate -----------


%Fragment sl1 0** b bidc bidc .
%Fragment sl1 0** b bidc bidc ONEEL
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Boolean scalar compress non-scalar, first axis */
  z = (true == toB(x)) ? y : genarray([0]++drop([1],shape(y)),$OTFILL);
  return(z);
}

%Fragment sl1 0** id bidc bidc .
%Fragment sl1 0** id bidc bidc ONEEL
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar replicate non-scalar, first axis */
 xi = [toi(x)];
 cellshape = xi++drop([1],shape(y));
 defcell = genarray(cellshape,$OTFILL);
 frameshape = take([1],shape(y));
 z = with {
        (. <= iv <= .)
                : genarray(xi,y[iv]);
        } : genarray(frameshape, defcell);

 zshape = [prod(take([2],shape(z)))]++drop([2],shape(z));
 z = reshape(zshape,z);
 return(z);
}

%Fragment sl1 1** bid bidc bidc ONEEL
inline $ZTYPE[+] $FNAME($XTYPE[1] x, $YTYPE[+] y)
{ // Vector[1] compress/replicate-first-axis matrix
  // FIXME: needs conformability check on x
  z = (true == toB(x[0]) ? y : genarray([0]++drop([1],shape(y)),$OTFILL);
  return(z);
}

%Fragment sl1 1** bid bidc bidc  .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* Vector compress/replicate-first-axis matrix */
  /* FIXME: needs conformability and domain checks on x */
  z = TRANSPOSE( sl$XT$YT$ZT(x, TRANSPOSE( y)));
  return(z);
}
%Generate ,   sl,  $XT$YT$ZT, 111, ., $YT

% ------------------------ Expand code fragments ----------------------

%Fragment bsl  001 bid bidc bidc ONEEL
%Fragment bsl1 001 bid bidc bidc ONEEL
%Fragment bsl  001 bid bidc bidc .
%Fragment bsl1 001 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{/* Scalar expand scalar (first or last axis) */
 /* In practice, one-element left arguments to expand
  * are nearly useless... 
  */
  z = (true == toB(x))  ?  [y]  :  [$OTFILL];
  return(z);
}

%Fragment bsl  011 bid bidc bidc ONEEL
%Fragment bsl1 011 bid bidc bidc ONEEL
%Fragment bsl  011 bid bidc bidc .
%Fragment bsl1 011 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{/* Scalar expand scalar (first or last axis) */
 /* In practice, one-element left arguments to expand
  * are nearly useless... 
  */
  z = (true == toB(x))  ?  y  :  [$OTFILL];
  return(z);
}


%Fragment bsl  101 bid bidc bidc .
%Fragment bsl1 101 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{/* Vector expand scalar (first or last axis) */
 v = [$OTFILL,y];
 z = with {
        (. <= iv <= .)
                : v[[toi(x[iv])]];
        } : genarray( shape(x), false );
 return(z);
}

%Fragment bsl 111 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE[.] y)
{ /* Vector-vector expand */
 /* Stupid with-loops won't work here. */
 /* FIXME: Needs check that (+/x)= shape(y)[0] and x^.GE 0 */
 yi=0;
 z= genarray(shape(x),$OTFILL);
 for (xi=0; xi<shape(x)[[0]]; xi++){
   if (toB(x[[xi]])) {
        z[[xi]]=y[[yi]];
        yi++;
   }
 }
 return(z);
}


%Fragment bsl 1** bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* vector expand matrix last axis */
 yt = TRANSPOSE(y);
 bx = toB(x);
 bx = (1 == shape(bx)[[0]]) ?   genarray(take([1],shape(yt)), bx[[0]]) :  bx;
 z = genarray(shape(bx)++drop([1],shape(yt)),$OTFILL);
 yi = 0;
 for(i=0; i<shape(bx)[[0]]; i++)
        if (bx[[i]]){
                z[[i]] = yt[[yi]];
                yi++;
        }
 z = TRANSPOSE(z);
 return(z);
}
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment bsl 1** bid bidc bidc  .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* vector expand matrix last axis */
 bx = toB(x);
 bx = (1 == shape(bx)[[0]])  ?   genarray(shape(yt)[[0]], bx[[0]]) : bx;
 z = with {
        (. <= iv <= .)
                : $FNAME(bx, y[iv]));
        } : genarray(drop([-1],shape(y)));
 return(z);
}
%Generate , $FN, $XT$YT$ZT, 111, ., $CT

%Fragment bsl1 1** bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* vector expand matrix first axis */
 bx = toB(x);
 bx = (1 == shape(bx)[[0]]) ?  genarray(take([1],shape(y)), bx[[0]]) : bx;
 shpz = shape(y);
 shpz[[0]] = shape(bx)[[0]];
 z = genarray(shpz,$OTFILL);
 yi = 0;
 for(i=0; i<shape(bx)[[0]]; i++)
        if (bx[[i]]){
                z[[i]] = y[[yi]];
                yi++;
        }
 return(z);
}
