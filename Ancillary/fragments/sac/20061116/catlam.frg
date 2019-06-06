% Catenate code fragments
% Robert Bernecky 2005-11-29
% SAC code generator
%
% Fragment header:  jsymbol ranks(x,y,z) nil nil nil comments
% * in rank specifier means any rank>1


%Fragment coma 001 bidc bidc bidc .
%Fragment comb 001 bidc bidc bidc .
inline $ZTYPE[2] $FNAME($XTYPE x, $YTYPE y)
{/* SxS catenate first (or last) axis */
 return([to$CT(x)]++[to$CT(y)]);
}

%Fragment coma 011 bidc bidc bidc .
%Fragment comb 011 bidc bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{/* SxV catenate first (or last) axis */
 return([to$CT(x)]++to$CT(y));
}

%Fragment coma 101 bidc bidc bidc .
%Fragment comb 101 bidc bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{/* VxS catenate first (or last) axis */
 return(to$CT(x)++[to$CT(y)]);
}

%Fragment coma 111 bidc bidc bidc .
%Fragment comb 111 bidc bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE[.] y)
{ /* VxV catenate first or last axis */
 return(to$CT(x)++to$CT(y));
}

%Fragment comb 1** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{/* V,A first axis catenate */
 z = reshape([1]++shape(x),x); /* Make one-row matrix */
 return(to$CT(z)++to$CT(y));
}

%Fragment comb *1* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[.] y)
{/* A,V first axis catenate */
 z = reshape([1]++shape(y),y); /* Make one-row matrix */
 return(to$CT(x)++to$CT(z));
}

%Fragment coma 0** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* S,A last-axis catenate */
 frame = drop([-1],shape(y));
 cell = genarray([1+shape(y)[dim(y)-1]],$OTFILL);
 z = with(. <= iv <= .)
	genarray(frame, [to$CT(x)]++to$CT(y[iv]),cell);
 return(z);
} 

%Fragment coma *0* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE y)
{ /* A,S last-axis catenate */
 frame = drop([-1],shape(x));
 cell = genarray([1+shape(x)[dim(x)-1]],$OTFILL);
 z = with(. <= iv <= .)
	genarray(frame, to$CT(x[iv])++[to$CT(y)],cell);
 return(z);
} 


%Fragment coma 1** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* V,A last-axis catenate */
 z=TRANSPOSE(to$CT(x)++TRANSPOSE(to$CT(y)));
 return(z);
} 
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment coma *1* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[+] y)
{ /* A,V last-axis catenate */
 z=TRANSPOSE(TRANSPOSE(to$CT(x))++to$CT(y));
 return(z);
} 
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment coma *** bidc bidc bidc LG
inline $ZTYPE[+] $FNLG$XT$YT$ZT($XTYPE[+] x, $YTYPE[+] y)
{/* A,A last axis catenate. Left rank greater */
 frameshape = drop([-1],shape(x));
 cellshape  = take([-1],shape(x)) + [1];
 cell = genarray(cellshape, $OTFILL);
 z = with (. <= iv <= .)
	genarray(frameshape, x[iv]++[y[iv]], cell);
 return(z);
}

%Fragment coma *** bidc bidc bidc RG
inline $ZTYPE[+] $FNRG$XT$YT$ZT($XTYPE[+] x, $YTYPE[+] y)
{/* A,A last axis catenate. Right rank greater */
 frameshape = drop([-1],shape(y));
 cellshape  = take([-1],shape(y)) + [1];
 cell = genarray(cellshape, $OTFILL);
 z = with (. <= iv <= .)
	genarray(frameshape, [x[iv]]++y[iv], cell);
 return(z);
}

%Fragment coma *** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[+] y)
{/* A,A last axis catenate. Ranks match */
 cellshape = (take([-1],shape(x)))+take([-1],shape(y));
 cell = genarray(cellshape, $OTFILL);
 z = with (. <= iv <= .)
	genarray(drop([-1], shape(x)),
		to$CT(x[iv])++to$CT(y[iv]), cell);
 return(z);
}

%%%%%%%%%%%%%%%%%%%%%%%%% first axis catenate %%%%%%%%%%%%%%%%%

%Fragment comb 0** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* S,A first-axis catenate */
  cell = genarray([1]++drop([1],shape(y)),to$CT(x));
  return(cell++to$CT(y));
}

%Fragment comb *0* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE y)
{ /* A,S first-axis catenate */
  cell = genarray([1]++drop([1],shape(x)),to$CT(y));
  return(to$CT(x)++cell);
}

%Fragment comb *** bidc bidc bidc LG
inline $ZTYPE[+] $FNLG$XT$YT$ZT($XTYPE[+] x, $YTYPE[+] y)
{/* A,A first axis catenate. Left rank greater */
 ny = reshape([1]++shape(y),y);
 return(to$CT(x)++to$CT(ny));
}
%Fragment comb *** bidc bidc bidc RG
inline $ZTYPE[+] $FNRG$XT$YT$ZT($XTYPE[+] x, $YTYPE[+] y)
{/* A,A first axis catenate. Right rank greater */
 nx = reshape([1]++shape(x),x);
 return(to$CT(nx)++to$CT(y));
}
%Fragment comb *** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[+] y)
{/* A,A first axis catenate. Ranks match */
 return(to$CT(x)++to$CT(y));
}

