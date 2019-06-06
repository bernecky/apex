%WARNING: transpose code fragments fail on empties!! 1996-02-15

% Code fragments for monadic structural function loop structures.
% 1995-02-08
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
% Supports arbitrary SISAL array origin 1996-04-01 /rbe
%
% Transpose and rotates are nops on scalars
%Fragment tran x00  Monadic transpose loop rank 0-0
%Fragment rotr x00  Monadic rotate  loop rank 0-0
%Fragment rot1 x00  Monadic rotate1  loop rank 0-0
function $FNAME(y0: $YTYPE 
                returns $ZTYPE) 
 y0
end function

%Fragment coma x01 Monadic comma (ravel) loop rank 0-1
function $FNAME(y0: $YTYPE 
                returns array[$ZTYPE]) 
array_fill(SISALIO,SISALIO,y0)
end function

%Fragment comb x02 Monadic commabar (table) loop rank 0-2
function $FNAME(y: $YTYPE 
                returns array[array[$ZTYPE]])
array_fill(SISALIO,SISALIO,array_fill(SISALIO,SISALIO,y))
end function

% Tranpose and ravel are nops on vectors
%Fragment tran x11     Monadic transpose loop rank 1-1
%Fragment coma x11     Monadic ravel loop rank 1-1
function $FNAME(y1: array[$YTYPE];
                returns array[$ZTYPE])
y1
end function

%
% Table is nop on tables
%Fragment comb x22                 Monadic table loop rank 2-2
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
y2
end function

% Following is much faster on matrices than other algorithms. 1996-05-30
% Should modify rank 3, etc to use this approach, but tempus fugit.
%Fragment coma x21                 Monadic ravel loop rank 2-1
% Ravel of matrix
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[$ZTYPE])
 array_setl(for i in array_liml(y2),array_limh(y2) cross
  j in array_liml(y2[SISALIO]),array_limh(y2[SISALIO]) returns 
   value of catenate array[SISALIO:y2[i,j]] end for,SISALIO)
end function

%Fragment coma x31                 Monadic ravel loop rank 3-1
function $FNAME(y3: array[array[array[$YTYPE]]] 
                returns array[$ZTYPE])

array_setl(for yi in array_liml(y2),array_limh(y2)
 returns value of catenate
  for yj in array_liml(y2[SISALIO]),array_limh(y2[SISALIO])
   returns value of catenate
    for yk in 
     array_liml(y2[SISALIO,SISALIO]),
     array_limh(y2[SISALIO,SISALIO])
    returns value of catenate y3[yi,yj,yk]
   end for
 end for
end for,SISALIO)
end function

%Fragment comb x12 Monadic commabar (table) loop rank 1-2
function $FNAME(y1: array[$YTYPE ]
                returns array[array[$ZTYPE]]) 
D := for yi in array_liml(y1),array_limh(y1)
 returns value of array_setl(y[yi]),SISALIO)
end for
returns array of array_setl(D,SISALIO)
end function

%Fragment comb x32 Monadic commabar (table) loop rank 3-2
function $FNAME(y3: array[array[array[$YTYPE]]]
                returns array[array[$ZTYPE]]) 
 T3 := for yi in array_liml(y3),array_limh(y3)
  T2 := for yj in array_liml(y3[SISALIO]),array_limh(y3[SISALIO]) cross 
             yk in array_liml(y3[SISALIO,SISALIO]),
                   array_limh(y3[SISALIO,SISALIO])
   returns value of y3[yi,yj,yk]
   end for 
  returns array of array_setl(T2,SISALIO)
 end for
returns array of array_setl(T3,SISALIO)
end function

%
%Fragment rotr x11 Monadic reverse loop rank 1-1
%Fragment rot1 x11 Monadic reverse1 loop rank 1-1
function $FNAME(y1: array[$YTYPE ]
                returns array[$ZTYPE])
let 
 n := array_size(y1);
in
  for i in SISALIO,SISALIO+n-1
   returns array of y1[(n-1)-i]
  end for
end let
end function

%Fragment rotr x22 Monadic reverse loop rank 2-2
function $FNAME(y2: array[array[$YTYPE]]
                returns array[array[$ZTYPE]])
let 
 n := array_size(y2[SISALIO]);
in
 for yi in array_liml(y2),array_limh(y2)
  T1:= for i in SISALIO,SISALIO+n-1
   returns array of y2[yi,(n-1)-i]
  end for
 returns array of array_setl(T1,SISALIO)
 end for
end let
end function

%Fragment rot1 x22 Monadic reverse1 loop rank 2-2
%Fragment rot1 x33 Monadic reverse1 loop rank 3-3
%Fragment rot1 x44 Monadic reverse1 loop rank 4-4
%Fragment rot1 x55 Monadic reverse1 loop rank 5-5
%Fragment rot1 x66 Monadic reverse1 loop rank 6-6
%Fragment rot1 x77 Monadic reverse1 loop rank 7-7
function $FNAME(y2: array[array[$YTYPE]]
                returns array[array[$ZTYPE]])
let 
 n := array_limh(y2);
 qio := array_liml(y2);
in
  for i in qio,n
   returns array of y2[qio+n-i]
  end for
end let
end function

%Fragment tran x22 Monadic transpose loop rank 2-2
function $FNAME(y2: array[array[$YTYPE]]
                returns array[array[$ZTYPE]])
if IsEmpty(y2) then y2 else % Empty array joke
let 
 rl := array_liml(y2); 
 rh := array_limh(y2);
 cl := array_liml(y2[SISALIO]);
 ch := array_limh(y2[SISALIO]);
in
  for i in cl,ch cross j in rl,rh
   returns array of y2[j,i]
  end for
end let
end if
end function

%Fragment tran x33 Monadic transpose loop rank 3-3
function $FNAME(y3: array[array[array[$YTYPE]]]
                returns array[array[array[$ZTYPE]]])
if 0=array_size(y3) then y3 else
let
 pl := array_liml(y3); 
 ph := array_limh(y3);
 rl := array_liml(y3[SISALIO]);
 rh := array_limh(y3[SISALIO]);
 cl := array_liml(y3[SISALIO,SISALIO]);
 ch := array_limh(y3[SISALIO,SISALIO]);
in
  for i in cl,ch cross j in rl,rh cross k in pl,ph
   returns array of y3[k,j,i]
  end for
end let
end if
end function

