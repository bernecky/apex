% Code fragments for indexed ref
% 2005-10-17
% Rewritten for SAC. rbe
% And again, 2005-10-24 /rbe
% And again, 2006-08-11 /rbe, after discovering how REALLY slow (1000X!) indrfr calls are.
% $XTYPE: The type of lhs, e.g., double_real
% $ZTYPE: The type of result, e.g., int
% $OTFILL: The lhs fill element. Not used by indr; needed for SAC with-loop.

% The idea here is an index reference of the form:
%   X[i;j;k;l;m]  	where index arrays (i,j,k,l,m...) may or
%  			not exist (E.g., X[i;k]),
% can be written as compositions of indexing functions:
%
% indrfr(fr,i,X)	Perform XX[i;...], where XX is the set of cells
%                       formed by splitting XX on "Frame Rank" fr.
% 			fr elements are numbered by the rank of the resulting
%			frame, e.g.,:
%	X[i;j;k;l;m...]
%         0 1 2 3 4...
% Result shape is ((i drop shape(X)),(shape(i)),(i+1)drop shape(x)).
%
% The key is to perform index operations from right to left, so that 
% axes inserted or deleted due to index array shapes. Hence, 
%	z = X[i;;k;;m] 
%             0  2  4  fr values
% can be written as:
%	TMP1 = indrfr(4,m,X);
%	TMP2 = indrfr(2,k,TMP1);
%	z    = indrfr(0,i,TMP2);
% or:   z    = indrfr(0,i,indrfr(2,k,indrfr(4,m,X)));
% with suitable coercions and QUADio subtractions for i,j,m.

% rank indicators for Z<- X[i;j;k] are  XxZijk. 
% Elided axes get x, e.g.:  X[;k2;] is  XxZx2x

%Fragment indr *0*           nonscalarX[scalarI;;] 
%              XIZ after fns2 gets made 
inline $ZTYPE[*] indr($XTYPE[+] X, int I)
{ /* X[scalarI;;;] */
  /* Used only in conjunction with other indexing, e.g.,
   * X[scalarI;;j;]
   */
 z = X[[I]];
 return(z);
}
%Generate , ABC,    III,           *00, ., I 
%Generate , indrfr, $XTI$XT, ****, ., I
%Generate , indrfr, $XTI$XT, *0*0, ., I

%Fragment indr *x*           nonscalarX[;;;] 
%              XIZ after fns2 gets made 
inline $ZTYPE[*] indr($XTYPE[+] X)
{ /* X[;;;] */
  /* Used only in conjunction with other indexing, e.g.,
   * X[;;j;]
   */
 return(X);
}
%Generate , indrfr, $XTI$XT, ****, ., I
%Generate , indrfr, $XTI$XT, *0*0, ., I

%Fragment indr ***           nonscalarX[nonscalarI;;] 
inline $ZTYPE[*] indr($XTYPE[+] X, int[+] I)
{ /* X[nonscalarI;;;] */
 defcell = genarray(drop([1],shape(X)),$OTFILL);
 z = with(. <= iv <= .)
        genarray(shape(I), X[[I[iv]]],defcell);
 return(z);
}
%Generate , ABC, III, ***, ., I 
%Generate , ABC, III, *00, ., I 
%Generate , indrfr, $XTI$XT, ****, ., I
%Generate , indrfr, $XTI$XT, *0*0, ., I

%Fragment indrfr *0*0           nonscalarX[;;scalarI;;] 
%                XIZ after fns2 gets made 
inline $ZTYPE[*] indrfr(int fr, $XTYPE[+] X, int I)
{ /* X[;;;I;;;], where I has fr (framerank) semicolons to its left */
  /* This is actually "I from"fr X" */
 frameshape = take([fr], shape(X)); 
 cellshape = drop([1+fr],shape(X));
 cell = genarray(cellshape,$OTFILL);
 z = with(. <= iv <= .)
        genarray(frameshape, sel( I, X[iv]),cell);
 return(z);
}
%Generate , ABC, III, ***, ., I 

%Fragment indrfr ****           nonscalarX[;;nonscalarI;;] 
%                XIZ after fns2 gets made 
inline $ZTYPE[*] indrfr(int fr, $XTYPE[+] X, int[+] I)
{ /* X[;;;I;;;], where I has fr (framerank) semicolons to its left */
  /* This is actually "I from"fr X" */
  frameshape = take([fr], shape(X));
  cellshape =  shape(I)++drop([fr+1], shape(X));
  cell = genarray(cellshape, $OTFILL);
 z = with(. <= iv <= .)
        genarray(frameshape, indrfr0(X[iv], I),cell);
 return(z);
}

inline $ZTYPE[*] indrfr0($XTYPE[+] X, int[+] I)
{ /* X[I;;;] or    I from X */
  cellshape =  drop([1], shape(X));
  cell = genarray(cellshape, $OTFILL);
 z = with(. <= iv <= .)
        genarray(shape(I), sel( I[iv], X),cell);
 return(z);
}
%Generate , ABC, III, ***, ., I 
%Generate , ABC, III, *00, ., I 

