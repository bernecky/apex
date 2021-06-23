/*
 * Monadic miscfns
 * Will eventually handle:
 *      shape, index generator, matrix inverse,
 *      dex, nubsieve, thorn
 * Robert Bernecky 2007-05-13
xxx
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

%Fragment rho x** x bidc i .
inline int[.]  $FNAME($YTYPE[+] y) 
{ /* Shape of non-scalar */
 return(shape(y));
}

%Fragment quad x** x bidc bidc .
inline $ZTYPE[*] $FNAME($YTYPE[*] y, int QUADpp, int QUADpw)
{ /* {quad}{<-} anything */
        show(y);
        return(y);
}
