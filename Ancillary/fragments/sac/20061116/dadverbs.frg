% SAC 2006-01-30 RBernecky
% Code fragments for dyadic derived adverbs. 
% At present, this is only window reduction.

%Fragment sl 011 bid bid bid .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{ /* Scalar window-reduce vector */
  /* FIXME: Need checks on x range and shape */ 
 rev = [toi(toi(x) < 0)]; /* Reverse cell? */
 wid = [abs(toi(x))];
 shp = 1+shape(y)-wid;
 z = with (. <= iv <= .){
	cell = to$CT(tile( wid, iv, y));
	  if (rev)
		cell = reverse(cell);
	}
	genarray(shp, $FLVALUE$FRVALUEX$YT$ZT(cell));
 return(z);
}
%Generate , $FLVALUE, $FN, X$YT$ZT, x10, ., $CT

%Fragment sl 011 bid bid bid WIDTH2
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{ /* Width-2 window-reduce vector */
  /* FIXME: Need checks on x range */ 
 rev = [toi(toi(x) < 0)]; /* Reverse cell? */
 wid = [abs(toi(x))];
 shp = 1+shape(y)-wid;
 z = with (. <= iv <= .){
	xel = to$CT(y[iv+rev]);
	yel = to$CT(y[iv+1-rev]);
	} genarray(shp, $FLVALUE$CT$CT$ZT(xel,yel));
 return(z);
}
%Generate , $FLVALUE, $CT$CT$ZT, 000, ., $CT

%Fragment sl 111 bid bid bid ONEEL
inline $ZTYPE[.] $FNAME($XTYPE[1] x, $YTYPE[.] y)
{ /* One-element vector window-reduce vector */
  /* FIXME: Need checks on x range */ 
 rev = [toi(toi(x) < 0)]; /* Reverse cell? */
 wid = [abs(toi(x))];
 shp = 1+shape(y)-wid;
 z = with (. <= iv <= .) {
	cell = to$CT(tile( wid, iv, y));
	  if (rev)
		cell = reverse(cell);
	}
	genarray(shp, $FLVALUE$FRVALUEX$YT$ZT(cell));
 return(z);
}
%Generate , $FLVALUE, $FN, X$YT$ZT, x10,.,  $CT
