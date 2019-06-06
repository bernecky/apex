% Code fragments for reshape fragments
%
% Rewritten for sac with help from Sven-Bodo Scholz.
% Robert Bernecky 2004-09-17. Add SAC-like rank specifiers

%Fragment rho 001 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ // [Scalar reshape scalar] 
  z = genarray( [toi(x)],y);
  return(z);
}

%Fragment rho 101 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE y)
{ // [Vector reshape scalar] 
  z = genarray( toi(x),y);
  return(z);
}

%Fragment rho 0*1 bid bidc bidc .
inline $ZTYPE[.] $FNAME($XTYPE x, $YTYPE[*] y)
{ /* [Scalar reshape non-scalar] (to vector) */ 
 z = rhoI$YT$ZT( [toi(x)],y);
 return(z);
}
%Generate , rho, I$YT$YT, 1*1, ., $YT

%Fragment rho 1** c bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[*] y)
{  /* Character-vector reshape anything. */
   /* Left argument must be empty vector! */
  if( 0 != shape(x)[[0]]) {
    show(tochar("reshape domain error in $FNAME"));
  }
  z = y[ 0 * shape(y)];
  return(z);
}

%Fragment rho 1** bid bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[.] x, $YTYPE[*] y)
{  /* APEX vector x reshape, with potential item reuse */ 
   z = with {
         ( . <= iv <= .) {
           offset = V2O( toi( x), iv);
           offset = _mod_SxS_( offset, prod( shape(y)));
           el = y[ O2V( shape( y), offset)];
          } : el;
       } : genarray( toi(x), $OTFILL);
   return( z);
}
%Generate , V2O, III, 011, ., I 
%Generate , O2V, III, 110, ., I 

%Fragment rho *** bidc bidc bidc .
inline $ZTYPE[*] $FNAME($XTYPE[*] x, $YTYPE[*] y)
{ /* x rank>1! rank error! */
 APEXERROR("rank error"++__FILE__++__LINE__);
 return(y);
}
