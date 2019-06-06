% Code fragments for dyadic structural functions
%
% Robert Bernecky 2005-12-03
%
%Fragment rotr 000  bid bidc bidc .
%Fragment rot1 000  bid bidc bidc .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar rotate scalar, any axis */
 return(y);
}

%Fragment rotr 011  bid bidc bidc .
%Fragment rot1 011  bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar rotate first/last axis vector */
 ix = toi(x);
 rows = shape(y)[0];
 k = VectorRotateAmount(ix,rows); /* Normalize rotate count */
 z = with {
	 (. <= [i] <= .)
	 { idx = (i+k) < rows ? (i+k) : (i+k) - rows;
	 } : y[[idx]];
	} : genarray([rows], $OTFILL);
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 



%Fragment rot1 0**  bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar rotate first axis non-scalar */
 ix = toi(x);
 rows = shape(y)[0];
 cellshape = drop([1], shape(y));
 defcell = genarray(cellshape, $OTFILL);
 k = VectorRotateAmount(ix,rows); /* Normalize rotate count */
 z = with {
	(. <= [i] <= .)
	 { idx = (i+k) < rows ? (i+k) : (i+k) - rows;
	 } : y[[idx]];
	} : genarray([rows], defcell);
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 
   
%Fragment rotr 0**  bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
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
inline $ZTYPE[+] $FNAME($XTYPE [+] x, $YTYPE[+] y)
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
inline $ZTYPE $FNAME($XTYPE[0] x,  $YTYPE y)
{ /* Dyadic transpose of scalar */
  return(y);
}

%Fragment tran 111  bid bidc bidc .
inline $ZTYPE $FNAME($XTYPE[1] x, $YTYPE y)
/* Left argument must be index origin */
/* FIXME */
{ /* dyadic tranpose of vector */
 return(y);
}

%Fragment tran 122 bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[2] x, $YTYPE[.,.] y)
{ /* Vector (no dups!) transpose rank-2 matrix */
 ix=toi(x);
 if ((0 == x[[0]]) && (1 == x[[1]]))
	z = y;
 else if ((1 == x[[0]]) && (0 == x[[1]]))
	z = TRANSPOSE(y);
 else 
	z= (reshape(shape(y)/0,y); /* Domain error */
 return(z);
}
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment tran 1** bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[*] y, int QUADio)
{ /* General case of dyadic transpose  */
/* Someone has to validate x here! FIXME */
 nx = toi(x) - QUADio;
 shpy = shape(y);
 wts = drop([1],shpy)++[1];
 rankz = -1;

 /* times scan the hard way */
 for(i=shape(shpy)[0] - 2; i>=0; i--) { 
  wts[i] = wts[i+1]*wts[i];
  rankz = max(rankz,nx[i]);
 }
 rankz = rankz + 1;

 shpz = genarray([rankz], 1 + prod(shape(y)));  /* all overwritten */
 cwts = shpz * 0;

 for(i=dim(y)-1; i>=0; i--){
        j = nx[i];
	shpz[j] = min( shpy[i], shpz[j]);
	cwts[j] = cwts[j]+wts[i];
 }

 cp = CartProdPlus(cwts, shpz);
 ry = comaX$YT$ZT(y);
 z = with {
	(. <= iv <= .)
		: ry[[cp[iv]]];
	} : genarray(shape(cp), $OTFILL);
 z = reshape(shpz,z);
 return(z);
}

inline int[.] CartProdPlus(int[.] weights, int[.] lengths)
{ /* Cartesian product, sum-like, for weights+each iota each lengths */
  /* Weight and length vectors must be same length, and non-empty */
 s = shape(weights)[[0]];
 z = (0 == s) ?  s :  weights[[0]] * iotaXII(lengths[[0]],0);
  for(i=1; i<s; i++){
   t = weights[[i]] * iotaXII(lengths[[i]],0);
   z = with {
	(. <= iv <= .)
		: z[iv] + t;
	} : genarray(shape(z), t);
   z = comaXII(z);
  }
 return(z);
}
%Generate , iota, XII, X01, ., I
%Generate , coma, X$YT$YT, X*1, ., $CT 
%Generate , coma, XII, X*1, ., I 
