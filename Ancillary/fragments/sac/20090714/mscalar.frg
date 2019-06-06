% Monadic Scalar Function code fragments
% Converted to SAC 2005-11-03 R. Bernecky
%
% All code fragments presume that the argument has already been
% converted to the correct compute type.
%         jsym  ranks	lt rt   zt

% IF you're seeking query, it lives in query.frg, because
% it is NOT a scalar function on parallel machines!

%Fragment mod   x00 x  b    b .
inline bool $FNAME($YTYPE y)
{ /* Absolute value Boolean (NOP) */
 return(tob(y));
}

%Fragment mod   x00 x  id    id .
inline $ZTYPE $FNAME($YTYPE y)
{ return(abs(to$CT(y)));
}

%Fragment bar   x00 x  b    b .
inline $ZTYPE $FNAME($YTYPE y)
{ return(!y);
}

%Fragment bar   x00 x  id    id	 .
inline $ZTYPE $FNAME($YTYPE y)
{ return(-y);
}

%Fragment plus  x00 x  bid  bid .
inline $ZTYPE $FNAME($YTYPE y)
{ return(y);
}

%Fragment min   x00 x bi bi .
inline $ZTYPE $FNAME($YTYPE y)
{ return(y);
}

%Fragment min   x00 x d  i .
inline $ZTYPE $FNAME($YTYPE y,double QUADct)
{ return(DFLOOR(y,QUADct));
}
%Generate , DFLOOR, X$YT$ZT, X00, ., $CT


%Fragment max   x00 x bi bi .
inline $ZTYPE $FNAME($YTYPE y)
{ /* Boolean/integer ceiling (NOP) */
  return(y);
}

%Fragment max   x00 x d  i .
inline $ZTYPE $FNAME($YTYPE y, double QUADct)
{ /* Ceiling */
 return(-DFLOOR(-y, QUADct));
}
%Generate , DFLOOR, X$YT$ZT, X00, ., $CT

%Fragment mpy   x00 x b  b .
inline $ZTYPE $FNAME($YTYPE y)
{ /* Boolean signum (NOP) */
 return(y);
}

%Fragment mpy   x00 x i i .
inline $ZTYPE $FNAME($YTYPE y)
{ /* signum int */
 if (0 == toi(y)) {
   z = 0;
 } else if (0 > toi(y)) {
   z = -1;
 } else {
   z = 1;
 } 
 return(z);
}

%Fragment mpy   x00 x d i .
inline $ZTYPE $FNAME($YTYPE y)
{ /* double signum */
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
inline $ZTYPE $FNAME($YTYPE y)
{ /* Boolean NOT */
  return(!tob(y));
}
 
%Fragment div   x00 x bid d .
inline $ZTYPE $FNAME($YTYPE y)
{ return(1.0/tod(y));
}

%Fragment star  x00 x bid d .
inline $ZTYPE $FNAME ($YTYPE y)
{ return(pow(2.718281828459046,tod(y)));
}

%Fragment log   x00 x bid d .
inline $ZTYPE $FNAME ($YTYPE y)
{ return(log(tod(y)));
}

%Fragment circ  x00 x bid d .
inline $ZTYPE $FNAME ($YTYPE y)
{ return(3.1415926535897632*tod(y));
}
