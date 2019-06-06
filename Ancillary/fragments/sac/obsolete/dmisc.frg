% Dyadic Miscellaneous function code fragments
% Handles matrix divide, deal, base value, 
% representation, dyadic thorn, match
%
% Robert Bernecky 2006-02-10
% SAC code generator
%
% --------------- Base value fragments ----------------------------
%Fragment dtak 000  bid bid bid .
% There has to be a
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar basevalue Scalar */
 return(y);
}

%Fragment dtak 010 bid bid bid .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE[.] y)
{ /* Scalar basevalue vector */
 ycols=shape(y);
 weights = genarray(ycols, to$CT(1));
 for (i=ycols[0]-2; i>=0; i--)
        weights[i] = weights[i+1]*to$CT(x);
 /* Now, we just do weights +.* y */
 z = with([0] <= iv < ycols)
	fold(+, $OTFILL, weights[iv] * to$CT(y[iv]));
 return(z);
}

%Fragment dtak 0** bid bid bid .
inline $ZTYPE[*] $FNAME($XTYPE x, $YTYPE[+] y)
{ /* Scalar basevalue rank>1 */
 yt = APEXTranspose(y); /* Dumb, but easy */
 frameshape = drop([-1],shape(yt));
 z = with(. <= iv <= .)
	genarray(frameshape, $FNAME(x, yt[iv]),$OTFILL);
 return(APEXTranspose(z));
}
%Generate , $FN, $XT$YT$ZT, 010

%Fragment dtak 110 bid bid bid .
inline $ZTYPE $FNAME($XTYPE[.] x, $YTYPE[.] y)
{ /* Vector basevalue vector */
  /* 3 cases - all give 22200:
   *    10 10 10 basevalue 200 200 200 
   *    10 10 10 basevalue 200
   *    (,10) basevalue 200 200 200 
   */
 ycols = (shape(y))[0];
 if (1 == ycols){	/* Maybe extend y */
	ycols = shape(x)[0];
	y = genarray([ycols],y[0]);
 }
 if (1 == shape(x)[0]){	/* Maybe extend x */
	x = genarray([ycols], x[0]);
 }
 weights = genarray([ycols], to$CT(1));
 for (i=ycols-2; i>=0; i--)
	weights[i]= weights[i+1]*to$CT(x[i+1]);
 z = with([0] <= iv < [ycols])
	fold(+, $OTFILL,
	weights[iv] * to$CT(y[iv]));
 return(z);
}

%Fragment dtak 1** bid bid bid .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* Vector basevalue rank>1 */
 yt = APEXTranspose(y); /* Dumb, but easy */
 frameshape = drop([-1],shape(yt));
 z = with(. <= iv <= .)
	genarray(frameshape, $FNAME(x, yt[iv]), $OTFILL); 
 return(APEXTranspose(z));
}
%Generate , $FN, $XT$YT$ZT, 110

% --------------- Represent fragments ----------------------------
% These cases of Boolean result are detected by dfa; code
% generator picks then up by result type(ctl FindType fns).

%Fragment utak 101 bid bid b .
inline bool[.] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Vector-of-twos represent scalar */
/*   
% This could be any mix of powers-of-two with a bit of work.
% The guts of represent on Booleans
*/
   cell = 0;
   k = shape(x)[0]-1;
   z = with(. <= iv <= .)
	genarray(shape(x),
	BitAND(1,BitShiftRightLogical(k-iv[0],toi(y))),cell);
  return(tob(z));
}		

%Fragment utak 1**  bid bid b .
inline bool[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* Vector-of-twos represent non-scalar */
/*   
   % This could be any mix of powers-of-two with a bit of work.
   % The guts of represent on Booleans
*/
 cell = genarray(shape(x),false);
 yt = APEXTranspose(y);
 z = with(. <= iv <= .)
	genarray(shape(yt),$FNAME(x, yt[iv]), cell);
 return(APEXTranspose(z));
}
%Generate , $FN, $CT$CT$ZT, 101


