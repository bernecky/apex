% SAC Code fragments for dyadic conjunctions, such as x +.* y
% Robert Bernecky 2007-05-08

% ALL code requires checks for length error!! rbe 2005-09-05

% For the non-trivial cases of inner product, we
% define several algorithms, roughly in order of decreasing best-case
% performance on x f.g y:
%
%       STAR:   performs z[i;]<- z[i;] f x[i;j] g y[j;]
%               This fetches each x-element exactly once, so it
%               saves type-coercion time on x. It also operates
%               in scalar-vector mode on g, stride-1, and in
%               vector-vector mode on f, also stride-1. The first
%               iteration can be peeled to initialize each row of z,
%               or z can be initialized to the identity element for f.
%  
%               Furthermore, we can use knowledge of f and g to 
%               eliminate the above iteration step any time that:
%               x[i;j] g anything
%               produces a left identity for f. E.g., in x OR.AND y,
%               if x[i;j] is zero, then:
%                 x[i;j] AND  y[j;] 
%               is all zeros, and since zero is an identity element 
%               for f (OR), then the above computation step does not
%               affect the final result, so it can be ignored.
%               This also helps plain, old PLUS.TIMES, when the left
%               argument has a lot of zeros. See Robert Bernecky's MSc
%               thesis (APEX) for more details.
%
%               A typical use would be using OR.AND to compute a 
%               transitive closure step in a Boolean graph.
%
%       STARLIKE: 
%               Same as STAR, except that if x[i;j] is an identity
%               for g, we skip the scalar-vector computation of:
%                       x[i;j] g y[j;]
%               and merely reduce y[j;] into the result:
%                       z[i;]<-z[i;] f y[j;]
%
%       QUICKSTOP0, QUICKSTOP1:
%               These algorithms are a special case of TRANSPOSE,
%               except that the vector-vector dot product of a result element
%               will stop short when one of the computations on g
%               produces a result that fixes the result of f on that
%               element. The most common example of this is:
%                       z<-x AND.EQUALS y
%               typically on text matrices. If any character x[i;k]
%               does not match its corresponding character y[k;j], 
%               then the result element z[i;k] must be zero, so 
%               further computation of that result element halts.
%               The algorithms differ only in their halting criteria
%               being zero or one. There may be room for more general
%               halting values, but I couldn't think of one in more
%               than 30 seconds of thought.
%
%       TRANSPOSE: 
%               This is the most generic case. 
%               It merely transposes the right argument before
%               performing the classical linear algebra algorithm.
%               This makes the repeated accesses to the right argument
%               stride-1 (after the transpose, anyway).
% 

%Fragment dot 000 bidc bidc bidc .
%Fragment dot 000 bidc bidc bidc STAR
%Fragment dot 000 bidc bidc bidc TRANSPOSE
inline $ZTYPE $FNAME$IPALG($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* Scalar-Scalar inner product */ 
  z =  $FRVALUE$CT$CT$GZT(to$CT(x),to$CT(y)$SYSVARGKER);
  return(z);
} 
%Generate , $FRVALUE, $CT$XT$GZT, 000, ., $CT

%Fragment dot 010 bidc bidc bidc .
%Fragment dot 010 bidc bidc bidc STAR
%Fragment dot 010 bidc bidc bidc TRANSPOSE
inline $ZTYPE $FNAME$IPALG($XTYPE x, $YTYPE[.] y$SYSVARFGDECL)
{ /* Scalar-Vector inner product */ 
  z =  $FLVALUEX$GZT$ZT$SPECRED($FRVALUE$CT$CT$GZT(to$CT(x),to$CT(y)$SYSVARGKER)$SYSVARFKER);
  return(z);
} 
%Generate , $FRVALUE, $XT$CT$GCT, 011, ., $CT
%Generate $FNM, sl,      X$GZT$ZT,   X10, $SPECRED, $GZT

%Fragment dot 100 bidc bidc bidc .
%Fragment dot 100 bidc bidc bidc STAR
%Fragment dot 100 bidc bidc bidc TRANSPOSE
inline $ZTYPE $FNAME$IPALG($XTYPE[.] x, $YTYPE y$SYSVARFGDECL)
{ /* Vector-Scalar inner product */ 
  z =  $FLVALUEX$GZT$ZT$SPECRED($FRVALUE$CT$CT$GZT(to$CT(x),to$CT(y)$SYSVARGKER)$SYSVARFKER);
  return(z);
} 
%Generate , $FRVALUE, $CT$CT$GZT, 101, ., $CT
%Generate $FNM, sl,      X$GZT$ZT,   X10, $SPECRED, $CT

