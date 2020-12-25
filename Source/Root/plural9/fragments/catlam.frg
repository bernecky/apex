% Catenate code fragments
% Robert Bernecky 2012-01-29   Plural code generator
%
% Fragment header:  jsymbol ranks(x,y,z) nil nil nil comments
% * in rank specifier means any rank>1


%Fragment coma 001 bidc bidc bidc .
%Fragment comb 001 bidc bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{/* SxS catenate first (or last) axis */
  auto shpz = [2];
  auto valz = [ $XTto$ZT( x), $YTto$ZT( y)];
  auto z = new Parray( shpz, valz);
  return(z);
}

%Fragment coma 011 bidc bidc bidc .
%Fragment comb 011 bidc bidc bidc .
Parray* $FNAME($XTYPE x, Parray* y)
{/* SxV catenate first (or last) axis */
  auto shpz = [ 1 + xrhoShp( y.getShp2)];
  auto valz = $XTto$ZT( x) ~ $YTto$ZT( y.get$ZT());
  auto z = new Parray( shpz, valz);
  return(z);
}
%Generate , xrhoShp, XII,     X10, ., I

%Fragment coma 101 bidc bidc bidc .
%Fragment comb 101 bidc bidc bidc .
Parray* $FNAME(Parray* x, $YTYPE y)
{/* VxS catenate first (or last) axis */
  auto shpz = [ 1 + xrhoShp( x.getShp())];
  auto valz = $XTto$ZT( x.get$ZT()) ~ $YTto$ZT( y);
  auto z = new Parray( shpz, valz);
  return(z);
}
%Generate , xrhoShp, XII,     X10, ., I

%Fragment coma 111 bidc bidc bidc .
%Fragment comb 111 bidc bidc bidc .
Parray* $FNAME(Parray* x, Parray* y)
{ /* VxV catenate first or last axis */
  auto shpz = xrhoShp( x.getShp()) + xrhoShp( y.getShp());
  auto valz = $XTto$ZT( x.get$ZT()) ~ $YTto$ZT( y.get$ZT());
  auto z = new Parray( shpz, valz);
  return(z);
}
%Generate , xrhoShp, XII,     X10, ., I

%Fragment comb 1** bidc bidc bidc .
Parray* $FNAME(Parray* x, Parray*] y)
{/* VxA first axis catenate */
 fixme
 return($XTto$CT([x])++$YTto$CT(y));
}

%Fragment comb *1* bidc bidc bidc .
Parray* $FNAME(Parray* x, Parray* y)
{/* AxV first axis catenate */
 fixme
 return($XTto$CT(x)++$YTto$CT([y]));
}

%Fragment coma 0** bidc bidc bidc .
Parray* $FNAME($XTYPE x, Parray* y)
{ /* S,A last-axis catenate */

  auto yshp = y.getShp();
  auto yval = y.get$ZT();
  auto xval = $XTto$ZT( x);

  auto framecnt = xrhoShp( frameshp);
  auto frameshp = yshp[ 0 .. $-1];
  auto ycellxrho = yshp[ $-1];
  auto zcellxrho = ycellxrho + 1;
  auto zxrho = zcellxrho * framecnt;
  auto zshp = frameshp ~ 1;
  auto zval = new $ZTYPE[ 0];

  foreach ( i; 0 .. framecnt ) {
   /* Construct via repeated catenation! */
   /* Not sure if this will be amazingly slow... */
   offset = i * ycellxrho;
   zval = zval ~ ( xval[ offset .. (offset + ycellxrho)] ~ xval);
  }

  return(z);
} 

%Fragment coma *0* bidc bidc bidc .
Parray* $FNAME(Parray* x, $YTYPE y)
{ /* A,S last-axis catenate */

  auto xshp = x.getShp();
  auto xval = x.get$ZT();
  auto yval = $YTto$ZT( y);

  auto framecnt = xrhoShp( frameshp);
  auto frameshp = xshp[ 0 .. $-1];
  auto xcellxrho = xshp[ $-1];
  auto zcellxrho = xcellxrho + 1;
  auto zxrho = zcellxrho * framecnt;
  auto zshp = frameshp ~ 1;
  auto zval = new $ZTYPE[ 0];

  foreach ( i; 0 .. framecnt ) {
   /* Construct via repeated catenation! */
   /* Not sure if this will be amazingly slow... */
   offset = i * xcellxrho;
   zval = zval ~ ( yval[ offset .. (offset + xcellxrho)] ~ yval);
  }

  auto z = new Parray( zshp, zval);
  return(z);
} 


