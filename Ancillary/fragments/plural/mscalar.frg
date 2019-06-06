% Monadic Scalar Function code fragments
% Converted to SAC 2005-11-03 R. Bernecky
%
% All code fragments presume that the argument has already been
% converted to the correct compute type.
%         jsym  ranks   lt rt   zt

% IF you're seeking query, it lives in query.frg, because
% it is NOT a scalar function on parallel machines!

%Fragment mod   x00 x  b    b .
bool $FNAME($YTYPE y)
{ /* Absolute value Boolean (NOP) */
 return($YTtoB(y));
}

%Fragment mod   x00 x  id    id .
$ZTYPE $FNAME($YTYPE y)
{ return(abs($YTto$CT(y)));
}

%Fragment bar   x00 x  b    b .
$ZTYPE $FNAME($YTYPE y)
{ return(!y);
}

%Fragment bar   x00 x  id    id  .
$ZTYPE $FNAME($YTYPE y)
{ return(-y);
}

%Fragment plus  x00 x  bid  bid .
$ZTYPE $FNAME($YTYPE y)
{ return(y);
}

%Fragment min   x00 x bi bi .
$ZTYPE $FNAME($YTYPE y)
{ return(y);
}

%Fragment min   x00 x d  i .
$ZTYPE $FNAME($YTYPE y,double QUADct)
{ return(DFLOOR(y,QUADct));
}
%Generate , DFLOOR, X$YT$ZT, X00, ., $CT


%Fragment max   x00 x bi bi .
$ZTYPE $FNAME($YTYPE y)
{ /* Boolean/integer ceiling (NOP) */
  return(y);
}

%Fragment max   x00 x d  i .
$ZTYPE $FNAME($YTYPE y, double QUADct)
{ /* Ceiling */
 return(-DFLOOR(-y, QUADct));
}
%Generate , DFLOOR, X$YT$ZT, X00, ., $CT

%Fragment mpy   x00 x b  b .
$ZTYPE $FNAME($YTYPE y)
{ /* Boolean signum (NOP) */
 return(y);
}

%Fragment mpy   x00 x i i .
$ZTYPE $FNAME($YTYPE y)
{ /* signum int */
 int z;

 if (0 == $YTtoi(y)) {
   z = 0;
 } else if (0 > $YTtoi(y)) {
   z = -1;
 } else {
   z = 1;
 } 
 return(z);
}

%Fragment mpy   x00 x d i .
$ZTYPE $FNAME($YTYPE y)
{ /* double signum */
  int z;
  if (0.0 == tod(y)) {
    z = 0;
  } else if (0.0 > tod(y)) {
    z = -1;
  } else {
    z = 1;
  }
  return(z);
}

%Fragment not   x00 x bid b .
$ZTYPE $FNAME($YTYPE y)
{ /* Boolean NOT */
  return(!$YTtoB(y));
}
 
%Fragment div   x00 x bid d .
$ZTYPE $FNAME($YTYPE y)
{ return(1.0/$YTtod(y));
}

%Fragment star  x00 x bid d .
$ZTYPE $FNAME ($YTYPE y)
{ return(pow(2.718281828459046,$YTtod(y)));
}

%Fragment log   x00 x bid d .
$ZTYPE $FNAME ($YTYPE y)
{ return(log($YTtod(y)));
}

%Fragment circ  x00 x bid d .
$ZTYPE $FNAME ($YTYPE y)
{ return(3.1415926535897632*$YTtod(y));
}
