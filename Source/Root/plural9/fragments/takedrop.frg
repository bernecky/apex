% Plural Code fragments for take and drop
%
% Robert Bernecky 2012-02-25

% %%%%%%%%%%%%%%%%%%% take %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment take 001 bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar take scalar */
  auto shp = [$XTtoI( x)];
  auto val = new $YTYPE[ shp];
  if( $XTtoI( x) > 1) {  /* zero take */
    if( $XTtoI( x) > 0) {  
      val[0] = y;
    } else {
      val[ shp - 1] = y;
    }
  }
  auto z = new Parray( shp, val);
  return( z);
}

%Fragment take 101 bid bidc bidc  .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Vector take scalar */
  auto shp = $XTtoI( x);
  auto xrho = xrhoShp( shp);
  auto val = new $YTYPE[ xrho];
 write ugly code here;
  auto z = new Parray( shp, val);
  return( z);
}
%Generate , xrhoShp, III,     X10, ., I

%Fragment take 011 bid bidc bidc .
%Fragment take 011 bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar take vector */ 
  return(take([$XTtoI(x)], y));
}

%Fragment take 11* bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Vector take Vector */ 
  return(take($XTtoI(x),y));
}

%Fragment take 0** bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* scalar take matrix */
 return(take([$XTtoI(x)],y));
}

%Fragment take 1** bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* vector take matrix */
  return(take($XTtoI(x),y));
}

%% -------------------- drop code fragments ------------------------
%
%Fragment drop 001 bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar drop scalar */
  auto shp = [0];
  auto val = new $YTYPE[0];
  z = new Parray( shp, val);
  return( z);
}

%Fragment drop 0** bid bidc bidc .
$ZTYPE FNAME($XTYPE x, $YTYPE y)
{ /* Scalar drop non-scalar */
  auto i = $XTtoI( x);
  assert( 1 == y.get$YT().length); /* FIXME: Higher-rank generalized drop */ 
  auto shp = max(0, y.get$YT().length - abs(i));
  auto offset = i<0 ? 0 : i;
  auto val = y[ offset .. shp].dup;
  auto z = new Parray( shp, val);
  return( z);
}

%Fragment drop 111 bid bidc bidc .
%Fragment drop 1** bid bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Vector drop non-scalar */
  /* FIXME: Assert  dim(y)  == shape(x)[0]; */
  /* e.g, (,5)drop iota 5  */
  return(drop($XTtoI(x), y));
}

