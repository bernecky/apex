% Code fragments for indexed ref
% 1995-10-07
% This claims to support arbitrary user array index origin. 1996-03-26 /rbe
%
%
% Keyword definitions:

% $FNAME: The name of the SISAL function being produced for this
%         code fragment. Its name will depend on the types and
%         ranks of lhs and list i.

% $SFNAME: The name of the SISAL subfunction being invoked for this
%         code fragment. Its name will depend on the types and ranks
%         of lhs and 1 drop list i.

% $XTYPE: The type of lhs, e.g., double_real

% $XT:    The type abbreviation of lhs, e.g., D  (for double_real)

% $XRT:    The type and rank of lhs, e.g.,  array[double_real]

% $ITYPE0: The type of the first element of list i.

% $ITYPE1: The rank & types of the remaining elements of list i.
%
% List i is the list of thingies in the brackets.
%
%
% CASES:
%  Case 1:  Leading and all rightmore axes elided
%  Case 2:  Leading axis elided; at least 1 rightmore axis extant
%  Case 3:  Leading axis scalar
%  Case 4:  Leading axis vector
%  Case 5:  Leading axis matrix
%  Cases 6-n: Leading axis rank 3 and up

%
% Case 1: Leading and all rightmore axes elided
%
% E.g., vector[]   matrix[;]   rank3[;;]
%
%Fragment indr case1           Vector[] matrix[;]  rank3[;;]
function $FNAME(lhs: $XRT
                returns $ZRT)
lhs
end function


%  Case 2:  Leading axis elided; at least 1 rightmore axis extant
%
% E.g., x[;i]  x[;i;j;] 
%Fragment indr case2           Matrix[;ia1]  rank3[;ia1;ia2]
function $FNAME(lhs: $XRT;
                $IA1{{}{ia1: $IRT1}}
                returns $ZRT)
let
 tmp:=for i in 0,array_limh(lhs)
 returns array of 
  $SFCALL{{lhs[i]}{$SFNAME(lhs[i],ia1)}}
 end for
in 
array_setl(tmp,0)
end let
end function

%  Case 3:  Leading axis scalar
%
% E.g., x[i]  x[i;j]   x[i;j;] 

%Fragment indr case3           Matrix[ia0;ia1]  rank3[ia0;ia1;]
function $FNAME(lhs: $XRT;
                ia0: $ITYPE0;
                $IA1{{}{ia1: $IRT1}}
                returns $ZRT)
  $SFCALL{{lhs[$IT0toI(ia0)-QUADIO]}{$SFNAME(lhs[$IT0toI(ia0)-QUADIO],ia1)}}
end function
 
%  Case 4:  Leading axis vector
% E.g., x[i]  x[i;j]   x[i;j;] 

%Fragment indr case4           Matrix[ia0;ia1]  rank3[ia0;ia1;]
function $FNAME(lhs: $XRT;
                ia0: array[$ITYPE0];
                $IA1{{}{ia1: $IRT1}}
                returns $ZRT)
let
 tmp:=for i in ia0
 returns array of
  $SFCALL{{lhs[$IT0toI(i)-QUADIO]}{$SFNAME(lhs[$IT0toI(i)-QUADIO],ia1)}}
 end for
in 
 array_setl(tmp,0)
end let
end function
 
%  Case 5:  Leading axis matrix

%Fragment indr case5           Matrix[ia0;ia1] ia0 is rank-2
function $FNAME(lhs: $XRT;
                ia0: array[array[$ITYPE0]];
                $IA1{{}{ia1: $IRT1}}
                returns $ZRT)
let
 tmp:=for i in ia0 % Loop over rows of ia0
       returns array of
        array_setl(for j in i
         returns array of
         $SFCALL{{lhs[$IT0toI(j)-QUADIO]}
                 {$SFNAME(lhs[$IT0toI(j)-QUADIO],ia1)}}
        end for,0) % Index origin
      end for
in 
 array_setl(tmp,0)
end let
end function



%  Cases 6-n: Leading axis rank 3 and up

%Fragment indr case6           xxx[rank3;xxx]
UNDER CONSTRUCTION