%Fragment dot 110 bidc bidc bidc .
%Fragment dot 110 bidc bidc bidc STAR
%Fragment dot 110 bidc bidc bidc TRANSPOSE
inline $ZTYPE $FNAME$IPALG($XTYPE[.] x, $YTYPE[.] y$SYSVARFGDECL)
{ /* Vector-Vector inner product */ 
  z =  $FLVALUEX$GZT$ZT$SPECRED($FRVALUE$CT$CT$GZTsl(to$CT(x),to$CT(y)$SYSVARGKER)$SYSVARFKER);
  return(z);
} 
%Generate , $FRVALUE, $CT$CT$GZTsl, 111, ., $CT
%Generate $FNM, sl,      X$GZT$ZT,   X10, $SPECRED, $GZT

%Fragment dot 0** bidc bidc bidc .
%Fragment dot 0** bidc bidc bidc TRANSPOSE
inline $ZTYPE[*] $FNAME$IPALG($XTYPE x, $YTYPE[*] y$SYSVARFGDECL)
{ /* TRANSPOSE case of inner product z = scalar f.g y */
 yt = to$GCT(TRANSPOSE(y));
 xct = to$GCT(x);
 shp = drop([-1], shape(yt));
 z = with {
        (. <= iv <= .) {
                vy = yt[iv];
         } : $FNMslX$GZT$ZT$SPECRED($FRVALUE$GCT$GCT$GZTsl(xct,vy$SYSVARGKER)$SYSVARFKER);
        } : genarray(shp, $OTFILL);
 return(z);
}
%Generate ,     TRANSPOSE, X$YT$YT, X**, ., $YT
%Generate ,     $FRVALUE, $GCT$GCT$GZTsl, 011, ., $GCT
%Generate $FNM, sl,      X$GZT$ZT,   X10, $SPECRED, $GZT

%Fragment dot *0* bidc bidc bidc .
%Fragment dot *0* bidc bidc bidc STAR
%Fragment dot *0* bidc bidc bidc TRANSPOSE
inline $ZTYPE[*] $FNAME$IPALG($XTYPE[+] x, $YTYPE y$SYSVARFGDECL)
{ /* Inner product z =  f.g scalar-y */
 shp = drop([-1], shape(x));
 z = with {
        (. <= iv <= .) {
        } : $FNMslX$GZT$ZT$SPECRED($FRVALUE$GCT$GCT$GZTsl(to$GCT(x[iv]),to$GCT(y)$SYSVARGKER)$SYSVARFKER);
        } : genarray(shp, $OTFILL);
 return(z);
}
%Generate ,     $FRVALUE, $GCT$GCT$GZTsl, 101, ., $GCT
%Generate $FNM, sl,      X$GZT$ZT,   X10, $SPECRED, $GZT


%Fragment dot 1** bidc bidc bidc TRANSPOSE
inline $ZTYPE[*] $FNAME$IPALG($XTYPE[.] x, $YTYPE[*] y$SYSVARFGDECL)
{ /* TRANSPOSE case of inner product z = vector_f.g y */
 yt = to$GCT(TRANSPOSE(y));
 xct = to$GCT(x);
 /* if (1 != shape(xct)[[0]]) FIXME; length error check */
 
 shp = drop([-1],shape(xct)) ++ drop([1], shape(y));
 z = with {
        (. <= iv <= .) {
                vx = xct[take([dim(x)-1], iv)];
                vy = yt[ reverse(take([1-dim(y)], iv))];
        } : $FNMslX$GZT$ZT$SPECRED($FRVALUE$GCT$GCT$GZTsl(vx,vy$SYSVARGKER)$SYSVARFKER);
        } :genarray(shp, $OTFILL);
 return(z);
}
%Generate ,     TRANSPOSE, X$YT$YT, X**, ., $YT
%Generate ,     $FRVALUE, $GCT$GCT$GZTsl, 111, ., $GCT
%Generate $FNM, sl, X$GZT$ZT,   X10, $SPECRED, $GZT

%Fragment dot *1* bidc bidc bidc STAR
%Fragment dot *2* bidc bidc bidc STAR
inline $ZTYPE[+] $FNAME$IPALG($XTYPE[+]x, $YTYPE[+]y$SYSVARFGDECL)
{ /* CDC STAR-100 APL Algorithm for inner product */
  
 /* This computes, for z=x f.g y,
  *             z[i;] = z[i;]f x[i;j]g y[j;]
  *  Thus, it runs stride-1, and we only fetch left argument
  *  elements once. It includes skipping a g row iteration and
  *  an f row-reduce iteration when x[i;j] generates an identity for f.
  *  R. Bernecky 2005-11-24
  */
  rowsx = drop([-1],shape(x));
  colsx = shape(x)[[dim(x)-1]];
  colsy = shape(y)[[dim(y)-1]];
  Zrow = genarray([colsy],$OTFILL);
  /* Parallel over rows of x */
  z = with {
    (. <= [row] <= .) {
       Crow = Zrow;
       for (colx=0; colx<colsx; colx++) {
         xel = to$GCT((x[row, colx]));
         if (to$GCT($FGID) != xel) { /* Skip iteration if it's an identity */
/*
FIXME should have way to avoid VEC computation when it is not an identity. I.e.," TRUE || y[colx] "
*/
           VEC = $FRVALUE$GCT$GCT$GZT(xel,to$GCT(y[[colx]])$SYSVARGKER);
           Crow = $FNM$ZT$ZT$ZTsl( to$CT(VEC), Crow $SYSVARFKER);
         }
       }
     } : Crow;
  } : genarray( rowsx, Zrow);
  return(z);
}
%Generate , $FRVALUE, $GCT$GCT$GZT, 011, ., $GCT
% sl in next line is "same length", not slash!
%Generate , $FNM,        $ZT$ZT$ZTsl,  111 , ., $CT

