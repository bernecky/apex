% Dyadic Miscellaneous function code fragments
% Handles matrix divide, deal,
% base value, representation, dyadic thorn,
% match
%
% Robert Bernecky 1995-02-08
% Converted back to origin-0, 1995-06-22
%
% Supports arbitrary QUADIO 1996-03-26 /rbe
% Supports arbitrary SISALIO 1996-04-01 /rbe
%
% Fragment header:
%  jsymbol ranks:xyz lefttype righttype resulttype 

% lex and dex are no more. They live in cpp land now.


%Fragment coma 001 b b b Scalar catenate scalar
%Fragment coma 001 b i i Scalar catenate scalar
%Fragment coma 001 b d d Scalar catenate scalar
%Fragment coma 001 i b i Scalar catenate scalar
%Fragment coma 001 i i i Scalar catenate scalar
%Fragment coma 001 i d d Scalar catenate scalar
%Fragment coma 001 d b d Scalar catenate scalar
%Fragment coma 001 d i d Scalar catenate scalar
%Fragment coma 001 d d d Scalar catenate scalar
%Fragment coma 001 c c c Scalar catenate scalar
%Fragment comb 001 bidc bidc Scalar catenate scalar first axis
function $FNAME(x: $XTYPE;
                y: $YTYPE;
                returns array[$ZTYPE])
array[SISALIO: $XTto$ZT(x), $YTto$ZT(y)] 
end function

%Fragment comb 001 b c c Scalar catenate scalar first axis
%Fragment comb 001 i c c Scalar catenate scalar first axis
%Fragment comb 001 d c c Scalar catenate scalar first axis
%Fragment comb 001 c b c Scalar catenate scalar first axis
%Fragment comb 001 c i c Scalar catenate scalar first axis
%Fragment comb 001 c d c Scalar catenate scalar first axis
function $FNAME(x: $XTYPE;
                y: $YTYPE;
                returns array[$ZTYPE])
error[array[$ZTYPE]
end function


%Fragment coma 111 b b b Vector catenate vector
%Fragment coma 111 b i i Vector catenate vector
%Fragment coma 111 b d d Vector catenate vector
%Fragment coma 111 i b i Vector catenate vector
%Fragment coma 111 i i i Vector catenate vector
%Fragment coma 111 i d d Vector catenate vector
%Fragment coma 111 d b d Vector catenate vector
%Fragment coma 111 d i d Vector catenate vector
%Fragment coma 111 d d d Vector catenate vector
%Fragment coma 111 c c c Vector catenate vector
%Fragment comb 111 b b b Vector catenate vector first axis
%Fragment comb 111 b i i Vector catenate vector first axis
%Fragment comb 111 b d d Vector catenate vector first axis
%Fragment comb 111 i b i Vector catenate vector first axis
%Fragment comb 111 i i i Vector catenate vector first axis
%Fragment comb 111 i d d Vector catenate vector first axis
%Fragment comb 111 d b d Vector catenate vector first axis
%Fragment comb 111 d i d Vector catenate vector first axis
%Fragment comb 111 d d d Vector catenate vector first axis
%Fragment comb 111 c c c Vector catenate vector first axis
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]; 
                returns array[$ZTYPE])
$XTto$ZT1(x1) || $YTto$ZT1(y1)
end function

%Fragment comb 212 b b b Matrix catenate vector first axis
%Fragment comb 212 b i i Matrix catenate vector first axis
%Fragment comb 212 b d d Matrix catenate vector first axis
%Fragment comb 212 i b i Matrix catenate vector first axis
%Fragment comb 212 i i i Matrix catenate vector first axis
%Fragment comb 212 i d d Matrix catenate vector first axis
%Fragment comb 212 d b d Matrix catenate vector first axis
%Fragment comb 212 d i d Matrix catenate vector first axis
%Fragment comb 212 d d d Matrix catenate vector first axis
%Fragment comb 212 c c c Matrix catenate vector first axis
function $FNAME(x2: array[array[$XTYPE]];
                y1: array[$YTYPE];
                returns array[array[$ZTYPE]])
array_addh($XTto$ZT2(x2),$YTto$ZT1(y1))
end function

