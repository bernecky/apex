% Dyadic Miscellaneous function code fragments
% Handles matrix divide, deal, base value, 
% representation, dyadic thorn, match
%
% Robert Bernecky 2012-01-29  Plural code generator
%
% --------------- Base value fragments ----------------------------
%Fragment dtak 000  bid bid bid .
% There has to be a
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar basevalue Scalar */
 return(y);
}

%Fragment dtak 010 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar basevalue vector */
fixme
 ycols=shape(y);
 weights = genarray(ycols, to$CT(1));
 for (i=ycols[[0]]-2; i>=0; i--)
        weights[[i]] = weights[[i+1]]*to$CT(x);
 /* Now, we just do weights +.* y */
 z = with {
        ([0] <= iv < ycols)
                : weights[iv] * to$CT(y[iv]);
        } : fold(+, $OTFILL);
 return(z);
}

%Fragment dtak 0** bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar basevalue rank>1 */
fixme
 yt = TRANSPOSE(y); /* Dumb, but easy */
 frameshape = drop([-1],shape(yt));
 z = with { 
        (. <= iv <= .)
                : $FNAME(x, yt[iv]);
        } : genarray(frameshape, $OTFILL);
 return(TRANSPOSE(z));
}
%Generate , $FN, $XT$YT$ZT, 010, ., $CT
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment dtak 110 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Vector basevalue vector */
  /* 3 cases - all give 22200:
   *    10 10 10 basevalue 200 200 200 
   *    10 10 10 basevalue 200
   *    (,10) basevalue 200 200 200 
   */
fixme
 ycols = (shape(y))[[0]];
 if (1 == ycols){       /* Maybe extend y */
        ycols = shape(x)[[0]];
        y = genarray([ycols],y[[0]]);
 }
 if (1 == shape(x)[[0]]){       /* Maybe extend x */
        x = genarray([ycols], x[[0]]);
 }
 weights = genarray([ycols], to$CT(1));
 for (i=ycols-2; i>=0; i--)
        weights[[i]]= weights[[i+1]]*to$CT(x[[i+1]]);
 z = with { 
        ([0] <= iv < [ycols])
                : weights[iv] * to$CT(y[iv]);
        } : fold(+, $OTFILL);
 return(z);
}

%Fragment dtak 1** bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* +Vector basevalue rank>1 */
fixme
 yt = TRANSPOSE(y); /* Dumb, but easy */
 frameshape = drop([-1],shape(yt));
 z = with { 
        (. <= iv <= .)
                : $FNAME(x, yt[iv]);
        } : genarray(frameshape, $OTFILL); 
 return(TRANSPOSE(z));
}
%Generate , $FN, $XT$YT$ZT, 110, ., $CT
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

% --------------- Represent fragments ----------------------------
% These cases of Boolean result are detected by dfa; code
% generator picks then up by result type(ctl FindType fns).

%Fragment utak 101 bid bid b .
bool $FNAME($XTYPE x, $YTYPE y)
{ /* Vector-of-twos represent scalar */
/*   
% This could be any mix of powers-of-two with a bit of work.
% The guts of represent on Booleans
*/
fixme
   cell = 0;
   k = shape(x)[[0]]-1;
   z = with { 
        (. <= iv <= .)
                : BitAND(1,BitShiftRight(k-iv[0],toi(y)));
        } : genarray(shape(x), cell);
  return(toB(z));
}               

%Fragment utak 1**  bid bid b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Vector-of-twos represent non-scalar */
 fixme

/*   
   % This could be any mix of powers-of-two with a bit of work.
   % The guts of represent on Booleans
*/
 cell = genarray(shape(x),false);
 yt = TRANSPOSE(y);
 z = with {
        (. <= iv <= .)
                : $FNAME(x, yt[iv]);
        } : genarray(shape(yt), cell);
 return(TRANSPOSE(z));
}
%Generate , $FN, $CT$CT$ZT, 101, ., $CT
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT
%Generate ,   TRANSPOSE, X$ZT$ZT, X**, ., $ZT


%Fragment utak 101 bi bi bi .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Non-floating Vector represent scalar */
  /* Taken from ISO Extended APL standard Draft N93.03, page 155 */
fixme
  wts = genarray(shape(x),to$CT(1));
  for(i=shape(x)[[0]]-2; i>=0; i--)
        wts[[i]] = wts[[i+1]] * to$CT(x[[i+1]]);
  z = genarray(shape(x),$OTFILL);
  cy = to$CT(y);
  for(i=shape(x)[[0]]-1; i>=0; i--){
        z[[i]] = mod$CT$CT$ZT(to$CT(x[[i]]),cy/wts[[i]]);
        /* Must use fuzz-less call to mod!! */
        /* Represent is NOT fuzzy (SAPL Ref Man p.6-47, 1991 */
        cy = cy - z[[i]] * wts[[i]];
  }
 return(z);
}
%Generate , mod, $CT$CT$ZT, 000, ., $CT


%Fragment utak 101 bid bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Floating Vector represent scalar */
  /* Taken from ISO Extended APL standard Draft N93.03, page 155 */
fixme
  wts = genarray(shape(x),to$CT(1));
  for(i=shape(x)[[0]]-2; i>=0; i--)
        wts[[i]] = wts[[i+1]] * to$CT(x[[i+1]]);
  z = genarray(shape(x),$OTFILL);
  cy = to$CT(y);
  for(i=shape(x)[[0]]-1; i>=0; i--){
        z[[i]] = mod$CT$CT$ZT(to$CT(x[[i]]),cy/wts[[i]],0.0);
        /* Must use zero-fuzz call to mod!! */
        /* Represent is NOT fuzzy (SAPL Ref Man p.6-47, 1991 */
        cy = cy - z[[i]] * wts[[i]];
  }
 return(z);
}
%Generate , mod, $CT$CT$ZT, 000, ., $CT

%Fragment utak 1** bid  bid bid .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Vector represent non-scalar */
fixme
 yt = TRANSPOSE(y);
 cell = genarray(shape(x),$OTFILL);
 z = with {
        (. <= iv <= .)
                : $FNAME(x,yt[iv]);
        } : genarray(shape(yt), cell);
 return(TRANSPOSE(z));
}
%Generate , $FN, $XT$YT$ZT, 101, ., $CT
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT
%Generate ,   TRANSPOSE, X$ZT$ZT, X**, ., $ZT

% --------------- MATCH fragments ----------------------------

%Fragment same 000 bidc bidc b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Scalar match scalar */
  auto z = eq$CT$CTB($XTto$CT(x), $YTto$CT(y)$SYSVARGKER);
  return(z);
}
%Generate , APEXFUZZEQ, $XT$YTB, 000, ., D
%Generate , eq, $CT$CTB, 000, ., $CT

%Fragment same 0*0  bidc bidc b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Scalar match non-scalar */
  return(false);
}

%Fragment same *00  bidc bidc b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Non-scalar match scalar */
  return(false);
}

%Fragment same **0 bidc bidc b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Non-scalar match non-scalar */
  auto z = x.getShp() == y.getShp(); /* shape/dim check */
  auto valx = x.get$XT();
  auto valy = y.get$YT();
 
  for( auto i=0; i<valx.length; i++) {
    z = z && eq$CT$CTB($XTto$CT( valx[i]),  $YTto$CT( valy[i])$SYSVARGKER); 
    if( !z) {
      i = cast(int) valx.length;
    }
  }
  return(z);
}
%Generate , APEXFUZZEQ, $XT$YTB, 000, ., D
%Generate , eq, $CT$CTB, 000, ., $CT

