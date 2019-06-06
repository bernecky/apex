
%NONONONONONO. USE mmisc.mac


% Monadic Miscellaneous function code fragments
% Handles shape, index generator, matrix inverse,
%  dex, nubsieve, thorn.
%
% Robert Bernecky 1995-02-08
% Converted back to origin 0, 1995-06-22.
% Converted to be origin-independent. Sigh. 1996-03-26
% Sort of: We support #DEFINEable quadio for APL.
% SISAL remains origin 0. 
% Supports arbitrary QUADIO and arbitrary SISALIO 1996-04-01 /rbe
%
%Fragment iota x01         Index generator on scalars
function $FNAME(y0: $YTYPE 
                returns array[integer])
for i in QUADIO,(ConformNonNegativeInt($YTtoI(y0))-1)+QUADIO
  returns array of i 
 end for
end function

%Fragment iota x11         Index generator on 1-element vector
function $FNAME(y1: array[$YTYPE]
                returns array[integer])

 function OneElement(y1: array[$YTYPE];
                     returns integer)
 if 1 = array_size(y1) then $YTtoI(y1[SISALIO]) else error[integer] end if
 end function

 for i in QUADIO,(ConformNonNegativeInt(OneElement(y1))-1)+QUADIO
  returns array of i
 end for
end function
                                                                               
%Fragment ltak x00          Dex on Scalar
%Fragment assg x00          Assign of Scalar
function $FNAME(y: $YTYPE 
                returns $YTYPE) 
     y
end function

%Fragment ltak x11          Dex on Vector
%Fragment assg x11          Assign of Vector
function $FNAME(y: array[$YTYPE] 
                returns array[$YTYPE]) 
     y
end function

%Fragment ltak x22          Dex on Matrix
%Fragment assg x22          Assign of Matrix
function $FNAME(y: array[array[$YTYPE]] 
                returns array[array[$YTYPE]]) 
     y
end function

%Fragment ltak x33          Dex on rank-3
%Fragment assg x33          Assign of rank-3
function $FNAME(y: array[array[array[$YTYPE]]]
                returns array[array[array[$YTYPE]]]) 
     y
end function

%Fragment ltak x44          Dex on rank-4
%Fragment assg x44          Assign of rank-4
function $FNAME(y: array[array[array[array[$YTYPE]]]]
                returns array[array[array[array[$YTYPE]]]]) 
     y
end function

%Fragment ltak x55          Dex on rank-5
%Fragment assg x55          Assign of rank-5
function $FNAME(y: array[array[array[array[array[$YTYPE]]]]]
                returns array[array[array[array[array[$YTYPE]]]]]) 
     y
end function

%Fragment ltak x66          Dex on rank-6
%Fragment assg x66          Assign of rank-6
function $FNAME(y: array[array[array[array[array[array[$YTYPE]]]]]]
                returns array[array[array[array[array[array[$YTYPE]]]]]]) 
     y
end function

%Fragment ltak x77          Dex on rank-7
%Fragment assg x77         Assign of rank-7
function $FNAME(y: array[array[array[array[
                   array[array[array[$YTYPE]]]]]]]
                returns array[array[array[array[
                   array[array[array[$YTYPE]]]]]]]) 
     y
end function

%
%Fragment rho x01    Shape of scalar
function $FNAME(y0: $YTYPE returns array[integer])
  array_fill(SISALIO,SISALIO-1,0)
end function

%Fragment rho x11    Shape of vector
function $FNAME(y1: array[$YTYPE] returns array[integer])
  array_fill(SISALIO,SISALIO,array_size(y1))
end function

%Fragment rho x21    Shape of table
function $FNAME(y2: array[array[$YTYPE]] returns array[integer])
  array[SISALIO: array_size(y2), array_size(y2[SISALIO])]
end function

%Fragment rho x31    Shape of rank-3
function $FNAME(y3: array[array[$YTYPE]] returns array[integer])
array[SISALIO: array_size(y2),
               array_size(y2[SISALIO]),
               array_size(y2[SISALIO,SISALIO])]
end function