%Fragment comb 122 b b b Vector catenate matrix first axis
%Fragment comb 122 b i i Vector catenate matrix first axis
%Fragment comb 122 b d d Vector catenate matrix first axis
%Fragment comb 122 i b i Vector catenate matrix first axis
%Fragment comb 122 i i i Vector catenate matrix first axis
%Fragment comb 122 i d d Vector catenate matrix first axis
%Fragment comb 122 d b d Vector catenate matrix first axis
%Fragment comb 122 d i d Vector catenate matrix first axis
%Fragment comb 122 d d d Vector catenate matrix first axis
%Fragment comb 122 c c c Vector catenate matrix first axis
function $FNAME(x1: array[$XTYPE];
                y2: array[array[$YTYPE]];
                returns array[array[$ZTYPE]])
array_setl(array_addl($YTto$ZT2(y2),$XTto$ZT1(x1)),SISALIO)
end function

%Fragment comb 222 b b b Matrix catenate matrix first axis
%Fragment comb 222 b i i Matrix catenate matrix first axis
%Fragment comb 222 b d d Matrix catenate matrix first axis
%Fragment comb 222 i b i Matrix catenate matrix first axis
%Fragment comb 222 i i i Matrix catenate matrix first axis
%Fragment comb 222 i d d Matrix catenate matrix first axis
%Fragment comb 222 d b d Matrix catenate matrix first axis
%Fragment comb 222 d i d Matrix catenate matrix first axis
%Fragment comb 222 d d d Matrix catenate matrix first axis
%Fragment comb 222 c c c Matrix catenate matrix first axis
function $FNAME(x2: array[array[$XTYPE]];
                y2: array[array[$YTYPE]];
                returns array[array[$ZTYPE]])
    $XTto$ZT2(x2) || $YTto$ZT2(y2)
end function

%Fragment coma 122 b b b Vector catenate matrix last axis
%Fragment coma 122 b i i Vector catenate matrix last axis
%Fragment coma 122 b d d Vector catenate matrix last axis
%Fragment coma 122 i b i Vector catenate matrix last axis
%Fragment coma 122 i i i Vector catenate matrix last axis
%Fragment coma 122 i d d Vector catenate matrix last axis
%Fragment coma 122 d b d Vector catenate matrix last axis
%Fragment coma 122 d i d Vector catenate matrix last axis
%Fragment coma 122 d d d Vector catenate matrix last axis
%Fragment coma 122 c c c Vector catenate matrix last axis
% Catenate new column to matrix
function $FNAME(x1: array[$XTYPE];
                y2: array[array[$YTYPE]];
                returns array[array[$ZTYPE]])
 
  function Conforms(x2: array[array[$XTYPE]]; y1: array[$YTYPE];
                    returns integer,integer)
  if (array_size(x2) = array_size(y1)) 
   then array_liml(x2),array_limh(x2)
   else  error[integer], error[integer]
   end if
  end function
let
 d := array_liml(x1)-array_liml(y2); % Variable SISAL array origin
in
  for i in Conforms(y2,x1)
  returns array of
  array_setl(array_addl($XTto$ZT1(y2[i]),$YTto$ZT(x1[d+i])),SISALIO)
  end for
end let
end function

%Fragment coma 212 b b b Matrix catenate vector last axis
%Fragment coma 212 b i i Matrix catenate vector last axis
%Fragment coma 212 b d d Matrix catenate vector last axis
%Fragment coma 212 i b i Matrix catenate vector last axis
%Fragment coma 212 i i i Matrix catenate vector last axis
%Fragment coma 212 i d d Matrix catenate vector last axis
%Fragment coma 212 d b d Matrix catenate vector last axis
%Fragment coma 212 d i d Matrix catenate vector last axis
%Fragment coma 212 d d d Matrix catenate vector last axis
%Fragment coma 212 c c c Matrix catenate vector last axis
% Catenate new column to matrix
function $FNAME(x2: array[array[$XTYPE]];
                y1: array[$YTYPE];
                returns array[array[$ZTYPE]])
 
  function Conforms(x2: array[array[$XTYPE]];
                    y1: array[$YTYPE];
                    returns integer, integer)
   if (array_size(x2) = array_size(y1))
    then array_liml(x2),array_limh(x2)
    else error[integer], error[integer]
   end if
  end function