%Fragment dot *1* bidc bidc bidc STARLIKE
%Fragment dot *2* bidc bidc bidc STARLIKE
inline $ZTYPE[+] $FNAME$IPALG($XTYPE[+]x, $YTYPE[+]y$SYSVARFGDECL)
{ /* CDC STAR-100 APL Algorithm for inner product */
 /* This computes, for z=x f.g y,
  *             z[i;] = z[i;]f x[i;j]g y[j;]
  *  Thus, it runs stride-1, and we only fetch left argument
  *  elements once. It is similar to dotSTAR, except that:
  *   1. "f" is such that we can't avoid the reduce step. 
  *   2. "x[i;j] f" is such that it may produce an identity on y[j;].
  *      If so, we don't apply f to that row.
  *  R. Bernecky 2005-11-24
  */
  rowsx = drop([-1],shape(x));
  colsx = shape(x)[[dim(x)-1]];
  colsy = shape(y)[[dim(y)-1]];
  Zrow = genarray([colsy],$OTFILL);
  /* Parallel over rows of x */
  z = with {
    (. <= [row] <= .) {
      Crow = Zrow;
      for (colx=0; colx<colsx; colx++) 
        xel = to$GCT((xrow[ row,col]));
        if (to$GCT($FGID) != xel) { /* Skip iteration if it's an identity */
          VEC = $FRVALUE$GCT$GCT$GZT(xel,to$CT(y[[colx]])$SYSVARGKER);
          Crow = $FLVALUE(VEC, Crow$SYSVARFKER);
        } else {
          Crow = $FLVALUE(to$CT(y[[colx]]), Crow$SYSVARFKER);
        }
        
      };
    } : Crow;
  }: genarray( rowsx, Zrow);
  return(z);
}
%Generate , $FRVALUE, $GCT$GCT$GZT, 011, ., $GCT
%Generate , $FLVALUE, X$GZT$GZT, 111, ., $CT


%Fragment dot *** bidc bidc bidc QUICKSTOP0
inline $ZTYPE[*] $FNAME$IPALG($XTYPE[+] x, $YTYPE[+] y$SYSVARFGDECL)
{ /* QUICKSTOP0 case of inner product z = matrix f.g matrix */
  /* The reduction quick-stops if any of its results are zero */
  /* E.g., char ^.= char */

 yt = to$GCT(TRANSPOSE(y));
 xct = to$GCT(x);
 shp = drop([-1],shape(x)) ++ drop([1], shape(y));
 z = with {
   (. <= iv <= .) {
      vx = xct[take([dim(x)-1], iv)];
      vy = yt[ reverse(take([1-dim(y)], iv))];
    } : $FNMslX$GZT$ZTQUICKSTOP($FRVALUE$GCT$GCT$GZTsl(vx,vy$SYSVARGKER)$SYSVARFKER);
 } : genarray(shp, $OTFILL);
 return(z);
}
%Generate ,     TRANSPOSE, X$YT$YT, X**, ., $YT
%Generate , $FRVALUE, $GCT$GCT$GZTsl, 111, ., $GCT
%Generate $FNM, sl,      X$GZT$ZT,   X10, QUICKSTOP, $ZT

%Fragment dot *** bidc bidc bidc TRANSPOSE
%Fragment dot *** bidc bidc bidc STAR
%Fragment dot *** bidc bidc bidc .
inline $ZTYPE[+] $FNAME$IPALG($XTYPE[+] x, $YTYPE[+] y$SYSVARFGDECL)
{ /* Generic case of inner product z = x f.g y */
 yt = to$GCT(TRANSPOSE(y));
 xct = to$GCT(x);
 shp = drop([-1],shape(x)) ++ drop([1], shape(y));
 z = with {
   (. <= iv <= .) {
     vx = xct[take([dim(x)-1], iv)];
     vy = yt[ reverse(take([1-dim(y)], iv))];
   } : $FNMslX$GZT$ZT$SPECRED($FRVALUE$GCT$GCT$GZTsl(vx,vy$SYSVARGKER)$SYSVARFKER);
 } : genarray(shp, $OTFILL);
 return(z);
}
%Generate ,     TRANSPOSE, X$YT$YT, X**, ., $YT
%Generate ,     $FRVALUE, $GCT$GCT$GZTsl, 111, ., $GCT
%Generate $FNM, sl      , X$GZT$ZT,   X10, $SPECRED, $GZT

