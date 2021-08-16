% Monadic and dyadic thorn formatting functions

% We don't do this yet, but should keep it in mind...
% Dyalog APL Version 18.0 Ref Man p153 says that monadic format
% has these properties:
%   1. the decimal points for floating point or scaled formats are aligned.
%   2. The E characters for scaled formats are aligned, with trailing zeros
%      added to the mantissae if necessary.
%   3. Integer formats are aligned to the left of the decimal point column,
%      if any, or right-adjusted in the field otherwise.
%   4. Each formatted column is separated from its neighbours by a single
%      blank column.
%   5. The exponent values in scaled formats are left-adjusted to remove any blanks
        and + signs.
%   6. Scaled notation is used of the magnitude of the non-integer number is too large
%      to represent with QUADpp significant digits or if the number requires more
%      than five leading zeros after the decimal point. E.g.:
%          QUADpp{<-} 5
%          thorn 123456.7
%      1.2346E5
%          thorn 0.0000001234
%      1.234E_7

% As noted in Stdlib/src/structures/ArrayFormat.xsac, the monadic format() calls
% are trustworthy, but those with multiple arguments are broken, as we have to deal
% with (a) print precision, (b) dyadic thorn left arguments, and (c) picture thorn.
% And, perhaps with ⎕fmt. 

%%%%%%%%%%%%% monadic character thorn %%%%%%%%%%%%%%%%%

%Fragment thrn X** X C C  .
inline char[*] $FNAME($YTYPE[*] y, int QUADpp)
{ /* Monadic format on characters */
  return( y);
}

%%%%%%%%%%%%% monadic Boolean thorn %%%%%%%%%%%%%%%%%

%Fragment thrn X01 X B C  .
inline char[.] $FNAME($YTYPE y, int QUADpp)
{ /* Monadic format on Boolean scalar  */
  z = y ? '1' : '0';
  return([z]);
}

%Fragment thrn X** X B C  .
inline char[+] $FNAME($YTYPE[+] y, int QUADpp)
{ /* Monadic format on Boolean non-scalars */
  // BROKEN z = format(y, QUADpp);
  z = format(y);
  return(z);
}

%%%%%%%%%%%%% monadic integer  thorn %%%%%%%%%%%%%%%%%

%Fragment thrn X01 X I C .
inline char[.] $FNAME($YTYPE y, int QUADpp)
{ /* Monadic format on integer scalar  */
  z = format(y);
 return( z);
}

%Fragment thrn  X** X I C  .
inline char[+] $FNAME($YTYPE[+] y, int QUADpp)
{ /* Monadic format on integer non-scalar */
  z = format(y);
  return(z);
}
 
%%%%%%%%%%%%% monadic double thorn %%%%%%%%%%%%%%%%%

%Fragment thrn X01 X D C  .
inline char[.] $FNAME($YTYPE y, int QUADpp)
{ /* Monadic format on double scalar  */
 // BROKEN z = format(y, QUADpp);
 z = format(y);
 return(z);
}

%Fragment thrn X** X D C .
inline char[+] $FNAME($YTYPE[+] y, int QUADpp)
{ /* Monadic format on double non-scalar */
  /* Refer to UTThorn.dws <threal> for APL model of this */
  // BROKEN z = format(y, QUADpp);
  z = format(y);
  return(z);
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Dyadic Thorn fragments %%%%%%%%%%%%%%%%%%%%%5

%Fragment thrn 101 BID BID C .
inline char[+] $FNAME($XTYPE[2] x,  $YTYPE y)
{ /* Dyadic thorn on Boolean, Integer, or double scalar */
 widths = toi(x[[0]]);
 precision = toi(x[[1]]);
 z, junk = APEXDthrn( [y], widths);
 if ( widths<shape(z)[0]) { 
        z = genarray([widths], '*');
 }
 return(z);
}
%Generate , APEXDthrn,  X$YTC, X11, ., I 

%Fragment thcharsto 110 C C I   .
inline int thcharsto(char[.] ch, char[.] fry)
{ /* Find chars left of decimal point (or end) */
 lim = (shape(fry))[0];
 z = lim;
 for(i=0; i<lim; i++) {
        if ((fry[[i]] == ch[[0]]) || (fry[[i]] == ch[[1]])) {
                z = i;
                i = lim;
        }
 }
 return(z);
}

% We should have dyadic thorn for arrays...
% with scalar, 2-element vector, and shape-of-Y-cols X argument...