let
 d:= array_liml(y1)- array_liml(x2);
 in
  for i in Conforms(x2,y1)
  returns array of
  array_addh($XTto$ZT1(x2[i]),$YTto$ZT(y1[d+i]))
  end for
 end if
end let
end function


%Fragment coma 222 b b b Matrix catenate matrix last axis
%Fragment coma 222 b i i Matrix catenate matrix last axis
%Fragment coma 222 b d d Matrix catenate matrix last axis
%Fragment coma 222 i b i Matrix catenate matrix last axis
%Fragment coma 222 i i i Matrix catenate matrix last axis
%Fragment coma 222 i d d Matrix catenate matrix last axis
%Fragment coma 222 d b d Matrix catenate matrix last axis
%Fragment coma 222 d i d Matrix catenate matrix last axis
%Fragment coma 222 d d d Matrix catenate matrix last axis
%Fragment coma 222 c c c Matrix catenate matrix last axis
function $FNAME(x2: array[array[$XTYPE]];
                y2: array[array[$YTYPE]];
                returns array[array[$ZTYPE]])

  function Conforms(x2: array[array[$XTYPE]];
                    y2: array[array[$YTYPE]];
                    returns integer, integer)
   if (array_size(x2) = array_size(y2)) 
    then array_liml(x2),array_limh(x2)
    else error[integer], error[integer]
   end if
  end function
 let
  d:= array_liml(y2)-array_liml(x2);
 in
  for i in Conforms(x2,y2)
   returns array of 
   $XTto$ZT1(x2[i]) || $YTto$ZT1(y2[d+i])
  end for
end let
end function

%Fragment coma 333 b b b Rank-3 catenate rank-3 last axis
%Fragment coma 333 b i i Rank-3 catenate rank-3 last axis
%Fragment coma 333 b d d Rank-3 catenate rank-3 last axis
%Fragment coma 333 i b i Rank-3 catenate rank-3 last axis
%Fragment coma 333 i i i Rank-3 catenate rank-3 last axis
%Fragment coma 333 i d d Rank-3 catenate rank-3 last axis
%Fragment coma 333 d b d Rank-3 catenate rank-3 last axis
%Fragment coma 333 d i d Rank-3 catenate rank-3 last axis
%Fragment coma 333 d d d Rank-3 catenate rank-3 last axis
%Fragment coma 333 c c c Rank-3 catenate rank-3 last axis
function $FNAME(x3: array[array[array[$XTYPE]]]; 
                y3: array[array[array[$YTYPE]]];
                returns array[array[array[$ZTYPE]]])

  function Conforms2(x2: array[array[$XTYPE]];
                    y2: array[array[$YTYPE]];
                    returns integer, integer)
  if (array_size(x2) = array_size(y2))
   then array_liml(x2),array_limh(x2)
   else error[integer],error[integer]
  end if
  end function

 function Conforms3(x3: array[array[array[$XTYPE]]];
                   y3: array[array[array[$YTYPE]]];
                   returns integer, integer)
  if (array_size(x3) = array_size(y3))
   then array_liml(x3),array_limh(x3)
   else error[integer], error[integer]
   end if
  end function
let
 d:= array_liml(y2)-array_liml(x2);
 ilo,ihi := Conforms3(x3,y3);
 jlo,jhi := Conforms2(x3[ilo],y3[d+ilo]);
in 
 for i in ilo.ihi
  returns array of 
   for j in jlo.jhi
        returns array of
        $XTto$ZT1(x3[i,j]) || $YTto$ZT1(y3[i+d,j+d])
       end for
   end for
end function
%

%Fragment coma 333 b b b Rank-3 catenate rank-3 first axis
%Fragment coma 333 b i i Rank-3 catenate rank-3 first axis
%Fragment coma 333 b d d Rank-3 catenate rank-3 first axis
%Fragment coma 333 i b i Rank-3 catenate rank-3 first axis
%Fragment coma 333 i i i Rank-3 catenate rank-3 first axis
%Fragment coma 333 i d d Rank-3 catenate rank-3 first axis
%Fragment coma 333 d b d Rank-3 catenate rank-3 first axis
%Fragment coma 333 d i d Rank-3 catenate rank-3 first axis
%Fragment coma 333 d d d Rank-3 catenate rank-3 first axis
%Fragment coma 333 c c c Rank-3 catenate rank-3 first axis
function $FNAME(x3: array[array[array[$XTYPE]]]; 
                y3: array[array[array[$YTYPE]]];
                returns array[array[array[$ZTYPE]]])
