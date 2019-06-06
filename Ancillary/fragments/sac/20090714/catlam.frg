% Catenate code fragments
% Robert Bernecky 2007-05-14
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
{/* VxA first axis catenate */
 return(to$CT([x])++to$CT(y));
}

%Fragment comb *1* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[.] y)
{/* AxV first axis catenate */
 return(to$CT(x)++to$CT([y]));
}

%Fragment coma 0** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* S,A last-axis catenate */
 frame = drop([-1],shape(y));
 cell = genarray([1+shape(y)[dim(y)-1]],$OTFILL);
 z = with {
	(. <= iv <= .)
		: [to$CT(x)]++to$CT(y[iv]);
	}: genarray ( frame, cell);
 return(z);
} 

%Fragment coma *0* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE y)
{ /* A,S last-axis catenate */
 frame = drop([-1],shape(x));
 cell = genarray([1+shape(x)[dim(x)-1]],$OTFILL);
 z = with { 
	(. <= iv <= .)
		: to$CT(x[iv])++[to$CT(y)];
	}: genarray(frame, cell);
 return(z);
} 


%Fragment coma 1** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* VxA last-axis catenate */
 z=TRANSPOSE(to$CT([x])++TRANSPOSE(to$CT(y)));
 return(z);
} 
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment coma *1* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[.] y)
{ /* AxV last-axis catenate */
 z=TRANSPOSE(TRANSPOSE(to$CT(x))++to$CT([y]));
 return(z);
} 
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment coma *** bidc bidc bidc LG
inline $ZTYPE[+] $FN$XT$YT$ZTLG($XTYPE[+] x, $YTYPE[+] y)
{/* AxA last axis catenate. Left rank greater */
 frameshape = drop([-1],shape(x));
 cellshape  = take([-1],shape(x)) + [1];
 cell = genarray(cellshape, $OTFILL);
 z = with { 
	(. <= iv <= .) 
		: to$CT(x[iv])++to$CT([y[iv]]);
	}: genarray(frameshape, cell);
 return(z);
}

%Fragment coma *** bidc bidc bidc RG
inline $ZTYPE[+] $FN$XT$YT$ZTRG($XTYPE[+] x, $YTYPE[+] y)
{/* AxA last axis catenate. Right rank greater */
 frameshape = drop([-1],shape(y));
 cellshape  = take([-1],shape(y)) + [1];
 cell = genarray(cellshape, $OTFILL);
 z = with { 
	(. <= iv <= .) 
		: to$CT(x[iv])++to$CT([y[iv]]);
	} : genarray(frameshape, cell);
 return(z);
}

%Fragment coma *** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[+] y)
{/* AxA last axis catenate. Ranks match */
 cellshape = (take([-1],shape(x)))+take([-1],shape(y));
 cell = genarray(cellshape, $OTFILL);
 z = with {
	 (. <= iv <= .) 
		: to$CT(x[iv])++to$CT(y[iv]);
	} : genarray(drop([-1], shape(x)), cell);
 return(z);
}

%%%%%%%%%%%%%%%%%%%%%%%%% first axis catenate %%%%%%%%%%%%%%%%%

%Fragment comb 0** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* SxA first-axis catenate */
  cell = genarray([1]++drop([1],shape(y)),to$CT(x));
  return(cell++to$CT(y));
}

%Fragment comb *0* bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE y)
{ /* AxS first-axis catenate */
  cell = genarray([1]++drop([1],shape(x)),to$CT(y));
  return(to$CT(x)++cell);
}

%Fragment comb *** bidc bidc bidc LG
inline $ZTYPE[+] $FN$XT$YT$ZTLG($XTYPE[+] x, $YTYPE[+] y)
{/* AxA first axis catenate. Left rank greater */
 return(to$CT(x)++to$CT([y]));
}
%Fragment comb *** bidc bidc bidc RG
inline $ZTYPE[+] $FN$XT$YT$ZTRG($XTYPE[+] x, $YTYPE[+] y)
{/* AxA first axis catenate. Right rank greater */
 return(to$CT([x])++to$CT(y));
}
%Fragment comb *** bidc bidc bidc .
inline $ZTYPE[+] $FNAME($XTYPE[+] x, $YTYPE[+] y)
{/* AxA first axis catenate. Ranks match */
 return(to$CT(x)++to$CT(y));
}

