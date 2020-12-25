% Dyadic Scalar function definitions for Plural
% R. Bernecky 2012-01-29
%
% Fragment header notes:
%    % marks the beginning of each frament entry
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
% Generate notes:
%  Generate , DFLOOR, X$YT$ZT, X00, ., $CT
%           | |       |        |    |  |-- compute type for generated code
%           | |       |        |    |----- special cases (e.g., QUICKSTOP)
%           | |       |        |           dot implies NO special case
%           | |       |        |---------- X-rank, Y-rank, Z-rank
%           | |       |------------------- X-type, Y-type, Z-type
%           | |--------------------------- function name
%           |----------------------------- adverb/conj name
%                                      


%Fragment plus 000 bid bid bid .        
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return($XTto$CT(x)+$YTto$CT(y));
}

%Fragment bar 000 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return($XTto$CT(x)-$YTto$CT(y));
}

%Fragment mpy 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return( x & y);
}

%Fragment mpy 000 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return($XTto$CT(x)*$YTto$CT(y));
}

%Fragment div 000 bid bid d .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ auto dx = $XTtoD(x);
  auto dy = $YTtoD(y);
  auto z = (dx == dy) ? 1.0  : dx/dy;
  return(z);
}

%Fragment min 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return (x&y);
}

%Fragment min 000 idc idc idc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* x min y */
 return (min($XTto$CT(x),$YTto$CT(y)));
}

%Fragment max 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return (x&y);
}

%Fragment max 000 bidc bidc idc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* x max y */ 
 return (max($XTto$CT(x),$YTto$CT(y)));
}

%Fragment mod 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return((!x)&y);
}

%Fragment mod 000 bi bi bi .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* SxS residue (aka modulo) */
  /* (x residue y) <-->   y-x times floor y divide x + 0 = x  */
  $ZTYPE z;

  auto x = $XTtoI(x);
  auto y = $YTtoI(y);
  if (0 == x) {
    z = y;
  } else {
    auto q = y / x;
    z = y - ( x * q);
  }
  return(z);
} 

%Fragment mod 000 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Double residue double */
  /* This definition is taken from SHARP APL Refman May 1991, p.6-26.
   * It extends the definition of residue to fractional right arguments
   * and to zero, negative and fractional left arguments.
   * r= y-x times floor y divide x+0=x
   * See also APL model in workspace 43 UTDScalarI. 
   */
  auto nx = (0.0 == $XTto$CT(x))  ?  1.0  : $XTto$CT(x);
  auto z = $YTto$CT(y) - $XTto$CT(x) * $CTto$ZT(DFLOOR($YTto$CT(y)/nx, QUADct));
  return(z);
}
%Generate , DFLOOR, X$YT$ZT, X00, ., $CT

%Fragment star 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(x | !y);
}

%Fragment star 000 bid b bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ 
  auto z = ($YTtoB(y))  ?  $XTto$ZT(x)  : $YTto$ZT(1);
  return(z);
}

%Fragment star 000 bid i bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{  /* number to integer power */
  auto z = x;
  for( auto i=1; i< $YTtoI( y); i++) {
    z = z * x;  
  }
  return( z);
}

%Fragment star 000 bid d d .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(pow($XTtoD(x),$YTtoD(y)));
}

%Fragment log  000 bid bid d .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return(log(tod(y))/log($XTtod(x)));
}

%Fragment lt 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ return((!x)&y);
}

/* NB.  APEX Extension of ISO APL to allow comparison of characters */
/* relationals */
%Fragment lt 000 bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A<B on Boot/Int/Char */
  return($XTto$CT(x)<$YTto$CT(y));
}

%Fragment lt 000 bi bi b i 
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Boolean/Integer less than */
  return($XTto$CT(x)<=$YTto$CT(y));

%Fragment lt 000 bid bid b d
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Fuzzy less than */
  return(($XTto$CT(x)<$YTto$CT(y)) & !APEXFUZZEQ($XTto$CT(x),$YTto$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, $XT$YTB, 000, ., D

%Fragment le 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A<=B on Boolean */
  return((!x)|y);
}

%Fragment le 000 bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A<=B on Boolean,int, char */
  return($XTto$CT(x) <= $YTto$CT(y));
}

%Fragment le 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* Fuzzy <= */
  return(($XTto$CT(x)<$YTto$CT(y)) | APEXFUZZEQ($XTto$CT(x),$YTto$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment eq 000 bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A=B on non-doubles */
  return($XTto$CT(x) == $YTto$CT(y));
}

%Fragment eq 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A=B on doubles */
  return(($XTto$CT(x) == $YTto$CT(y)) || APEXFUZZEQ($XTto$CT(x),$YTto$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment ne 000 bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{/* A !=B on non-doubles */
  return($XTto$CT(x) != $YTto$CT(y));
}

%Fragment ne 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A!=B on doubles */
  return(($XTto$CT(x) != $YTto$CT(y)) && !APEXFUZZEQ($XTto$CT(x),$YTto$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment gt 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>B on non-doubles */
  return(x & !y);
}

%Fragment gt 000 bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>B on Booleans */
  return($XTto$CT(x) > $YTto$CT(y));
}

%Fragment gt 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A>B on doubles */
  return(($XTto$CT(x) > $YTto$CT(y)) && !APEXFUZZEQ($XTto$CT(x),$YTto$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment ge 000 b b b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>=B on Booleans */
  return(x | !y);
}

%Fragment ge 000 bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* A>=B on non-Doubles */
  return($XTto$CT(x) >= $YTto$CT(y));
}

%Fragment ge 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, double QUADct)
{ /* A>=B on doubles */ 
  return(($XTto$CT(x) >= $YTto$CT(y)) || APEXFUZZEQ($XTto$CT(x),$YTto$CT(y),QUADct));
}
%Generate , APEXFUZZEQ, DDB, 000, ., D

%Fragment and 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ 
  return($XTto$CT(x)&$YTto$CT(y));
}

%Fragment or 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ 
  return($XTto$CT(x)|$YTto$CT(y));
}

%Fragment nand 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ 
  return(!($XTto$CT(x)&$YTto$CT(y)));
}

%Fragment nor 000 bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ 
  return(!($XTto$CT(x)|$YTto$CT(y)));
}

%Fragment circ 000 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Circle functions */
 $ZTYPE z;

 auto xi = $XTtoI(x);
 if      (1 == xi)
        z = sin($YTtoD(y));
 else if (2 == xi)
        z = cos($YTtoD(y));
 else if (3 == xi)
        z = tan($YTtoD(y));
 else if (4 == xi)
        z = pow(1.0+($YTtoD(y)*$YTtoD(y)),0.5);
 else 
        z = 42.0; /* Should be domain error or something */
 return(z); 
}

