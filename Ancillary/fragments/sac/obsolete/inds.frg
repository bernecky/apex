% SAC Code fragments for indexed assign
% R. Bernecky 2005-11-29
% All fragments are {QUAD}io=0; callers must subtract {QUAD}io from indices.
% Also, as of 2005-11-02, support for removing 1's from the shape
% vectors involved in the operation has not been implemented yet.
% Related to that is FIXME: in X[i;j;k...]<-Y, we need validation
% that the array shapes are conformable. 

%Fragment inds 100           Vector[scalar]<-scalar
inline $ZTYPE[.] indsfr0(int i, $XTYPE[.] X, $YTYPE Y)
{ /* Indexed Assign   V[S] <- S */
 z=X; 
 z[i]= to$ZT(Y);
 return(z);
}

%Fragment inds 1x0           Vector[]<-scalar
inline $ZTYPE[.] indsfr0(int[0] i, $XTYPE[.] X, $YTYPE Y)
{ /* Indexed Assign   V[] <- S */
 z = genarray(_shape_(X),Y);
 return(z);
}

%Fragment inds 1x1           Vector[]<-vector
inline $ZTYPE indsfr0(int[0] i, $XTYPE[.] X, $YTYPE[.] Y)
{ /* Indexed Assign  V[] <- V */
/* FIXME: Need length check on vectors here */
 if (1 = (_shape_(Y)[0])
 	z = genarray(_shape_(X),Y[0]);
 else
 if ((_shape_(X)[0] = _shape_(Y)[0]]) /* Conformable */
	z = Y;
 else
	z = Y; /* SIGNAL ERROR HERE!!! FIXME */
return(Z);
}

%Fragment inds 1x2           Vector[]<-matrix
inline $ZTYPE indsfr0(int[0] i, $XTYPE[.] X, $YTYPE Y)
{ /* Indexed Assign:  V[] <- Matrix */
/* FIXME: conformability checks needed */
/* This is case of v[]<- (1 1 1 ,rho(v))rho 42 */
UNDER CONSTRUCTION
}

%Fragment inds ***          X[;;i;;...] <- Y 
inline $ZTYPE[+] indsfr(int fr, int[*] i, $XTYPE[+] X, $YTYPE[+] Y)
{ /* X[;;;i;;;]<- nonscalar Y, where i has fr semicolons to its left */
 cellshape = _shape_(i)++_drop_SxV_(fr+1,_shape_(X));
 cell = genarray(cellshape,$OTFILL); /* not used, but SAC needs help */
 frameshape = _take_SxV_(fr,_shape_(X)); 
 z = with (. <= iv <= .)
	genarray(frameshape,indsfr0(i,X[iv], Y[iv]),cell);
 zshape = frameshape++cellshape;
 return(_reshape_(zshape,z));
}
 
% 2005-11-29 anything above here is likely useless, as it
% never gets generated. rbe
% I think we have 8 cases of indexed assign:
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




inline $ZTYPE[+] indsfr(int fr, int[*] i, $XTYPE[+] X, $YTYPE Y)
{ /* X[;;;i;;;]<- scalar Y, where i has fr semicolons to its left */
 cellshape = _shape_(X);
 cell = genarray(cellshape,$OTFILL); /* not used, but SAC needs help */
 frameshape = _take_SxV_(fr,_shape_(X)); 
 z = with (. <= iv <= .)
	genarray(frameshape,indsfr0(i,X[iv], Y),cell);
 zshape = frameshape++cellshape;
 return(_reshape_(zshape,z));
}

inline $ZTYPE[+] indsfr(int fr, int i, $XTYPE[+] X, $YTYPE Y)
{ /* X[;;;i;;;]<- scalar Y, where i has fr semicolons to its left */
 cellshape = _shape_(X);
 cell = genarray(cellshape,$OTFILL); 
 frameshape = _take_SxV_(fr,_shape_(X)); 
 z = with (. <= iv <= .)
	genarray(frameshape,indsfr0(i,X[iv], Y),cell);
 zshape = frameshape++cellshape;
 return(_reshape_(zshape,z));
}

inline $ZTYPE[+] indsfr0(int i, $XTYPE[+] X, $YTYPE Y)
{ /* Case 1. X[scalarI;;]<- scalarY          NB. Leading axis  */
 cell = genarray(_drop_SxV_(1,_shape_(X)),to$ZT(Y));
 z = to$ZT(X);
 z[[i]] = cell;
 return(z);
}

inline $ZTYPE[+] indsfr0(int i, $XTYPE[+] X, $YTYPE[*] Y)
{ /* X[i;;;] <- Y    i is scalar; Y is non-scalar */
 z = to$ZT(X);
 z[[i]] = to$ZT(Y);
 return(z);
}

inline $ZTYPE[+] indsfr0(int[.] iv, $XTYPE[+] X, $YTYPE Y)
{ /* 2. X[non-scalarIV;;]<- scalarY      NB. Leading axis */
 z = to$ZT(X);
 y2 = to$ZT(Y);
 /* I am puzzled as to why we don't need FOR loops more places
    here. I think we do, but the bugs have not appeared yet...
    rbe 2005-11-21
  */

 for(i=0; i<_shape_(iv)[0]; i++)
   z[[i]] = y2;
 return(z);
}

inline $ZTYPE[+] indsfr0(int[+] i, $XTYPE[+] X, $YTYPE[+] Y)
{ /* X[im;;;] <- Y      im is array */
 cellshape = _drop_SxV_(1,_shape_(X));
 cell = genarray(cellshape, $OTFILL);
 raveli = APEXRAVEL(i);
 z = with (. <= iv <= .)
	genarray(_shape_(i), 
		modarray(X,i[iv],to$ZT(Y[i[iv]])),cell);
 return(z);
}