%Fragment coma 1** bidc bidc bidc .
Parray* $FNAME(Parray* x, Parray* y)
{ /* VxA last-axis catenate */
 fixme
 z=TRANSPOSE($XTto$CT([x])++TRANSPOSE($YTto$CT(y)));
 return(z);
} 
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment coma *1* bidc bidc bidc .
Parray* $FNAME(Parray* x, Parray* y)
{ /* AxV last-axis catenate */
 fixme
 z=TRANSPOSE(TRANSPOSE($XTto$CT(x))++$YTto$CT([y]));
 return(z);
} 
%Generate ,   TRANSPOSE, X$YT$YT, X**, ., $YT

%Fragment coma *** bidc bidc bidc LG
Parray* $FN$XT$YT$ZTLG(Parray* x, Parray* y)
{/* AxA last axis catenate. Left rank greater */
 fixme
 frameshape = drop([-1],shape(x));
 cellshape  = take([-1],shape(x)) + [1];
 cell = genarray(cellshape, $OTFILL);
 z = with { 
        (. <= iv <= .) 
                : $XTto$CT(x[iv])++$YTto$CT([y[iv]]);
        }: genarray(frameshape, cell);
 return(z);
}

%Fragment coma *** bidc bidc bidc RG
Parray* $FN$XT$YT$ZTRG(Parray* x, Parray* y)
{/* AxA last axis catenate. Right rank greater */
 fixme
 frameshape = drop([-1],shape(y));
 cellshape  = take([-1],shape(y)) + [1];
 cell = genarray(cellshape, $OTFILL);
 z = with { 
        (. <= iv <= .) 
                : $XTto$CT(x[iv])++$YTto$CT([y[iv]]);
        } : genarray(frameshape, cell);
 return(z);
}

%Fragment coma *** bidc bidc bidc .
Parray* $FNAME(Parray* x, Parray* y)
{/* AxA last axis catenate. Ranks match */
 fixme
 cellshape = (take([-1],shape(x)))+take([-1],shape(y));
 cell = genarray(cellshape, $OTFILL);
 z = with {
         (. <= iv <= .) 
                : $XTto$CT(x[iv])++$YTto$CT(y[iv]);
        } : genarray(drop([-1], shape(x)), cell);
 return(z);
}

%%%%%%%%%%%%%%%%%%%%%%%%% first axis catenate %%%%%%%%%%%%%%%%%

%Fragment comb 0** bidc bidc bidc .
Parray* $FNAME($XTYPE x, Parray* y)
{ /* SxA first-axis catenate */
 fixme
  cell = genarray([1]++drop([1],shape(y)),$XTto$CT(x));
  return(cell++$YTto$CT(y));
}

%Fragment comb *0* bidc bidc bidc .
Parray* $FNAME(Parray* x, $YTYPE y)
{ /* AxS first-axis catenate */
 fixme
  cell = genarray([1]++drop([1],shape(x)),$YTto$CT(y));
  return($XTto$CT(x)++cell);
}

%Fragment comb *** bidc bidc bidc LG
Parray* $FN$XT$YT$ZTLG(Parray* x, Parray* y)
{/* AxA first axis catenate. Left rank greater */
 fixme
 return($XTto$CT(x)++$YTto$CT([y]));
}
%Fragment comb *** bidc bidc bidc RG
Parray* $FN$XT$YT$ZTRG(Parray* x, Parray* y)
{/* AxA first axis catenate. Right rank greater */
 fixme
 return($XTto$CT([x])++$YTto$CT(y));
}
%Fragment comb *** bidc bidc bidc .
Parray* $FNAME($XTYPE x, $YTYPE y)
{/* AxA first axis catenate. Ranks match */
 fixme
 return($XTto$CT(x)++$YTto$CT(y));
}

