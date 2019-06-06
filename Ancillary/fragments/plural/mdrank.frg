% SAC Code fragments for rank conjunctions
% Robert Bernecky 2006-08-17

%Fragment nuax x00 x bidc bidc .
codeme
$ZTYPE $FNAME($YTYPE y$SYSVARFGDECL)
{ /* S monadic rank conj */ 
  z =  $FN$XT$YT$ZT(y$SYSVARGKER);
  return(z);
} 
%Generate , $FN, X$YT$ZT, X00, ., $CT

%Fragment nuax x** x bidc bidc EXTY
codeme
$ZTYPE $FNAMEEXTY($YTYPE y$SYSVARFGDECL)
{ /* Monadic rank conjunction on non-scalar. Extend right argument */
 yframeshape = drop([-$YRANK], shape(y));
 xcellshape =  take([-$XRANK], shape(x));
 ycellshape =  take([-$YRANK], shape(y));
 defcell = genarray($ZCELLSHAPE, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FNX$YT$ZT(x[iv], y$SYSVARGKER);
        } : genarray(yframeshape, defcell);
  return(z);
} 
%Generate , $FN, X$YT$ZT, X$YRANK*, ., $CT

%Fragment nuax 000 bidc bidc bidc .
codeme
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* SxS dyadic rank conj */ 
  z =  $FN$XT$YT$ZT(x,y$SYSVARGKER);
  return(z);
} 
%Generate , $FN, $XT$YT$ZT, 000, ., $CT

%Fragment nuax 0** bidc bidc bidc EXTX
codeme
$ZTYPE $FNAMEEXTX($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* SxA rank conjunction. Extend left argument */ 
 yframeshape = drop([-$YRANK], shape(y));
 xcellshape =  take([-$XRANK], shape(x));
 ycellshape =  take([-$YRANK], shape(y));
 defcell = genarray($ZCELLSHAPE, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FN$XT$YT$ZT(x, y[iv]$SYSVARGKER);
        } : genarray(yframeshape, defcell);
  return(z);
} 
%Generate , $FN, $XT$YT$ZT, $XRANK$YRANK*, ., $CT

%Fragment nuax *0* bidc bidc bidc EXTY
codeme
$ZTYPE $FNAMEEXTY($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* AxS rank conjunction. Extend right argument */ 
 xframeshape = drop([-$XRANK], shape(x));
 xcellshape =  take([-$XRANK], shape(x));
 ycellshape =  take([-$YRANK], shape(y));
 defcell = genarray($ZCELLSHAPE, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FN$XT$YT$ZT(x, y[iv]$SYSVARGKER);
        } : genarray(xframeshape, defcell);
  return(z);
} 
%Generate , $FN, $XT$YT$ZT, $XRANK$YRANK*, ., $CT

%Fragment nuax *** bidc bidc bidc EXTX
codeme
 $ZTYPE $FNAMEEXTX($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* AxA rank conjunction. Extend left argument */ 
 yframeshape = drop([-$YRANK], shape(y));
 xcellshape =  take([-$XRANK], shape(x));
 ycellshape =  take([-$YRANK], shape(y));
 defcell = genarray($ZCELLSHAPE, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FN$XT$YT$ZT(x, y[iv]$SYSVARGKER);
        } : genarray(yframeshape, defcell);
  return(z);
} 
%Generate , $FN, $XT$YT$ZT, $XRANK$YRANK*, ., $CT

%Fragment nuax *** bidc bidc bidc EXTY
codeme
$ZTYPE $FNAMEEXTY($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* AxA rank conjunction. Extend right argument */ 
 xframeshape = drop([-$YRANK], shape(x));
 xcellshape =  take([-$XRANK], shape(x));
 ycellshape =  take([-$YRANK], shape(y));
 defcell = genarray($ZCELLSHAPE, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FN$XT$YT$ZT(x[iv], y$SYSVARGKER);
        } : genarray(xframeshape, defcell);
  return(z);
} 
%Generate , $FN, $XT$YT$ZT, $XRANK$YRANK*, ., $CT

%Fragment nuax *** bidc bidc bidc . 
codeme
inline $ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARFGDECL)
{ /* AxA rank conjunction. No extension */ 
/* requires checks for length error!! rbe 2005-09-05 */
 xframeshape = drop([-$XRANK], shape(x));
 yframeshape = drop([-$YRANK], shape(y));
 xcellshape =  take([-$XRANK], shape(x));
 ycellshape =  take([-$YRANK], shape(y));
 defcell = genarray($ZCELLSHAPE, $OTFILL);
 z = with {
        (. <= iv <= .)
                : $FN$XT$YT$ZT(x[iv], y[iv]$SYSVARGKER);
        } : genarray(xframeshape, defcell);
  return(z);
} 
%Generate , $FN, $XT$YT$ZT, $XRANK$YRANK*, ., $CT

