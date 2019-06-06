% Code fragments for take and drop
%
% Robert Bernecky 2006-02-14
% These all just call sac take/drop now.

% %%%%%%%%%%%%%%%%%%% take %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment take 001 bid bidc bidc .

inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar take scalar */
  return(take([toi(x)],[y]));
}

%Fragment take 101 bid bidc bidc  .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Vector take scalar */
  return(take(toi(x),[y]));
}

%Fragment take 011 bid bidc bidc .
%Fragment take 011 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{ /* Scalar take vector */ 
  return(take([toi(x)], y));
}

%
%Fragment take 11* bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[1] x, $YTYPE[.] y)
{ /* Vector take Vector */ 
  return(take(toi(x),y));
}

%Fragment take 0** bid bidc bidc .
inline $ZTYPE[.,.] $FNAME($XTYPE x, $YTYPE[.,.] y)
{ /* scalar take matrix */
 return(take([toi(x)],y));
}

%Fragment take 1** bid bidc bidc .
inline $ZTYPE[.,.] $FNAME($XTYPE[.] x, $YTYPE[.,.] y)
{ /* vector take matrix */
  return(take(toi(x),y));
}

%% -------------------- drop code fragments ------------------------
%
%Fragment drop 001 bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE x, $YTYPE[*] y)
{ /* Scalar drop scalar */
  return(drop([toi(x)], [y]));
}

%Fragment drop 0** bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE x, $YTYPE[*] y)
{ /* Scalar drop non-scalar */
  return(drop([toi(x)], y));
}

%Fragment drop 111 bid bidc bidc .
%Fragment drop 1** bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[*] y)
{ /* Vector drop non-scalar */
  /* FIXME: Assert  dim(y)  == shape(x)[0]; */
  /* e.g, (,5)drop iota 5  */
  return(drop(toi(x), y));
}

