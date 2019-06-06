% Dyadic Scalar function definitions 
% R. Bernecky 2006-01-05
%
% Header notes:
%    percentFragment  marks the beginning of each entry
%    Fields are delimited by blanks.
%    Field 1: primitive function jsymbol
%    Field 2: acceptable left argument types
%    Field 3: acceptable right argument types
%    Field 4: Result type for fragment
%    Field 5: ifergit
%
% Header ordering may be critical in the case where two 
% fragments would both work. This is important in epio, for
% example, where a special case (e.g., charvec iota charvec)
% must be chosen in preference to the general case. 
% Or, here, where we can use a fast Boolean-mod-Boolean, rather
% than general mod code.
%
%Fragment plus 000 bid bid bid .	
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(to$CT(x)+to$CT(y));
}

%Fragment bar 000 bid bid bid .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(to$CT(x)-to$CT(y));
}

%Fragment mpy 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(tob(x) & tob(y));
}

%Fragment mpy 000 bid bid bid .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(to$CT(x)*to$CT(y));
}

%Fragment div 000 bid bid d .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ dx = tod(x);
  dy = tod(y);
 if (dx == dy) 
	z = 1.0d;
  else 
	z = dx/dy;
  return(z);
}

%Fragment min 000 b b b	.
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return (x&y);
}

%Fragment min 000 idc idc idc .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* x min y */
 return (min(to$CT(x),to$CT(y)));
}

%Fragment max 000 b b b	.
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return (x&y);
}

%Fragment max 000 bidc bidc idc	.
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* x max y */ 
 return (max(to$CT(x),to$CT(y)));
}

%Fragment mod 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return((!x)&y);
}

%Fragment mod 000 bi bi bi .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* SxS residue (aka modulo) */
  /* This definition is taken from SHARP APL Refman May 1991, p.6-26.
   * It extends the definition of residue to fractional right arguments
   * and to zero, negative and fractional left arguments.
   * r= y-x times floor y divide x+0=x
   * See also APL model in workspace 43 UTDScalarI. 
   */
 xi = toi(x);
 yi = toi(y);
 if (0 != xi){
  q = yi/xi;
  z = yi-(xi*q);
 }
 else
  z = yi;
  nx = xi < 0;
  ny = yi < 0;
 if ((0 != z) && (nx != ny))
  z = z + xi;
 return(z);
} 

%Fragment mod 000 bid bid bid .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Double residue double */
  /* See Iresidue for definition */
  if (0.0 == to$CT(x))
        nx = 1.0;
  else
        nx = to$CT(x);
  z = to$CT(y) - to$CT(x) * tod(DFLOOR(to$CT(y)/nx, QUADct));
  return(z);
}
%Generate , DFLOOR, X$YT$ZT, X00, ., $CT

%Fragment star 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(x | !y);
}

%Fragment star 000 bid b bid .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ if (tob(y))
	z = to$ZT(x);
 else
	z = to$ZT(1);
 return(z);
}

%Fragment star 000 bid bid d .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(pow(tod(x),tod(y)));
}

%Fragment log  000 bid bid d .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(log(tod(y))/log(tod(x)));
}

%Fragment lt 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return((!x)&y);
}

/* NB.  APEX Extension of ISO APL to allow comparison of characters */
/* relationals */
%Fragment lt 000 bic bic b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A<B on Boot/Int/Char */
  return(to$CT(x)<to$CT(y));
}

%Fragment lt 000 bi bi b i 
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Boolean/Integer less than */
 return(to$CT(x)<=to$CT(y));

%Fragment lt 000 bid bid b d
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Fuzzy less than */
 return((to$CT(x)<to$CT(y)) & !APEXFUZZEQ(to$CT(x),to$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, $XT$YTB, 000, ., D

%Fragment le 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A<=B on Boolean */
 return((!x)|y);
}

%Fragment le 000 bic bic b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A<=B on Boolean,int, char */
 return(to$CT(x) <= to$CT(y));
}

%Fragment le 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Fuzzy <= */
 return((to$CT(x)<to$CT(y)) | APEXFUZZEQ(to$CT(x),to$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment eq 000 bic bic b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A=B on non-doubles */
 return(to$CT(x) == to$CT(y));
}

%Fragment eq 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A=B on doubles */
 return((to$CT(x) == to$CT(y)) || APEXFUZZEQ(to$CT(x),to$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment ne 000 bic bic b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{/* A !=B on non-doubles */
 return(to$CT(x) != to$CT(y));
}

%Fragment ne 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A!=B on doubles */
 return((to$CT(x) != to$CT(y)) && !APEXFUZZEQ(to$CT(x),to$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment gt 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>B on non-doubles */
 return(x & !y);
}

%Fragment gt 000 bic bic b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>B on Booleans */
 return(to$CT(x) > to$CT(y));
}

%Fragment gt 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A>B on doubles */
 return((to$CT(x) > to$CT(y)) && !APEXFUZZEQ(to$CT(x),to$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment ge 000 b b b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>=B on Booleans */
 return(x | !y);
}

%Fragment ge 000 bic bic b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>=B on non-Doubles */
 return(to$CT(x) >= to$CT(y));
}

%Fragment ge 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A>=B on doubles */ 
 return((to$CT(x) >= to$CT(y)) || APEXFUZZEQ(to$CT(x),to$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment and 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(tob(x)&tob(y));
}

%Fragment or 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(tob(x)|tob(y));
}

%Fragment nand 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(!(to$CT(x)&to$CT(y)));
}

%Fragment nor 000 bid bid b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(!(to$CT(x)|to$CT(y)));
}

%Fragment circ 000 bid bid bid .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Circle functions */
 xi = toi(x);
 if	 (1 == xi)
	z = sin(toD(y));
 else if (2 == xi)
	z = cos(toD(y));
 else if (3 == xi)
	z = tan(toD(y));
 else if (4 == xi)
	z = pow(1.0+(toD(y)*toD(y)),0.5);
 else 
	z = 42.0; /* Should be domain error or something */
 return(z); 
}

