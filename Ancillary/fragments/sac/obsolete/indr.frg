% Code fragments for indexed ref
% 2005-10-17
% Rewritten for SAC. rbe
% Again. Now that I theoretically have the proper semantics for modarray. Sheesh!
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
inline $ZTYPE $FNAME($YTYPE lhs )
{ /* Indexed ref Case1: vector[] or matrix[;] or rank3[;;] */ 
	return(lhs);
}

%  Case 2:  Leading axis elided; at least 1 rightmore axis extant
%
% E.g., x[;i]  x[;i;j;] 
%Fragment indr case2           Matrix[;ia1]  rank3[;ia1;ia2]
inline $ZRT $FNAME($XRT lhs,  $IA1{{}{ia1: $IRT1}})
{ /* Indexed ref case 2:  x[;i] or x[;i;j;] */
 z = with(. <= iv <= .)
	genarray(k...
}

%  Case 3:  Leading axis scalar
%
% E.g., x[i]  x[i;j]   x[i;j;] 

%Fragment indr case3           Matrix[ia0;ia1]  rank3[ia0;ia1;]
inline $ZTYPE $FNAME($XRT lhs, $ITYPE0 ia0 $IA1{{}{$IRT1 ia1}})
{ /* Indexed ref case3: x[scalar] or x[scalar,;j] or x[scalar;j;] */
  z= $SFCALL{{lhs[toI(ia0)]}{$SFNAME(lhs[toI(ia0)],ia1)}};
  return(z);
}
 
%  Case 4:  Leading axis vector
% E.g., x[i]  x[i;j]   x[i;j;] 

%Fragment indr case4           Matrix[ia0;ia1]  rank3[ia0;ia1;]
inline $ZTYPE $FNAME($XRT lhs, [$ITYPE0] ia0 $IA1{{}{$IRT1 ia1}}
{ /* Indexed ref case 4: x[vector] or x[vector;j] or x[vector;j;] */

let
 tmp:=for i in ia0
 returns array of
  $SFCALL{{lhs[$IT0toI(i)]}{$SFNAME(lhs[$IT0toI(i)],ia1)}}
 end for
in 
 array_setl(tmp,0)
end let
}
 
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
         $SFCALL{{lhs[toI(j)]}
                 {$SFNAME(lhs[toI(j)],ia1)}}
        end for,0) % Index origin
      end for
in 
 array_setl(tmp,0)
end let
end function



%  Cases 6-n: Leading axis rank 3 and up

%Fragment indr case6           xxx[rank3;xxx]
UNDER CONSTRUCTION


