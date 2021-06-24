% Code fragments for scans
% 1995-07-04
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%
%Fragment bsl x00          Scan of a scalar (nop)
function $FNAME(y: $YTYPE returns $ZTYPE)                  
 y
end function                                                                   

%Fragment bsl x11          Scan of a vector
function $FNAME(y1: array[$YTYPE] 
                returns array[$ZTYPE])
% This does the scan in the wrong direction, but since
% we assume associative functions only, it should be ok.
let 
 lim := array_limh(y1);
% Result of empty scan or scalar scan should be 
% identity, but we have to force result type to constant type.
zz:= if lim < 0 then array_fill(0,-1,Ito$ZT(0))
 else
  if lim = 0 then array_fill(0,0,Ito$ZT(0))
  else
    for initial 
    i := 0;
    z := $YTto$ZT(y1[0]);
   while i < lim repeat
    i := old i+1;
    z := $FRVALUE{{old z}{$YTto$CT(y1[i])}}
    returns array of z
   end for
 end if
 end if

in
array_setl(zz,0)
end let

end function

%Fragment  bsl1  x22        Scan of matrix along first axis
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
??
end function

%Fragment  bsl  x22        Scan of matrix along last axis
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
??
end function
 
%Fragment  bsl1  x33        Scan of rank-3 along first axis
function $FNAME(y3: array[array[array[$YTYPE]]] 
                returns array[array[array[$ZTYPE])]]
??
end function

%Fragment  bsl  x33        Scan of rank-3 along last axis
function $FNAME(y3: array[array[array[$YTYPE]]]
                returns array[array[array[$ZTYPE]]])
??
end function
 

