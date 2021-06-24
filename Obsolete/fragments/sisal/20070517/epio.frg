% Code fragments for search functions
% These include x iota y, x epsilon y, x epsbar y
%
% Under construction. Probably needs data-type dependent support.
% E.g., for quadav iota y
%
% Supports arbitrary user index origin. 1996-03-26 /rbe
% 

%Fragment iotapv 111    Permutation vector iota vector
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE];
                returns array[integer])
% Build the index table. This is faster than an upgrade,
% and we also do not have to do fun stuff with the binary search.
let
 lim:= array_size(x1)-1;
 tbl:= for initial
  t:= for x0 in x1 at i returns array of -1 end for; % Allocate storage
  i:= 0; 
 while i<=lim repeat
  i:= old i+1;
  t:= old t[$XTtoI(x1[old i+SISALIO]): old i+QUADIO];
  returns value of t
 end for;
 nohit:= QUADIO+array_size(x1);
in
for y0 in y1 returns array of
  if (y0<0) then nohit 
  elseif (y0>lim) then nohit
  else tbl[y0+SISALIO]
  end if
end for
end let
end function

%
%Fragment iota 100       Vector iota scalar
%
function $FNAME(x1: array[$XTYPE]; 
                y0: $YTYPE  
                returns integer)
% We use iterative form, even though product form MAY allow parallelism.
% Use product form on non-scalar arguments.
% Fix up to use non-linear searching later on.

% Cases: 
%   0=general case. 
%   1=quadav as left argument char iota char
%   2=other char iota char
$SFCASES{{% General case:0
for initial 
  i := array_liml(x1);
  lim := array_limh(x1);
  y := $YTto$CT(y0);
  z := array_size(x1);
  topz := z;
 while (z=topz) & (i <= lim) repeat
  i := old i+1;
  z:= if ($XTto$CT(x1[old i]))~=y then old z else old i end if;
  returns value of z+QUADIO
end for}
{% Special case for quadav iota scalar:1
 let
  d := integer(y0);
 in
  QUADIO+if d >= 0 then d else d+256 end if
 end let
} % End of character vector iota character scalar case
{% Special case for vector iota scalar:2 (same as generalcase)
QUADIO + for initial 
  i := array_liml(x1);
  lim := array_limh(x1);
  y := $YTto$CT(y0);
  z := array_size(x1);
  topz := z;
 while (z=topz) & (i <= lim) repeat
  i := old i+1;
  z:= if ($XTto$CT(x1[old i]))~=y then old z else old i end if;
  returns value of z
end for}
% End of character vector iota character scalar case
} % End of cases
end function
 
%
%
%Fragment iota 111       Vector iota vector
%
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]
                returns array[integer])
% This code should upgrade x1, but time is tight... /rbe 1995-07-02

% Case 0=general case 
%      1=quadav left argument
%      2=non-quadav character iota character
$SFCASES{{ % General case
for y0 in y1 returns array of 
 for initial 
   i :=   array_liml(x1);
   lim := array_limh(x1);
   y := $YTto$CT(y0);
   z := array_size(x1);
   topz := z;
  while (z=topz) & (i <= lim) repeat
   i := old i+1;
   z := if $XTto$CT(x1[old i])~=y then old z else old i end if;
   returns value of z+QUADIO
 end for
end for} % End of general case

{% Special case for quadav left argument
  for y0 in y1 returns array of
   let
    d := integer(y0);
   in
    QUADIO + if d >= 0 then d else d+256 end if
   end let
  end for
} % End of quadav special case
{% Special case for non-quadav char iota char
 let
  tbl := for initial % Build table from left side
   tbl := array_fill(-128,127,QUADIO+array_size(x1));
   lim := array_liml(x1);
   i := array_limh(x1);
  while i >= lim repeat
   tbl := old tbl[integer(x1[old i]):old i+QUADIO];
   i := old i - 1;
   returns value of tbl
  end for
 in 
  for y0 in y1
   returns array of tbl[integer(y0)]
  end for
 end let
} % End of non-quadav char iota char special case
}
end function
%
%
%Fragment iota 122       Vector iota matrix
%
function $FNAME(x1: array[$XTYPE]; 
                y2: array[array[$YTYPE]]
                returns array[array[integer]])
% This code should upgrade x1, but time is tight... /rbe 1995-07-02

% Two cases:
%   0=general case
%   1=quadav as left argument
%   2=nonquadav char iota char
$SFCASES{{ % General case
for y1 in y2 returns array of
% Following code identical to iota111 case. 
 for y0 in y1 returns array of 
  for initial 
    i := array_liml(x1);
    lim := array_limh(x1);
    y := $YTto$CT(y0);
    z := array_size(x1);
    topz := z;
   while (z=topz) & (i <= lim) repeat
    i := old i+1;
    z := if $XTto$CT(x1[old i])~=y then old z else old i end if;
    returns value of z+QUADIO
  end for
 end for
end for} % End of general case
{% Special case for quadav left argument
 for y1 in y2 returns array of
  for y0 in y1 returns array of
   let
    d := integer(y0);
   in
    QUADIO + if d >= 0 then d else d+256 end if
   end let
  end for
 end for
} % End of quadav special case
{% Special case for non-quadav char iota char
 for y1 in y2 returns array of
 let
  tbl := for initial % Build table from left side
   tbl := array_fill(-128,127,QUADIO+array_size(x1));
   lim := array_liml(x1);
   i := array_limh(x1);
  while i >= lim repeat
   tbl := old tbl[integer(x1[old i]):old i+QUADIO];
   i := old i - 1;
   returns value of tbl
  end for
 in 
  for y0 in y1 
   returns array of tbl[integer(y0)]
  end for
 end let
 end for
} % End of non-quadav char iota char special case
} % End of cases
end function

