% Code fragments for replicate and expand
% Rewritten for SAC 2004-08-02 rbe

% Fragment header:
%  jsymbol xyz-ranks lefttypes righttypes resulttypes specialcasename
%  1       2         3         4          5           6 

%Fragment sl  001 bid bidc bidc .
%Fragment sl1 001 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar replicate scalar */
 z = with(. <= iv <= .)
	genarray([toi(x)], y);
 return(z);
} 

%Fragment sl  101 b bidc bidc .
%Fragment sl1 101 b bidc bidc .
%Fragment sl  101 bid bidc bidc .
%Fragment sl1 101 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Vector compress/replicate scalar */
 shpz = sum(toi(x));
 z = genarray([shpz],y);
 return(z);
}

%Fragment sl  111 bid bidc bidc . 
%Fragment sl1 111 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE[.] y)
{/* vector compress/replicate vector */
 /* HELP! non-boolean left argument needs a range check */	
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

inline $ZTYPE[.] $FNAME($XTYPE[1] x, $YTYPE[.] y)
{/* 1-element-vector compress/replicate vector */
 /* HELP! non-boolean left argument needs a range check */	
 if (true == tob(x[[0]]))
        z = y;
 else
        z = genarray([0], $OTFILL);
 return(z);
}

%Fragment sl  011 bid bidc bidc .
%Fragment sl1 011 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{ /* Scalar replicate vector */
 cell = genarray([toi(x)], $OTFILL);
 z = with(. <= iv <= .)
 genarray(shape(y),
        genarray([toi(x)], y[iv]),cell);
 return(comaX$ZT$ZT(z));
}
%Generate , coma, X$ZT$ZT, X*1, ., $ZT

%Fragment sl  0** b bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar compress non-scalar */
sy = shape(y);
if (true == tob(x))
	z = y;
else 
	z = genarray(drop([-1],sy)++[0],$OTFILL);
return(z);
}	

%Fragment sl 0** id bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{/* Scalar replicate non-scalar */
 /* FIXME : domain check needed on x */
 ix = [toi(x)];
 frameshape = drop([-1],shape(y));  
 cellshape  = ix * take([-1],shape(y));
 defcell = genarray(cellshape, $OTFILL);
 z = with(. <= iv <= .)
	genarray(frameshape, $FNAME(x, y[iv]), defcell);
 return(z);
}
%Generate , $FN, $XT$YT$ZT, 011, ., $CT

%Fragment sl 1** bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* Vector compress/replicate matrix */
  /* This needs conformability check FIXME */
  /* Also, x may be one-element vector */
 yt = TRANSPOSE(y);
 frameshape = take([1],shape(yt));
 cellshape  = drop([1],shape(yt));
 defcell = genarray(cellshape,$OTFILL);
 if (1 == shape(x)[[0]])  /* THIS IS BAD. Build x[1] version */
	x = genarray(frameshape, x[[0]]);
 z = genarray([sum(toi(x))], defcell);
 zi = 0;
 for(i=0; i<shape(x)[[0]]; i++) {
	for(j = 0; j<toi(x[[i]]); j++){
        z[[zi]] = yt[[i]];
        zi++;
  }
}
return(TRANSPOSE(z));
}
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT


% ------------------ Code fragments for first axis replicate -----------


%Fragment sl1 0** b bidc bidc . 
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Boolean scalar compress non-scalar, first axis */
sy = shape(y);
if (true == tob(x))
        z = y;
else
        z = genarray([0]++drop([1],sy),$OTFILL);
return(z);
}

%Fragment sl1 0** id bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar replicate non-scalar, first axis */
 xi = [toi(x)];
 cellshape = xi++drop([1],shape(y));
 defcell = genarray(cellshape,$OTFILL);
 frameshape = take([1],shape(y));
 z = with(. <= iv <= .){
	cell = genarray(xi,y[iv]);
	} genarray(frameshape, cell,defcell);
 zshape = [prod(take([2],shape(z)))]++drop([2],shape(z));
 z = reshape(zshape,z);
 return(z);
}

%Fragment sl1 1** bid bidc bidc  .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* Vector compress/replicate-first-axis matrix */
  /* FIXME: needs conformability and domain checks on x */
 frameshape = take([1], shape(y));
 cellshape =  drop([1], shape(y));
 intx = toi(x);
 if (1 == shape(x)[[0]])
	intx = genarray(frameshape,intx[[0]]);
 zxrho = sum(intx);
 shpz = [zxrho]++cellshape;
 z = genarray(shpz,$OTFILL);
 zi = 0;
 for(i=0; i<shape(intx)[0]; i++) {
	for(j = 0; j<intx[[i]]; j++){
		z[[zi]] = y[[i]];
		zi++;
	}
 }
return(z);
}

% ------------------------ Expand code fragments ----------------------

%Fragment bsl  001 bid bidc bidc .
%Fragment bsl1 001 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{/* Scalar expand scalar (first or last axis) */
 /* In practice, one-element left arguments to expand
  * are nearly useless... 
  */
 if (true == tob(x))
	z = [y];
 else
	z = [false];
 return(z);
}

%Fragment bsl  101 bid bidc bidc .
%Fragment bsl1 101 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{/* Vector expand scalar (first or last axis) */
 v = [$OTFILL,y];
 z = with(. <= iv <= .)
        genarray(shape(x), v[[toi(x[iv])]]);
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
   if (tob(x[[xi]])){
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
 bx = tob(x);
 if (1 == shape(bx)[[0]])
	bx = genarray(take([1],shape(yt)), bx[[0]]);
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
 bx = tob(x);
 if (1 == shape(bx)[[0]])
	bx = genarray(shape(yt)[[0]], bx[[0]]);
 z = with(. <= iv <= .)
	genarray(drop([-1],shape(y)),
		$FNAME(bx, y[iv]));
%Generate , $FN, $XT$YT$ZT, 111, ., $CT
 return(z);
}

%Fragment bsl1 1** bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* vector expand matrix first axis */
 bx = tob(x);
 if (1 == shape(bx)[[0]])
	bx = genarray(take([1],shape(y)), bx[[0]]);
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
