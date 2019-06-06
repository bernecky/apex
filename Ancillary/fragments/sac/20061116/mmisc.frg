/*
 * Monadic miscfns
 * Will eventually handle:
 * 	shape, index generator, matrix inverse,
 * 	dex, nubsieve, thorn
 * Robert Bernecky 2005-10-12
 */

%Fragment iota x01 x bidc i .
inline int[.] $FNAME($YTYPE y, int QUADio)
{ /* Index generator on scalar */
/* HELP! Needs domain check for negative shp */
  z = QUADio+iota(toi(y));
  return( z);
}

%Fragment iota x01 x bidc i NonNeg
inline int[.] $FNAMENonNeg($YTYPE y, int QUADio)
{ /* Index generator on ScalarN when N is non-negative integer */
  z = QUADio+iota(toi(y));
  return( z);
}

%Fragment iota x11 x bidc i .
inline int[.] $FNAME($YTYPE[1] y, int QUADio)
{ /* Index generator on 1-element vector */
 /* HELP! Needs length error check */
/* HELP! Needs domain check for negative shp */
  z = QUADio+iota(toi(y[[0]]));
  return( z);
}

%Fragment iota x11 x bidc i NonNeg
inline int[.] $FNAMENonNeg($YTYPE[1] y, int QUADio)
{ /* Index generator on 1-element vector, known to be non-negative integer */
  z = QUADio+iota(toi(y[[0]]));
  return( z);
}

%Fragment ltak *** x bidc bidc .
inline $YTYPE[*] $FNAME($YTYPE[*] y) 
{ /* Dex on anything */
	return(y);
}

%Fragment rho x01 x bidc i . 
inline int[0] $FNAME($YTYPE y) 
{ /* Shape of scalar */
 return(shape(y));
}

%Fragment rho x11 x bidc i .
inline int[1]  $FNAME($YTYPE[.] y) 
{ /* Shape of vector */
 return(shape(y));
}

%Fragment rho x21 x bidc i .
inline int[2]  $FNAME($YTYPE[.,.] y) 
{ /* Shape of matrix (rank-2) */
 return(shape(y));
}

%Fragment rho x*1 x bidc i .
inline int[.]  $FNAME($YTYPE[+] y) 
{ /* Shape of rank-3 or higher */
 return(shape(y));
}

%Fragment quad x00 x idc idc .
inline $ZTYPE $FNAME($YTYPE y, int QUADpp, int QUADpw)
{ /* {quad}{<-} scalar anything except boolean*/
	print([y]);
	return(y);
}

%Fragment quad x** x idc idc .
inline $ZTYPE[+] $FNAME($YTYPE[+] y, int QUADpp, int QUADpw)
{ /* {quad}{<-} non-scalar anything except boolean*/
	print(y);
	return(y);
}

%Fragment quad x00 x b b .
inline $ZTYPE $FNAME($YTYPE y, int QUADpp, int QUADpw)
{ /* {quad}{<-} boolean scalar */
	print(toi([y])); /* KLUDGE!!! print/display do not support booleans! */
	return(y);
}

%Fragment quad x** x b b .
inline $ZTYPE[+] $FNAME($YTYPE[+] y, int QUADpp, int QUADpw)
{ /* {quad}{<-} boolean non-scalar */
	print(toi(y)); 
	return(y);
}
