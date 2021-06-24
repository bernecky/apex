



% NONONONONO. Use the mac!


% Code fragments for reshape fragments
%
% Robert Bernecky 1996-03-29
% Totally reworked after discussions with Pat Miller re preallocation.
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%

%Fragment rho 122       Vector-2 reshape matrix
function $FNAME(x1: array[$XTYPE]; y2: array[array[$YTYPE]] 
     returns array[array[$YTYPE]])
% Cases:
    % error, identity, normal  
% Length error on left argument

VVRESHAPE($YTYPE)
let
    rows  := ConformNonNegativeInt($XTtoI(x1[0]));
    cols  := ConformNonNegativeInt($XTtoI(x1[1]));
    rowsy := array_size(y2);
    colsy := array_size(y2[SISALIO]);
in 
 % Check for identity case
 if (rows =rowsy) & (cols = colsy)
  then y2 % Identity
 else 
  let
   y1 := RAVEL2(y2);
   y1cols := array_size(y1);
  in
   for i in 0,rows-1
   returns array of vvreshape(cols,mod(i*cols,y1cols),y1)
   end for
  end let
 end if
end let
end function

%
%Fragment rho 101       Vector-1 reshape scalar
%
function $FNAME(x1: array[$XTYPE]; 
                y: $YTYPE  
                returns array[$YTYPE])
 array_fill(0,ConformNonNegativeInt($XTtoI(x1[0]))-1,y)
end function
 
%
%Fragment rho 110       Vector-0 reshape vector to scalar
%
function $FNAME(x1: array[$XTYPE]; 
                y:  array[$YTYPE];
                returns $YTYPE)
% Since we know the result rank is scalar, we can blindly
% ignore the (empty) left argument.
y[SISALIO]
end function
 
%
%Fragment rho 120       Vector-0 reshape matrix to scalar
%
function $FNAME(x1: array[$XTYPE]; 
                y: array[array[$YTYPE]]
                returns $YTYPE)
% Since we know the result rank is scalar, we can blindly
% ignore the (empty) left argument.
y[SISALIO,SISALIO]
end function
 
%
%Fragment rho 130       Vector-0 reshape rank-3 to scalar
%
function $FNAME(x1: array[$XTYPE]; 
                y: array[array[array[$YTYPE]]];
                returns [$YTYPE)
% Since we know the result rank is scalar, we can blindly
% ignore the (empty) left argument.
y[SISALIO,SISALIO,SISALIO]
end function
 
%
%Fragment rho 110       Vector-0 reshape vector to scalar
%
function $FNAME(x1: array[$XTYPE]; 
                y: $YTYPE  
                returns array[$YTYPE])
% Since we know the result rank is scalar, we can blindly
% ignore the (empty) left argument.
y[SISALIO]
end function
 
%
%Fragment rho 011       Scalar reshape vector to vector
%
function $FNAME(x:  $XTYPE; 
                y1: array[$YTYPE]
                returns array[$YTYPE])
 VVRESHAPE($YTYPE)
 vvreshape(ConformNonNegativeInt($XTtoI(x)),SISALIO,y1)
end function

%
%Fragment rho 021       Scalar reshape matrix to vector
%
function $FNAME(x:  $XTYPE; 
                y2: array[array[$YTYPE]]
                returns array[$YTYPE])
 VVRESHAPE($YTYPE)
let
 y1:= array_setl(for y1 in y2 returns value of catenate y1 end for,SISALIO);
in
 vvreshape(ConformNonNegativeInt($XTtoI(x)),SISALIO,y1)
end let
end function

%
%Fragment rho 111       Vector-1 reshape vector to vector
%
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]
                returns array[$YTYPE])
 VVRESHAPE($YTYPE)

let 
 cols := ConformNonNegativeInt($XTtoI(x1[SISALIO]));
in
 if cols = array_size(y1) 
  then y1
  else vvreshape(cols,0,y1)
 end if
end let
end function

%
%
%Fragment rho 001       Scalar reshape scalar to vector
%
function $FNAME(x:  $XTYPE; 
                y:  $YTYPE
                returns array[$YTYPE])
 array_fill(SISALIO,ConformNonNegativeInt($XTtoI(x))+SISALIO-1,y)
end function

%
%Fragment rho 102       Vector-2 reshape scalar 
% We know left argument is two elements long. 
function $FNAME(x1: array[$XTYPE]; 
                y0:  $YTYPE 
                returns array[array[$ZTYPE]])
let 
 rows := ConformNonNegativeInt($XTtoI(x1[SISALIO]));
 cols := ConformNonNegativeInt($XTtoI(x1[SISALIO+1]));
in 
 for i in SISALIO,rows+SISALIO-1
 returns array of array_fill(SISALIO,SISALIO+cols-1,y0)
 end for
end let             
end function


%
%Fragment rho 112       Vector-2 reshape vector
% We know left argument is two elements long. 
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE] 
                returns array[array[$ZTYPE]])
 VVRESHAPE($ZTYPE)
let 
 rows := ConformNonNegativeInt($XTtoI(x1[SISALIO]));
 cols := ConformNonNegativeInt($XTtoI(x1[SISALIO+1]));
 colsy := array_size(y1);
in 
 for i in 0,rows-1
  returns array of vvreshape(cols,mod(i*cols,colsy),y1)
 end for
end let
end function

%
%Fragment rho 113       Vector-3 reshape vector
% We know left argument is three elements long. 
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE] 
                returns array[array[array[$ZTYPE]]])
 VVRESHAPE($ZTYPE)
let 
 planes := ConformNonNegativeInt($XTtoI(x1[SISAL]));
 rows   := ConformNonNegativeInt($XTtoI(x1[SISALIO+1]));
 cols   := ConformNonNegativeInt($XTtoI(x1[SISALIO+2]));
 colsy  := array_size(y1);
in
 for p in SISALIO,SISALIO+planes-1
 returns array of 
   for r in 0,rows-1
   returns array of vvreshape(cols,mod(r*cols,colsy),y1)
   end for
  end for
end let
end function
%

%Fragment rho 123       Vector-3 reshape matrix
% We know left argument is three elements long. 
function $FNAME(x1: array[$XTYPE]; 
                y2: array[array[$YTYPE]];
                returns array[array[array[$ZTYPE]]])

% We could put in conforming reshape support rather trivially here.
% The crctest benchmark could exploit it nicely

 VVRESHAPE($ZTYPE)
let 
 planes := ConformNonNegativeInt($XTtoI(x1[SISALIO]));
 rows   := ConformNonNegativeInt($XTtoI(x1[SISALIO+1]));
 cols   := ConformNonNegativeInt($XTtoI(x1[SISALIO+2]));
 y2rows := array_size(y2);
 y2cols := array_size(y2[0]); % May die on 0 0 0 rho 0 0 rho 4
in
 % Look for conforming reshape at matrix level
 if (rows = y2rows) & (cols = y2cols) % E.g, 3 4 5 rho 4 5 rho x
  then for p in SISALIO,SISALIO+planes-1
       returns array of y2
       end for
  % Could look for 3 6 5 rho 4 5 rho x, so we could just
  % point to the vectors, but probably rare.
   else 
    let 
     y1 := RAVEL2(y2);
     y1cols := array_size(y1);
    in
     for p in 0,planes-1
     returns array of 
      for r in 0,rows-1
      returns array of vvreshape(cols,mod((p+1)*r*cols,y1cols),y1)
      end for
     end for
    end let
   end if
end let 
end function

