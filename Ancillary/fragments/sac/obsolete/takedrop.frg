% Code fragments for take and drop
%
% Robert Bernecky 2004-02-05

% %%%%%%%%%%%%%%%%%%% take %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment take 001 bid bidc bidc .
% Note to rbe: This should eventually be enhanced so that Boolean take
% is special cased. 

inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ /* Scalar take scalar. Build fill vector, then insert right arg */
  ix = toi(x);
  z = with( . <= [iv] <= .) 
        genarray([abs(ix)], $OTFILL);
  if (ix < 0)
	i = abs(ix)-1;
  else 
	i = 0;
  z[[i]] = y;
  return(z);
}

%Fragment take 101 bid bidc bidc  .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE y)
{ /* Vector take scalar. Build fill array, then insert right arg */
  ix = toi(x);
  z = with( . <= [iv] <= .) 
        genarray(abs(ix), $OTFILL);
  iz = with (. <= i <= .){
		if (ix[i] < 0)
			val = abs(ix[i])-1;
		else
			val = 0;
		}
	genarray(shape(ix), val);
  z[iz] = to$CT(y);
  return(z);
}

%Fragment take 011 bid bidc bidc .
%Fragment take 011 bid bidc bidc .
% Note to rbe: This should eventually be enhanced so that Boolean take
% is special cased. 
% Cases:
% error, identity, positive/negative overtake, positive/negative undertake
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[.] y)
{ /* Scalar take vector */ 
 xi = toi(x);
 if (xi>=0){
	shard = take(min([toi(x)],shape(y)),y);
	fillsz = max(0,abs(toi(x))-shape(shard));
	z = shard++genarray(fillsz,$OTFILL);

 } else {
	shard = take(-min(abs([toi(x)]),shape(y)[0]),y);
	fillsz = max(0,abs(toi(x))-shape(shard));
	z = genarray(fillsz,$OTFILL)++shard;
 }
  return(z);
}

%
%Fragment take 11* bid bidc bidc .
% Cases:
% error, identity, positive/negative overtake, positive/negative undertake
%

inline $ZTYPE[*] $FNAME($XTYPE[1] x, $YTYPE[.] y)
{ /* Vector-1 take Vector */ 
  n = _min_(abs(x),shape(y))];
  z = with(iv)
	([0] <= iv < abs(n)):		y[iv]; 
	(n   <= iv < abs(toi(x))):	$OTFILL;
	genarray(abs[x]); 
  return(z);
}

%Fragment take 0** bid bidc bidc .
inline $ZTYPE[.,.] $FNAME($XTYPE x, $YTYPE[.,.] y)
{ /* scalar take matrix */
  offset = where( toI(x) < 0, shape(y) + toI(x), 0);                    
  res = with( . <= iv <= .)                                       
        genarray( [abs(x)], y[_add_AxA_( offset, iv)]);
  return( res); 
}

%Fragment take 1** bid bidc bidc .
inline $ZTYPE[.,.] $FNAME($XTYPE[.] x, $YTYPE[.,.] y)
{ /* vector take matrix */
  offset = where( toi(x) < 0, shape(y) + toi(x), 0);
  cellshape = drop([shape(x)[0]],shape(y));
  cell = genarray(cellshape, $OTFILL);
  res = with( . <= iv <= .)                                       
        genarray( abs(x), y[_add_AxA_( offset, iv)],cell);
  return( res); 
}



%% -------------------- drop code fragments ------------------------
%
%Fragment drop 001 bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE x, $YTYPE[*] y)
{ /* Scalar drop scalar */
  res = drop([toi(x)], [y]);
  return( res);                                                  
}

%Fragment drop 0** bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE x, $YTYPE[*] y)
{ /* Scalar drop non-scalar */
  res = drop([toi(x)], y);
  return( res);                                                  
}

%Fragment drop 111 bid bidc bidc .
%Fragment drop 1** bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[*] y)
{ /* Vector drop vector/matrix */ 
  /* FIXME: Assert  dim(y)  == shape(x)[0]; */
  /* e.g, (,5)drop iota 5  */
  res = drop(toi(x), y);
  return(res);                                                  
}

