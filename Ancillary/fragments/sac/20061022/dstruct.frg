% Code fragments for dyadic structural functions
%
% Robert Bernecky 2005-12-03
% SAC backend. Uses SAC-like rank specification 2004-09-18
%
%Fragment rotr 000  bid bidc bidc .
%Fragment rot1 000  bid bidc bidc .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar rotate scalar, any axis */
 return(y);
}


%Fragment rot1 0**  bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar rotate first axis non-scalar */
 ix = toi(x);
 k = VectorRotateAmount(ix,shape(y)[[0]]); /* Normalize rot count */
 if ( 0 == k) {
	z = y;
 } else { 
	z = drop([k],y)++take([k],y);
 }
 return(z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 
   
%Fragment rotr 0**  bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar rotate matrix last axis */
 ix = toi(x);
 k = VectorRotateAmount(ix,shape(y)[[dim(y)-1]]); /* Normalize rot count */
 /* Stupid sac rotate primitive goes in wrong direction */
 z = rotate(dim(y)-1, -k, y);
 return (z);
}
%Generate , VECTORROTATEAMOUNT, III, 000, ., I 

%Fragment rotr ***  bid bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE [+] x, $YTYPE[+] y)
{ /* Non-scalar rotate matrix last axis */
/* FIXME - needs validation of left rank vs right rank,
 * etc. rbe 2004-09-18 
 */
 cell= genarray([shape(y)[[dim(y)-1]]],$OTFILL);
 z = with (. <= iv <= .) 
	genarray(shape(x),
 	/* Stupid sac rotate primitive goes in wrong direction */
	rotate([-toi(x[iv])], y[iv]), cell);		
 return(z);
}

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
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[*] y)
{ /* General case of dyadic transpose  */
/* Someone has to validate x here! FIXME */
 shpy = shape(y);
 wts = drop([1],shpy)++[1];
 rankz = -1;
 for(i=shape(shpy)[[0]]-2; i>=0; i--){ /* times scan the hard way */
  wts[[i]] = wts[[i+1]]*wts[[i]];
  rankz = max(rankz,x[[i]]);
 }
 shpz = genarray([1+rankz],-1); 
 weights = genarray([1+rankz],0);
 for(i=dim(y)-1; i>=0; i--){
	shpz[[x[[i]]]] = shpy[[i]];
	weights[[x[[i]]]] = weights[[x[[i]]]]+wts[[i]];
 }

 cp = CartProdPlus(weights, shpz);
 ry = comaX$YT$ZT(y);
 z = with(. <= iv <= .)
	genarray(shape(cp), ry[[cp[iv]]],$OTFILL);
 z = reshape(shpz,z);
 return(z);
}

inline int[.] CartProdPlus(int[.] weights, int[.] lengths)
{ /* Cartesian product, sum-like, for weights+each iota each lengths */
  /* Weight and length vectors must be same length, and non-empty */
 s = shape(weights)[[0]];
 if (0 == s)
  z = s;
 else
  z = weights[[0]] * iotaXII(lengths[[0]],0);
  for(i=1; i<s; i++){
   t = weights[[i]] * iotaXII(lengths[[i]],0);
   z = with(. <= iv <= .)
	genarray(shape(z),z[iv] + t,t);
   z = comaXII(z);
  }
 return(z);
}
%Generate , iota, XII, X01, ., I
%Generate , coma, X$YT$YT, X*1, ., $CT 
%Generate , coma, XII, X*1, ., I 
