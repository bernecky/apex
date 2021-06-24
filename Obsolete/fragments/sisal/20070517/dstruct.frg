% Code fragments for dyadic structural functions
%
% Robert Bernecky 1996-06-15
%
% Try to make first axis rotate support loop fusion in metaphon 1996-06-15
% For this, we abandon VectorRotate and revert to dumb loop.
% Last axis matrix rotate still stupid as of this date.

%
% Supports arbitrary QUADIO 1996-04-01 /rbe
% Supports arbitrary SISALIO

%Fragment rot1 022  Scalar rotate matrix first axis
function $FNAME(x0: $XTYPE; 
                y2: array[array[$YTYPE]] 
                returns array[array[$YTYPE]])
% Scalar rotate on table 
let 
 k:= VectorRotateAmount($XTtoI(x0),(array_size(y2)));
in
 for i in array_liml(y2),array_limh(y2) returns array of
 y2[if i+k <= array_limh(y2) then i+k else i+k-array_size(y2) end if]
 end for
end let
end function
   
%Fragment rotr 022  Scalar rotate matrix last axis
function $FNAME(x0: $XTYPE; 
                y2: array[array[$YTYPE]] 
                returns array[array[$YTYPE]])
% Scalar rotate on table 
let 
 rows:= array_size(y2);
 cols:= array_size(y2[SISALIO]);
in 
if rows=0 then y2 % Identity on empties also avoids index error below
 else
  let
   x := VectorRotateAmount($XTtoI(x0),cols);
  in
   array_setl(
    for y1 in y2 returns array of 
    VectorRotate(x,y1)
    end for
   ,SISALIO)
  end let
 end if
end let
end function

%Fragment rotr 122  Vector rotate matrix last axis
function $FNAME(x1: array[$XTYPE]; 
                y2: array[array[$YTYPE]] 
                returns array[array[$YTYPE]])
let
 cols:= array_size(y2[SISALIO]);
 rows:= ConformSame(array_size(x1),array_size(y2)); % Checking only 
in
   array_setl(
    for i in SISALIO,SISALIO+rows-1
    returns array of
     let y1:= y2[i] in % Avoid name conflict in macro!
     VectorRotate(VectorRotateAmount($XTtoI(x1[i]),cols),y1)
     end let
    end for
   ,SISALIO)
end let
end function



%Fragment rotr 011  Scalar rotate vector
% Scalar rotate on list
function $FNAME(x0: $XTYPE; 
                y1: array[$YTYPE];
                returns array[$YTYPE])
let 
 k:= VectorRotateAmount($XTtoI(x0),array_size(y1));
in
 for i in array_liml(y1),array_limh(y1) returns array of
 y1[if i+k <= array_limh(y1) then i+k else i+k-array_size(y1) end if]
 end for
end let
end function

% Dyadic transpose fragments

% Transpose on scalars and vectors is a nop, after conform checking

%Fragment tran 100  Dyadic transpose
function $FNAME(x1: array[$XTYPE];
                y0: $YTYPE;
                returns $YTYPE)

% Left argument must be empty.
if IsEmpty(x1) then y0 else error[$YTYPE] end if
end function

%Fragment tran 111  Dyadic transpose on vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE];
                returns array[$YTYPE])
% Left argument must be index origin
   if array_size(x1) = 1 & x1[SISALIO]= QUADIO
   then y0 else error[array[$YTYPE]] 
   end if
end function

%Fragment tran 122 Dyadic transpose
function $FNAME(x1: array[$XTYPE];
                y2: array[array[$YTYPE]];
                returns array[array[$ZTYPE]])
  function Valid(x1: array[$XTYPE];
                 returns array[integer])
  let 
   el0 := $XTtoI(x1[SISALIO])-QUADIO;
   el1 := $XTtoI(x1[SISALIO])-QUADIO;
  in
   if (2 ~= array_size(x1)) |
      (el0 < 0) | (el1 < 0) | ((el0+el1)>1) % 0 0, 0 1, 1 0
    then error[array[integer]] 
    else el0 || el1 
    end if
  end let
  end function

  function Easy(x1: array[integer];
                returns boolean)
  if (x1[SISALIO] = 0) & (x1[SISALIO+1] = 1) then true else false end if
  end function

if Easy(Valid(x1)) | (array_size(y2) = 0) | (array_size(y2[SISALIO]) = 0)
then y2
else
% OOPS. Can't do the diagonal slice bit!!!!
let 
 r := array_limh(y2);
 c := array_limh(y2[SISALIO]);
in
  for i in SISALIO,c cross j in SISALIO,r
   returns array of y2[j,i]
  end for
end let
 end if % Empty array
end function

%Fragment tran 133 Dyadic transpose loop rank 3-3
function $FNAME(x1: array[$XTYPE];
                y3: array[array[array[$YTYPE]]];
                returns array[array[array[$ZTYPE]]])
% Fails on some empties!

  function PredEmptyArray(y3: array[array[array[$YTYPE]]]; 
                          returns boolean)
  % Predicate for empty rank-3 array
  (IsEmpty(y3)) | (IsEmpty((y3[SISALIO]))) | (IsEmpty((y3[SISALIO,SISALIO])))
  end function

if PredEmptyArray(y3) then y3
else
let 
 prc := array_fill(SISALIO,SISALIO+2,-1);
 p := array_limh(y3);
 r := array_limh(y3[SISALIO]);
 c := array_limh(y3[SISALIO,SISALIO]);
 pv0 := $XTtoI(x1[SISALIO])-QUADIO;
 pv1 := $XTtoI(x1[SISALIO+1])-QUADIO;
 pv2 := $XTtoI(x1[SISALIO+2])-QUADIO;
 
 rz := prc[pv0: p; pv1: r; pv2: c];
 
 in
  for i in SISALIO,rz[SISALIO] cross 
      j in SISALIO,rz[SISALIO+1] cross 
      k in SISALIO,rz[SISALIO+2]
   returns array of
   let 
    ijk := array[SISALIO: i]||array[SISALIO: j]|| array[SISALIO: k];
    ix0 := ijk[pv0];
    ix1 := ijk[pv1];
    ix2 := ijk[pv2];
   in
    y3[ix0,ix1,ix2]
   end let
  end for
end let
end if
end function