$XTto$ZT3(x3) || $YTto$ZT3(y3)
end function
%
%
%Fragment coma 011 b b b Scalar catenate vector
%Fragment coma 011 b i i Scalar catenate vector
%Fragment coma 011 b d d Scalar catenate vector
%Fragment coma 011 i b i Scalar catenate vector
%Fragment coma 011 i i i Scalar catenate vector
%Fragment coma 011 i d d Scalar catenate vector
%Fragment coma 011 d b d Scalar catenate vector
%Fragment coma 011 d i d Scalar catenate vector
%Fragment coma 011 d d d Scalar catenate vector
%Fragment coma 011 c c c Scalar catenate vector
%Fragment comb 011 b b b Scalar catenate vector first axis
%Fragment comb 011 b i i Scalar catenate vector first axis
%Fragment comb 011 b d d Scalar catenate vector first axis
%Fragment comb 011 i b i Scalar catenate vector first axis
%Fragment comb 011 i i i Scalar catenate vector first axis
%Fragment comb 011 i d d Scalar catenate vector first axis
%Fragment comb 011 d b d Scalar catenate vector first axis
%Fragment comb 011 d i d Scalar catenate vector first axis
%Fragment comb 011 d d d Scalar catenate vector first axis
%Fragment comb 011 c c c Scalar catenate vector first axis
function $FNAME(x: $XTYPE;
                y1: array[$YTYPE];
                returns array[$ZTYPE])
array_setl(array_addl($YTto$ZT1(y1),$XTto$ZT(x)),SISALIO)
end function

%Fragment coma 101 b b b Vector catenate scalar
%Fragment coma 101 b i i Vector catenate scalar
%Fragment coma 101 b d d Vector catenate scalar
%Fragment coma 101 i b i Vector catenate scalar
%Fragment coma 101 i i i Vector catenate scalar
%Fragment coma 101 i d d Vector catenate scalar
%Fragment coma 101 d b d Vector catenate scalar
%Fragment coma 101 d i d Vector catenate scalar
%Fragment coma 101 d d d Vector catenate scalar
%Fragment coma 101 c c c Vector catenate scalar
%Fragment comb 101 b b b Vector catenate scalar first axis
%Fragment comb 101 b i i Vector catenate scalar first axis
%Fragment comb 101 b d d Vector catenate scalar first axis
%Fragment comb 101 i b i Vector catenate scalar first axis
%Fragment comb 101 i i i Vector catenate scalar first axis
%Fragment comb 101 i d d Vector catenate scalar first axis
%Fragment comb 101 d b d Vector catenate scalar first axis
%Fragment comb 101 d i d Vector catenate scalar first axis
%Fragment comb 101 d d d Vector catenate scalar first axis
%Fragment comb 101 c c c Vector catenate scalar first axis
function $FNAME(x1: array[$XTYPE]; 
                y: $YTYPE;
                returns array[$ZTYPE])
array_addh($XTto$ZT1(x1),$YTto$ZT(y))
end function


% --------------- Base value fragments ----------------------------

%Fragment dtak 010 b b i Scalar base value vector
%Fragment dtak 010 i b i Scalar base value vector
%Fragment dtak 010 d b d Scalar base value vector
function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE];
                returns $ZTYPE)
% Special case (sort of) for boolean right argument
 for initial 
  i   := array_limh(y1);
  iz  := array_liml(y1);  % SISAL origin independence
  z   := Ito$ZT(0); % additive identity
  radixval := Ito$ZT(1);
  while (i >= iz) repeat
    z := old z + $YTto$ZT(y1[old i]) * old radixval; 
    radixval := old radixval + old radixval;  % New weighting factor
    i := old i - 1;
    returns value of z
  end for
end function