%Fragment utak 101 bi bi bi .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Non-floating Vector represent scalar */
  /* Taken from ISO Extended APL standard Draft N93.03, page 155 */
  wts = genarray(shape(x),to$CT(1));
  for(i=shape(x)[0]-2; i>=0; i--)
	wts[i] = wts[i+1] * to$CT(x[i+1]);
  z = genarray(shape(x),$OTFILL);
  cy = to$CT(y);
  for(i=shape(x)[0]-1; i>=0; i--){
	z[i] = mod$CT$CT$ZT(to$CT(x[i]),cy/wts[i]);
	/* Must use fuzz-less call to mod!! */
	/* Represent is NOT fuzzy (SAPL Ref Man p.6-47, 1991 */
	cy = cy - z[i] * wts[i];
  }
 return(z);
}
%Generate , mod, $CT$CT$ZT, 000


%Fragment utak 101 bid bid bid .
inline $ZTYPE[.] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Floating Vector represent scalar */
  /* Taken from ISO Extended APL standard Draft N93.03, page 155 */
  wts = genarray(shape(x),to$CT(1));
  for(i=shape(x)[0]-2; i>=0; i--)
	wts[i] = wts[i+1] * to$CT(x[i+1]);
  z = genarray(shape(x),$OTFILL);
  cy = to$CT(y);
  for(i=shape(x)[0]-1; i>=0; i--){
	z[i] = mod$CT$CT$ZT(to$CT(x[i]),cy/wts[i],0.0);
	/* Must use zero-fuzz call to mod!! */
	/* Represent is NOT fuzzy (SAPL Ref Man p.6-47, 1991 */
	cy = cy - z[i] * wts[i];
  }
 return(z);
}
%Generate , mod, $CT$CT$ZT, 000

%Fragment utak 1** bid  bid bid .
inline $ZTYPE[+] $FNAME($XTYPE[.] x, $YTYPE[+] y)
{ /* Vector represent non-scalar */
 yt = APEXTranspose(y);
 cell = genarray(shape(x),$OTFILL);
 z = with (. <= iv <= .)
	genarray(shape(yt),$FNAME(x,yt[iv]),cell);
 return(APEXTranspose(z));
}
%Generate , $FN, $XT$YT$ZT, 101

% --------------- MATCH fragments ----------------------------

%Fragment same 000 bidc bidc b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Scalar match scalar */
  z = to$CT(x) == to$CT(y);
 return(z);
}

%Fragment same 110 bidc bidc b .
inline $ZTYPE $FNAME($XTYPE[.] x, $YTYPE[.] y$SYSVARGDECL)
{ /* vector-vector match */
 z =all(shape(x) == shape(y));
 if (z)
  z = with(0*shape(y) <= iv < shape(y)) 
	fold(&, true, 
		eq$CT$CTB(to$CT(x[iv]), to$CT(y[iv])$SYSVARGKER));
 return(z);
}
%Generate , eq, $XT$YT$ZT, 000 

%Fragment same 0*0  bidc bidc b .
inline $ZTYPE $FNAME($XTYPE x, $YTYPE[+] y$SYSVARGDECL)
{ /* Scalar match non-scalar */
 return(false);
}

%Fragment same *00  bidc bidc b .
inline $ZTYPE $FNAME($XTYPE[+] x, $YTYPE y$SYSVARGDECL)
{ /* Non-scalar match scalar */
 return(false);
}

%Fragment same **0 bidc bidc b .
inline $ZTYPE $FNAME($XTYPE[+] x, $YTYPE[+] y$SYSVARGDECL)
{ /* Non-scalar match non-scalar */
  z = dim(x) == dim(y);
 if (z)
  z = z & all(shape(x) == shape(y));
 if (z)
  z = z & with(0*shape(y) <= iv < shape(y)) 
	fold(&, true, 
		eq$CT$CTB(to$CT(x[iv]), to$CT(y[iv])$SYSVARGKER));
 return(z);
}
%Generate , eq, $XT$YT$ZT, 000 