% -------------------- epsilon fragments --------------------------------
%
%Fragment eps 000       Scalar epsilon scalar
%
function $FNAME(x0: $XTYPE;
                y0:  $YTYPE
                returns boolean)

 returns value of $XTto$CT(x0) = $YTto$CT(y0)
end function

%
%Fragment eps 010       Scalar epsilon vector
%
function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE]
                returns boolean)
% We use iterative form because it is faster than product SUM form,
% and will quick stop, whereas SUM does not. 1996-03-30
 
for initial 
 i:= SISALIO;
 lim := SISALIO+array_size(y1)-1;
 z := false;
 x := $XTto$CT(x0);
while (~z) & (i <= lim) repeat
 z := x = $YTto$CT(y1[old i]);
 i := old i+1;
returns value of z
end for
end function

%
%Fragment eps 101       Vector epsilon scalar
%
function $FNAME(x1: array[$XTYPE];
                y0: $YTYPE;
                returns array[boolean])

for x0 in x1
 returns array of $XTto$CT(x0) = $YTto$CT(y0)
end for
end function
 
%
%
%Fragment eps 111       Vector eps vector
%
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]
                returns array[boolean])

% This code should upgrade x1, but time is tight... /rbe 1995-07-02
% We should have special cases for character and boolean, at least,
% but don't. Tempus fugit. 1996-02-12

% Cases:
%  0=general case
%  1=character epsilon quadav (silly, eh?)
%  2=character epsilon character
$SFCASES{{ % General case
 for x0 in x1 returns array of 
  for initial 
    i := array_liml(y1);
    lim := array_limh(y1);
    x := $XTto$CT(x0);
    z:= false; % Never used
   while (z=false) & (i <= lim) repeat
    i := old i+1;
    z:= if $YTto$CT(y1[old i])~=x then true else false 
        end if
    returns value of z
    
  end for
 end for} % End of general case
{ % Special case for character epsilon quadav
array_fill(SISALIO,SISALIO+array_size(x1)-1,true)
}
{ % Special case for character epsilon character
 let % Build presence table from y1 entries
  tbl := for initial
   tbl := array_fill(-128,127,false);
   i := array_liml(y1);
   lim := array_limh(y1);
  while i <= lim repeat
   tbl := old tbl[integer(y1[old i]):true];
   i := old i+1;
   returns value of tbl
  end for
 in 
  for x0 in x1 
   returns array of tbl[integer(x0)]
  end for
 end let
}
} % End of cases
end function
 
% ------------------ ebar fragments -------------------------------

%
%
%Fragment epsb 111       Vector epsilonbar vector
%
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]
                returns array[boolean])

% We look for the left arg in the right arg.
% We should implement Boyer-Moore here, but time is
% tight. 1996-02-12
% This is OK for short phrases. Should have algorithm
% selector in code generator for this.

$SFCASES{{ % General case (0)
MATCHRESTVECTOR($XTYPE,$YTYPE,$XT,$YT,$CT)

 if IsEmpty(x1) then array_fill(0,array_limh(y1),true) % x1 empty
 else
 let 
  lasti := array_limh(y1) - array_limh(x1); % Last y1 index where
                                            % match can occur
 in
   for y0 in y1 at i returns array of
    if $XTto$CT(x1[0]) ~= $YTto$CT(y0) 
     % Quick out if no match on first character
      | i > lasti          % or past end of y1
    then false
    else MatchRestVector(x1,y1,i)
    end if
   end for
 end let
 end if
end function
}}
 
%
%Fragment epsb 122       Vector epsilonbar matrix
%
function $FNAME(x1: array[$XTYPE]; 
                y2: array[$YTYPE]
                returns array[array[boolean]])

% We look for the left arg in the right arg.
% We should implement Boyer-Moore here, but time is
% tight. 1996-02-12
% This is OK for short phrases. Should have algorithm
% selector in code generator for this.
$SFCASES{{ % General case (0)

 MATCHRESTVECTOR($XTYPE,$YTYPE,$XT,$YT,$CT)

 if IsEmpty(x1) = 0 then 
     array_fill(array_fill(0,array_limh(y2),
        % Stupid empty array kludge needed here
          array_fill(0,array_limh(y2[0]),true) % x1 empty
 else
  for y1 in y2 returns array of 
   let 
    lasti := array_limh(y1) - array_limh(x1); % Last y1 index where
                                              % match can occur
   in
     for y0 in y1 at i returns array of
      if $XTto$CT(x1[0]) ~= $YTto$CT(y0) 
       % Quick out if no match on first character
        | i > lasti          % or past end of y1
      then false
      else MatchRestVector(x1,y1,i)
      end if
     end for
   end let
  end for
 end if
}}
end function