%Fragment dtak 010 b i i Scalar base value vector
%Fragment dtak 010 b d d Scalar base value vector
%Fragment dtak 010 i i i Scalar base value vector
%Fragment dtak 010 i d d Scalar base value vector
%Fragment dtak 010 d i d Scalar base value vector
%Fragment dtak 010 d d d Scalar base value vector
function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE];
                returns $ZTYPE)
% I should try this as two loops: 
%    reverse times scan to build weights;
%    then a weights +.* y1
 for initial 
  i   := array_limh(y1);
  iz  := array_liml(y1);  % SISAL origin independence
  z   := Ito$ZT(0); % additive identity
  zx0 := $XTto$ZT(x0);
  radixval := Ito$ZT(1);
  while (i >= iz) repeat
    z := old z + $YTto$ZT(y1[old i]) * old radixval; 
    radixval := old radixval * zx0;  % New weighting factor
    i := old i - 1;
    returns value of z
  end for
end function

%Fragment dtak 110 b i i Vector base value vector
%Fragment dtak 110 b d d Vector base value vector
%Fragment dtak 110 i i i Vector  base value vector
%Fragment dtak 110 i d d Vector  base value vector
%Fragment dtak 110 d i d Vector  base value vector
%Fragment dtak 110 d d d Vector  base value vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE];
                returns $ZTYPE)
% This works with either a singleton or as a vector left argument.

% I should try this as two loops: 
%    reverse times scan to build weights;
%    then a weights +.* y1
 for initial 
  i   := array_limh(y1);
  iz  := array_liml(y1);  % SISAL origin independence
  z   := Ito$ZT(0); % additive identity
  xi  := array_limh(x1); % Index into left argument
  xinc:= if 1=array_size(x1) then 0 else 1 end if;
  radixval := Ito$ZT(1);
  while (i >= iz) repeat
    z := old z + $YTto$ZT(y1[old i]) * old radixval; 
    radixval := old radixval * $XTto$ZT(x1[old xi]);  % New weighting factor
    i := old i - 1;
    xi:= old xi-xinc; 
    returns value of z
  end for
end function

%Fragment dtak 021 b b i Scalar base value matrix
%Fragment dtak 021 b i i Scalar base value matrix
%Fragment dtak 021 b d d Scalar base value matrix
%Fragment dtak 021 i b i Scalar base value matrix
%Fragment dtak 021 i i i Scalar base value matrix
%Fragment dtak 021 i d d Scalar base value matrix
%Fragment dtak 021 d b d Scalar base value matrix
%Fragment dtak 021 d i d Scalar base value matrix
%Fragment dtak 021 d d d Scalar base value matrix
function $FNAME(x0: $XTYPE;
                y2: array[array[$YTYPE]];
                returns array[$ZTYPE])
% KLUDGE: Handles scalar 2 left argument on right argument of
%         integers only. 1996-02-15

if IsEmpty(y2) & (x0=x0) % Silliness to avoid unref x warning.
then array_fill(SISALIO,SISALIO-1,$ZTtoI(0)) % empty y2
else
 for initial
  rows := array_size(y2); % Start with last row
  currow := rows-1; 
  z := $YTto$ZT1(y2[currow+SISALIO]); % Vector result
  cols := array_size(z)-1;
 while (currow > 0) repeat % ALready got last row
  currow := old currow -1;
  y1 := y2[currow+SISALIO]; % Row of bits contributing to row of result
   z := for i in 0,cols
        returns array of
        or(old z[i+SISALIO],shiftl($YTtoI(y1[i+SISALIO]),(rows-1)-currow))
        end for
 returns value of z
 end for
 end if % empty y2
end function

% --------------- Represent fragments ----------------------------

% These cases of Boolean result are detected by dfa

%Fragment utak 101 i b b  Vector-of-twos represent scalar
%Fragment utak 101 i i b  Vector-of-twos represent scalar
function $FNAME(x1: array[$XTYPE];
                y0: $YTYPE;
                returns array[$ZTYPE])
   
% This could be any mix of powers-of-two with a bit of work.
% The guts of represent on Booleans
   for x0 in x1 at i returns array of 
    ItoB(and(shiftr($YTtoI(y0),array_limh(x1)-i),1))
   end for
end function

