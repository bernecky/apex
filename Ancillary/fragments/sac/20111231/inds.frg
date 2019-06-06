% SAC Code fragments for indexed assign
% R. Bernecky 2006-01-16
% 
% All fragments are {QUAD}io=0; callers must subtract {QUAD}io from indices.

% Also, as of 2005-11-02, support for removing 1's from the shape
% vectors involved in the operation has not been implemented yet.

% Related to that is FIXME: in X[i;j;k...]<-Y, we need validation
% that the array shapes are conformable. 

% Cases of indexed assign:
% 1. x[scalar;;]<- scalar          NB. Leading axis 
% 2. x[non-scalar;;]<- scalar      NB. Leading axis
% 3. x[scalar;;]<- non-scalar      NB. Leading axis, cell shapes must match
% 4. x[non-scalar;;]<- non-scalar  NB. Leading axis,
%                                  NB.  frame and cell shapes must match
% 5. x[;scalar;;]<- scalar         NB. Non-Leading axis 
% 6. x[;non-scalar;;]<- scalar     NB. Non-Leading axis
% 7. x[;scalar;;]<- non-scalar     NB. Non-Leading axis, cell shapes must match
% 8. x[;non-scalar;;]<- non-scalar NB. Non-Leading axis,
%                                  NB.  frame and cell shapes must match
% 9. x[;;]<- scalar                NB. All elements change here
% 10.x[;;]<- y                     NB. All elements change here
%                                  NB.  frame and cell shapes must match

%Fragment inds *0* bidc bidc bidc . nonscalarX[;;nonscalarI;;]<- scalarY 
inline $ZTYPE[+] $FNAME($XTYPE[+] X, $INDICES $YTYPE Yin)
{ /* X[;;nonscalarI;;;]<- scalarY */
 $RAVELS 
 z = to$ZT(X);
 $RESH
 $FORLOOPSPROLOG
 $BODY
 $FORLOOPSEPILOG
 return(z);
}

%Fragment inds *** bidc bidc bidc . nonscalarX[;;nonscalarI;;]<- nonscalarY 
inline $ZTYPE[+] $FNAME($XTYPE[+] X, $INDICES $YTYPE[+] Y)
{ /* X[;;nonscalarI;;;]<- nonscalarY */
  /* In function name indsXXX, XXX are ranks of various Is, or x if axis elided */
 $RAVELS 
 z = to$ZT(X);
 $FORLOOPSPROLOG
 $BODY
 $FORLOOPSEPILOG
 return(z);
}

%Fragment inds *0* bidc bidc bidc AllChange. nonscalarX[;;;;]<- scalarY 
inline $ZTYPE[+] $FNAME($XTYPE[+] X, $INDICES $YTYPE Y)
{/*  Case  9. X[;...;]<- scalarY                NB. All elements change here
  *  In some interpreters, this is used as a coercion, but I'm not sure
  *  how to do that here. For example: BooleanVector[] <- 2 - 2 1 1 2 
  *  tries to keep the type of BooleanVector as Boolean. We don't even try that here.
 */
 z = genarray(shape(X), Y);
 return(z);
}

%Fragment inds *** bidc bidc bidc AllChange. nonscalarX[;;;;]<- nonscalarY 
inline $ZTYPE[+] $FNAME($XTYPE[+] X, $INDICES $YTYPE[+] Y)
{/*  Case 10. X[;...;]<- nonscalarY      NB. All elements change here
  *  In some interpreters, this is used as a coercion, but I'm not sure
  *  how to do that here. For example: BooleanVector[] <- 2 - 2 1 1 2 
  *  tries to keep the type of BooleanVector as Boolean. We don't even try that here.
  */
 if (!all (shape(X) == shape(Y))
  /* This should be a fancier check that ignores 1s in the shape vectors... */
        APEXERROR (tochar("length error"));
 return(Y);
}
