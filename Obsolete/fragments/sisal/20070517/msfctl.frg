% Code fragments for monadic scalar function loop structures.
% 1995-02-05
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%
%Fragment msf x00                 Monadic sf loop rank 0-0
function $FNAME(y: $YTYPE 
                returns $ZTYPE) 
 $FVALUE{{$YCOER(y)}}
end function

%
%Fragment msf x11                 Monadic sf loop rank 1-1
function $FNAME(y1: array[$YTYPE];
                returns array[$ZTYPE])
 for y0 in y1
 returns array of $FVALUE{{$YCOER(y0)}}
 end for 
end function

%Fragment msf x22                 Monadic sf loop rank 2-2
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
for y1 in y2
 s1 := for y0 in y1
  returns array of $FVALUE{{$YCOER(y0)}}
 end for
returns array of s1
end for
end function

%Fragment msf x33                 Monadic sf loop rank 3-3
function $FNAME(y3: array[array[array[$YTYPE]]] 
                returns array[array[array[$ZTYPE]]])
for y2 in y3
 s1 := for y1 in y2
  s0 := for y0 in y1
   returns array of $FVALUE{{$YCOER(y0)}}
  end for
 returns array of s0
 end for
returns array of s1
end for
end function