%Fragment utak 112 i b b Vector-of-twos represent vector
%Fragment utak 112 i i b Vector-of-twos represent vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE];
                returns array[array[$ZTYPE]])

   % This could be any mix of powers-of-two with a bit of work.
   % The guts of represent on Booleans
   for x0 in x1 at i cross y0 in y1
    returns array of 
    ItoB(and(shiftr($YTtoI(y0),array_limh(x1)-i),1))
   end for
end function

%Fragment utak 101 b  b i  Vector represent scalar
%Fragment utak 101 b  i i  Vector represent scalar
%Fragment utak 101 b  d d  Vector represent scalar
%Fragment utak 101 i  b i  Vector represent scalar
%Fragment utak 101 i  i i  Vector represent scalar
%Fragment utak 101 i  d d  Vector represent scalar
%Fragment utak 101 d  b d  Vector represent scalar
%Fragment utak 101 d  i d  Vector represent scalar
%Fragment utak 101 d  d d  Vector represent scalar
function $FNAME(x1: array[$XTYPE];
                y0: $YTYPE;
                returns array[$ZTYPE])
% Taken from ISO Extended APL standard Draft N93.03, page 155
for initial 
 c := y0;
 i := array_limh(x1);
 lim := array_liml(x1);
 z := array_fill(lim.i,OTFILL$ZT); % Avoid array copies below
while i >= lim repeat
 i := old i-1;
 t := dmod$ZT$ZT($XTto$CT(x1[old i]),old c);
 c := if x1[old i] = OTFILL$XT 
      then OTFILL$ZT 
      else (old c-t)/$XTto$CT(x1[old i])
      end if;
 z:= old z[old i: t];
 returns value of z
end for
end function

%Fragment utak 112 b b i  Vector represent vector
%Fragment utak 112 b i i  Vector represent vector
%Fragment utak 112 b d d  Vector represent vector
%Fragment utak 112 i b i  Vector represent vector
%Fragment utak 112 i i i  Vector represent vector
%Fragment utak 112 i d d  Vector represent vector
%Fragment utak 112 d b d  Vector represent vector
%Fragment utak 112 d i d  Vector represent vector
%Fragment utak 112 d d d  Vector represent vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE];
                returns array[array[$ZTYPE]])
% Taken from ISO Extended APL standard Draft N93.03, page 155
 function transpose(x2: array[array[$ZTYPE]]
                    returns array[array[$ZTYPE]])
 for j in array_liml(x2[SISALIO]),array_limh(x2[SISALIO]) cross
     i in array_liml(x2),array_limh(x2)
 returns array of x2[i,j] 
 end for 
end function

transpose( for y0 in y1 returns array of
  for initial 
   c := y0;
   i := array_limh(x1);
   lim := array_liml(x1);
   z := array $ZT1 [];
  while i >= lim repeat
   i := old i-1;
   t := $ZTmodulo(old c,$XTto$CT(x1[old i]));
   c := if x1[old i] = OTFILL$XT 
        then OTFILL$ZT 
        else (old c-t)/$XTto$CT(x1[old i])
        end if;
   z := array_addl(old z,t);
   returns value of array_setl(z,SISALIO)
  end for
 end for)
end function


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment same 110 b b b Match on vectors
%Fragment same 110 b i b Match on vectors
%Fragment same 110 b d b Match on vectors
%Fragment same 110 b c b Match on vectors
%Fragment same 110 i b b Match on vectors
%Fragment same 110 i i b Match on vectors
%Fragment same 110 i d b Match on vectors
%Fragment same 110 i c b Match on vectors
%Fragment same 110 d b b Match on vectors
%Fragment same 110 d i b Match on vectors
%Fragment same 110 d d b Match on vectors
%Fragment same 110 d c b Match on vectors
%Fragment same 110 c b b Match on vectors
%Fragment same 110 c i b Match on vectors
%Fragment same 110 c d b Match on vectors
%Fragment same 110 c c b Match on vectors
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE];
                returns boolean)
if array_size(x1) ~= array_size(y1) 
 then false
 else for x0 in x1 at i returns value of sum 
      $XTto$CT(x0)=$YTto$CT(y1[i]) end for
 end if
end function


