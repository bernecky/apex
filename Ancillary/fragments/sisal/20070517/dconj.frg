% Code fragments for dyadic conjunctions, such as x +.* y
% Supports arbitrary user index origin 1996-03-26
% Accepts any SISALIO in
% Generates any SISALIO out 1996-05-02

% 1996-12-23 The 021 version uses a new flavor of reduction
% with explicit function defined. This looks easier to generate
% code for and appears to run no slower than the generic SISAL
% reductions. ALL VERSIONS OF INNER PRODUCT SHOULD BE CHANGED TO
% USE THIS FORM (except the quickstop ones, of course).
% Do we have time to do this today? Of course not.

% Note: 1996-12-23
% Timings of these algorithms for 021 perform as follows:
%   reduce function with vector 1.70 sec
%   explicit iteration down column: 1.81 sec
%   work over ravel of array with explicit OR
%    implicit stepsize: more than 3 seconds.
% This suggests that use of the reduce function is faster. Since it
% is also easier to generate code for, we will use it.


% 1996-02-14 
% This version uses different flavor of SumColumns

% Robert Bernecky 1995-02-09
% As of 1995-02-09, we only support inner products with
% a left (reduction) function of plus, or, and, max, min, times
% Hence, the kludge in the fragment names below
% See opctl.frg for outer product fragments
%
% As a result of a message from Patrick Miller, 1995-03-20,
% all fragments have been rewritten to avoid the 
% "for x in x1" sort of thing, as this prevents (due to bug in osc)
% loop fusion from happening. With the new fragments, we hope
% loop fusion will occur. The new fragments replace the
% "for x in x1... f(x)" with "for xi in 0,array_limh(x1)...f(x[xi])"
%
% sigh. 1995-06-23. Well, the above has a different set of
% problems. Namely, array_liml of the result is the first
% element of the argument to the IN. This leads to array_liml of
% 3 in FOR I IN 3,5... 
% So, until SISAL 90 shows up, I'm stuck with going back to the
% earlier scheme.
%
%
% As of 1995-03-22, I have restored the fragments to their
% previous state in dconj and madverbs, since they seem to
% run somewhat slower this way and I did not observe the 
% desired speedup.
%
%Fragment     dot 000           Inner product on scalar-scalar
%Fragment plusdot 000           Inner product on scalar-scalar
%Fragment mpydot  000           Inner product on scalar-scalar
%Fragment maxdot  000           Inner product on scalar-scalar
%Fragment mindot  000           Inner product on scalar-scalar
%Fragment ordot   000           Inner product on scalar-scalar
%Fragment anddot  000           Inner product on scalar-scalar
function $FNAME(x: $XTYPE; y: $YTYPE returns $ZTYPE)
 $FRVALUE{{x}{y}}
end function

%Fragment     dot 010           Inner product on scalar-vector
%Fragment plusdot 010           Inner product on scalar-vector
%Fragment mpydot  010           Inner product on scalar-vector
%Fragment maxdot  010           Inner product on scalar-vector
%Fragment mindot  010           Inner product on scalar-vector
%Fragment ordot   010           Inner product on scalar-vector
%Fragment anddot  010           Inner product on scalar-vector
function $FNAME(x: $XTYPE; 
                y1: array[$YTYPE] 
                returns $ZTYPE)
   for y in y1
   returns value of $FLVALUE{{$FRVALUE{{x}{y}}}}
   end for 
end function

%Fragment dot     021           Inner product on scalar-matrix
%Fragment plusdot 021           Inner product on scalar-matrix
%Fragment mpydot  021           Inner product on scalar-matrix
%Fragment maxdot  021           Inner product on scalar-matrix
%Fragment mindot  021           Inner product on scalar-matrix
%Fragment ordot   021           Inner product on scalar-matrix
%Fragment anddot  021           Inner product on scalar-matrix
function $FNAME(x0: $XTYPE; 
                y2: array[array[$YTYPE]] 
                returns array[$ZTYPE])
$CASEBL{UNDER CONSTRUCTION}

% end of CASEBL

$CASETRAN{
% CDC STAR Algorithm again. Pay no attention to the case name.
% We do not bother transposing right argument. 1996-04-10
% There may be virtue in adopting this for rank 2, 2

 function vvr(x1: array[$XTYPE]; y1: array[$ZTYPE]
  returns array[$ZTYPE])
  % vector-vector reduction step for matrix
  array_setl(for x0 in x1 dot y0 in y1 returns array of $FL{{x0}{y0}}
  end for,SISALIO)
 end function % vvr

 function svprod(x0: $XTYPE; y1: array[$YTYPE] 
  returns array [$ZTYPE])
  for y0 in y1 returns array of $FRVALUE{{$XTto$CT(x0)}{$YTto$CT(y0)}} end for
 end function

% Arguments assumed non-empty

for initial 
  lim := array_limh(y2);
  z:=  svprod(x0,y2[SISALIO]);
  i:= SISALIO+1;
while i <= lim repeat 
  i := old i + 1; 
  z:=vvr(old z, svprod(x0,y2[old i]));
 returns value of z
end for
% End caseTRAN ... even though it is STAR
}

$CASEQUICKSTOP0{
% Do NOT transpose right argument. Short circuit row/col operation if we
% hit a zero for the left. E.g., ' '^.=M and get a mismatch.
% This works on any f.g with Boolean result from g and 
% f is and/min/times.
let
 c0:= array_liml(y2[SISALIO]);
 c := array_limh(y2[SISALIO]);
in
%
for j in c0,c
  S:= for initial
   k := array_liml(y2);
   lim := array_limh(y2);
   while if (k>lim) then false 
         else ($FRVALUE{{x0}{y2[k,j]}}) end if repeat 
   k := old k+1;
   returns value of k=lim
   end for  
 returns array of S
 end for
end let  % end of caseQUICKSTOP0
}
%
$CASEQUICKSTOP1{
% DO NOT transpose right argument. Short circuit row/col operation if we
% hit a one. E.g., ' ' or.notequal M gets non-blank in M column,
% as in DTB2.
% This works on any f.g with Boolean result from g and 
% f is or/max.
let
 c0:= array_liml(y2[SISALIO]);
 c := array_limh(y2[SISALIO]);
in
%
for j in c0,c
   S:= for initial
    k := array_liml(y2);
    lim := array_limh(y2);
    while if (k>lim) then false 
          else 
          ~($FRVALUE{{x0}{y2[k,j]}}) end if
    repeat 
     k := old k+1;
     returns value of lim >= k
    end for  
  returns array of S
  end for
end let  % end of caseQUICKSTOP1
}

end function

%Fragment     dot 032           Inner product on scalar-rank-3
%Fragment plusdot 032           Inner product on scalar-rank-3
%Fragment mpydot  032           Inner product on scalar-rank-3
%Fragment maxdot  032           Inner product on scalar-rank-3
%Fragment mindot  032           Inner product on scalar-rank-3
%Fragment ordot   032           Inner product on scalar-rank-3
%Fragment anddot  032           Inner product on scalar-rank-3
function $FNAME(x: $XTYPE; 
                y3: array[array[array[$YTYPE]]]
                returns array[array[$ZTYPE]])
  for y2 in y3
   for y1 in y2
    for y in y1
    returns array of $FLVALUE{{$FRVALUE{{x}{y}}}}
    end for
   end for
  end for
end function

%Fragment     dot 100           Inner product on vector-scalar
%Fragment plusdot 100           Inner product on vector-scalar
%Fragment mpydot  100           Inner product on vector-scalar
%Fragment maxdot  100           Inner product on vector-scalar
%Fragment mindot  100           Inner product on vector-scalar
%Fragment ordot   100           Inner product on vector-scalar
%Fragment anddot  100           Inner product on vector-scalar
function $FNAME(x1: array[$XTYPE]; 
                y: $YTYPE 
                returns $ZTYPE)
 for x in x1
 returns value of $FLVALUE{{$FRVALUE{{x}{y}}}}
 end for 
end function

%Fragment     dot 110           Inner product on vector-vector
%Fragment plusdot 110           Inner product on vector-vector
%Fragment mpydot  110           Inner product on vector-vector
%Fragment maxdot  110           Inner product on vector-vector
%Fragment mindot  110           Inner product on vector-vector
%Fragment ordot   110           Inner product on vector-vector
%Fragment anddot  110           Inner product on vector-vector
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]
                returns $ZTYPE)
 for x in x1 dot y in y1
    returns value of $FLVALUE{{$FRVALUE{{x}{y}}}}
   end for 
end function

%Fragment     dot 121           Inner product on vector-matrix
%Fragment plusdot 121           Inner product on vector-matrix
%Fragment mpydot  121           Inner product on vector-matrix
%Fragment maxdot  121           Inner product on vector-matrix
%Fragment mindot  121           Inner product on vector-matrix
%Fragment ordot   121           Inner product on vector-matrix
%Fragment anddot  121           Inner product on vector-matrix
function $FNAME(x1: array[$XTYPE]; 
                y2: array[array[$YTYPE]] 
                returns array[$ZTYPE])
 
% Boolean left argument

$CASEBL{  
% CDC STAR Algorithm 
function opa12(x1: array[$XTYPE];
 y2: array[array[$YTYPE]]
 returns array[$FRZTYPE])

% CDC STAR algorithm. This takes scalars from the left
% and applies them scalar-vector to rows of the right,
% then vector-vector reduces those into the result.
%
function SumColumns(y2: array[array[$FRZTYPE]] returns array[$ZTYPE])

% start of code ripped from madverbs1 1995-02-14

 function vvr(x1: array[$ZTYPE];  % Master copy lives in madverbs1
% NOT REALLY: CHANGES FOR COERCIONS, ETC UGH.
              y1: array[$YTYPE]
              returns array[$ZTYPE])
  % vector-vector reduction step for matrix
   array_setl(for x0 in x1 dot  y0 in y1
    returns array of $FLVALUE{{x0}{(y0)}}
   end for,SISALIO)
 end function % vvr  

 % Following is wrong. Want (_1 take rho y)rho 0
 if IsEmpty(y2) % case of 0 5 rho 0
   then array_fill(0,-1,$FLID) % Gives empty vector !!
   else  % Not empty on first axis
 
  % Reduce vector with vector. Wed like to figure a way to
  % to this in parallel, but not today... 1996-02-11

    for initial
     i := array_liml(y2);
     z1 := array_fill(array_liml(y2[0]),array_limh(y2[0]),$FLID); 
     while i <= array_limh(y2) repeat 
     i:= old i +1;
     z1 := vvr(old z1,y2[old i])
     returns value of z1
    end for
 end if 

% end of code ripped from madverbs1 1995-02-14

end function  % SumColumns 

 let  
  ab := for x0 in x1 at i returns array of
% Left argument is boolean selector for 
% right argument, as in or.and, +.times, +.and, or.times
   y2[i] when x0
   end for
  in
   SumColumns(ab)
  end let
end function
   
  opa12(x1,y2)

% End caseBL
}
%
$CASEQUICKSTOP0{
% Transpose right argument. Short circuit row/col operation if we
% hit a zero for the left. E.g., char^.=char and get a mismatch.
% This works on any f.g with Boolean result from g and 
% f is and/min/times.
let
 r0:= array_liml(y2);
 r := array_limh(y2);
 c0:= array_liml(y2[r0]);
 c := array_limh(y2[r0]);
 y2prime := for i in c0,c cross j in r0,r
 returns array of y2[j,i]
 end for
in
% This fragment is probably wrong. See scalar.matrix for better code.
for j in c0,c
  S:= for initial
   k := array_liml(x1);
   lim := array_limh(x1);
   while (($FRVALUE{{x1[i,old k]}{y2prime[j,old k]}})  & (old k <= lim)) repeat 
   k := old k+1;
   returns value of k=lim                       
   end for  
 returns array of S
 end for
end let  % end of caseQUICKSTOP0
}
%
$CASEQUICKSTOP1{
% Transpose right argument. Short circuit row/col operation if we
% hit a one. E.g., char or.=char and get a match.
% This works on any f.g with Boolean result from g and 
% f is or/max.
let
 r0:= array_liml(y2);
 r := array_limh(y2);
 c0:= array_liml(y2[r0]);
 c := array_limh(y2[r0]);
 y2prime := for i in c0,c cross 
                j in r0,r
            returns array of y2[j,i]
            end for
in
%
% This fragment is probably wrong. See scalar.matrix for better code.
for j in c0,c
   S:= for initial
    k := array_liml(x1);
    lim := array_limh(x1);
    while (~($FRVALUE{{x1[old k]}{y2prime[j,old k]}})  & (old k <= lim)) repeat 
    k := old k+1;
    returns value of k~=lim
    end for  
  returns array of S
  end for
end let  % end of caseQUICKSTOP1
}
%
$CASETRAN{
% CDC STAR Algorithm again. Pay no attention to the case name.
% We do not bother transposing right argument. 1996-04-10
% There may be virtue in adopting this for rank 2, 2

% vector-matrix. Do this fast.
 
 function vvr(x1: array[$XTYPE]; y1: array[$YTYPE]
  returns array[$ZTYPE])
  % vector-vector reduction step for matrix
  array_setl(for x0 in x1 dot y0 in y1 returns array of $FL{{x0}{y0}}
  end for,SISALIO)
 end function % vvr

 function svprod(x0: $XTYPE; y1: array[$YTYPE] 
  returns array [$ZTYPE])
  for y0 in y1 returns array of $FRVALUE{{x0}{y0}} end for 
 end function

% Arguments assumed non-empty

for initial 
  z:=  svprod(x1[array_liml(x1)],y2[array_liml(y2)]);
  i:= array_liml(x1)+1;
  lim:= array_limh(x1);
  limdif := array_liml(y2)-array_liml(x1); % SISALIO differences
while i <= lim repeat 
  i := old i +1; 
  z:=vvr(old z, svprod(x1[old i],y2[limdif+ old i]));
 returns value of z
end for
% End caseTRAN ... even though it is STAR
}

end function

%
%Fragment     dot 132           Inner product on vector-rank-3
%Fragment plusdot 132           Inner product on vector-rank-3
%Fragment mpydot  132           Inner product on vector-rank-3
%Fragment maxdot  132           Inner product on vector-rank-3
%Fragment mindot  132           Inner product on vector-rank-3
%Fragment ordot   132           Inner product on vector-rank-3
%Fragment anddot  132           Inner product on vector-rank-3
function $FNAME(x1: array[$XTYPE]; 
                y3: array[array[array[$YTYPE]]] 
                returns array[array[$ZTYPE]])
for y2 in y3
 T2:= for y1 in y2
  T1:= for x in x1 dot y in y1
       returns value of $FLVALUE{{$FRVALUE{{x}{y}}}}
       end for 
      returns array of T1
      end for
  returns array of T2
 end for
end function

%Fragment     dot 201           Inner product on matrix-scalar
%Fragment plusdot 201           Inner product on matrix-scalar
%Fragment mpydot  201           Inner product on matrix-scalar
%Fragment maxdot  201           Inner product on matrix-scalar
%Fragment mindot  201           Inner product on matrix-scalar
%Fragment ordot   201           Inner product on matrix-scalar
%Fragment anddot  201           Inner product on matrix-scalar
function $FNAME(x2: array[array[$XTYPE]]; 
                y: $YTYPE 
                returns array[$ZTYPE])
   for x in x1 
    returns value of $FLVALUE{{$FRVALUE{{x}{y}}}}
   end for 
end function

%Fragment     dot 211           Inner product on matrix-vector
%Fragment plusdot 211           Inner product on matrix-vector
%Fragment mpydot  211           Inner product on matrix-vector
%Fragment maxdot  211           Inner product on matrix-vector
%Fragment mindot  211           Inner product on matrix-vector
%Fragment ordot   211           Inner product on matrix-vector
%Fragment anddot  211           Inner product on matrix-vector
function $FNAME(x2: array[array[$XTYPE]]; 
                y1: array[$YTYPE]
                returns array[$ZTYPE])
for x1 in x2 returns array of
   for x in x1 dot y in y1
    returns value of $FLVALUE{{$FRVALUE{{$XTto$CT(x)}{$YTto$CT(y)}}}}
   end for 
end for
end function


%Fragment     dot 222           Inner product on matrix-matrix
%Fragment plusdot 222           Inner product on matrix-matrix
%Fragment mpydot  222           Inner product on matrix-matrix
%Fragment maxdot  222           Inner product on matrix-matrix
%Fragment mindot  222           Inner product on matrix-matrix
%Fragment ordot   222           Inner product on matrix-matrix
%Fragment anddot  222           Inner product on matrix-matrix
function $FNAME(x2: array[array[$XTYPE]]; 
                y2: array[array[$YTYPE]]
                returns array[array[$ZTYPE]])
$CASEBL{
% CDC STAR Algorithm 
function opa12(x1: array[$XTYPE];
 y2: array[array[$YTYPE]]
 returns array[$FRZTYPE])

% CDC STAR algorithm. This takes scalars from the left
% and applies them scalar-vector to rows of the right,
% then vector-vector reduces those into the result.
%
function SumColumns(y2: array[array[$FRZTYPE]] returns array[$ZTYPE])

% Combine the rows of matrix y2
% start of code ripped from madverbs1 1995-02-14

 function vvr(x1: array[$ZTYPE];  % Master copy lives in madverbs1
              y1: array[$YTYPE]
              returns array[$ZTYPE])
  % vector-vector reduction step for matrix
   array_setl(for x0 in x1 dot  y0 in y1
    returns array of $FLVALUE{{x0}{(y0)}}
   end for,SISALIO)
 end function % vvr  

 % Following is wrong. Want (_1 take rho y)rho 0
 if IsEmpty(y2) % case of 0 5 rho 0
   then array_fill(array_liml(y2),array_limh(y2),$FLID) % Gives empty vector !!
   else  % Not empty on first axis
 
  % Reduce vector with vector. Wed like to figure a way to
  % to this in parallel, but not today... 1996-02-11

    for initial
     i := array_liml(y2);   
     z1 := array_fill(array_liml(y2[i]),array_limh(y2[i]),$FLID); 
     while i <= array_limh(y2) repeat 
     i:= old i +1;
     z1 := vvr(old z1,y2[old i])
     returns value of z1
    end for
 end if 

% end of code ripped from madverbs1 1995-02-14
end function  % SumColumns 

 let  
% This for loop appears OK for array_liml. 1995-06-23

  ab := for x0 in x1 at i returns array of
% Left argument is boolean selector for 
% right argument, as in or.and, +.times, +.and, or.times
   y2[i] when x0
   end for
  in
   SumColumns(ab)
  end let
end function

  for x1 in x2
   returns array of opa12(x1,y2)
  end for % End caseBL
}
%
$CASEQUICKSTOP0{
% Transpose right argument. Short circuit row/col operation if we
% hit a zero for the left. E.g., char^.=char and get a mismatch.
% This works on any f.g with Boolean result from g and 
% f is and/min/times.
let
 ryl := array_liml(y2);
 ryh := array_limh(y2);
 cyl := array_liml(y2[ryl]);
 cyh := array_limh(y2[ryl]);
 rxl := array_liml(x2);
 rxh := array_limh(x2);
 y2prime := for i in cyl,cyh cross j in ryl,ryh
 returns array of y2[j,i]
 end for
in
%
for i in rxl,rxh cross j in cyl,cyh
    S:= for initial
     xl  := rxl;
     k   := ryl;
     lim := ryh;
     while (($FRVALUE{{x2[i,k-1]}{y2prime[j,k-1]}})  & (k < lim)) repeat 
     k := old k+1;
     returns value of k=lim                       
     end for  
   returns array of S
   end for
end let  % end of caseQUICKSTOP0
}
%
$CASEQUICKSTOP1{
% Transpose right argument. Short circuit row/col operation if we
% hit a one. E.g., char or.=char and get a match.
% This works on any f.g with Boolean result from g and 
% f is or/max.
let
 ryl := array_liml(y2);
 ryh := array_limh(y2);
 cyl := array_liml(y2[ryl]);
 cyh := array_limh(y2[ryl]);
 rxl := array_liml(x2);
 rxh := array_limh(x2);
 y2prime := for i in cyl,cyh cross 
                j in ryl,ryh
            returns array of y2[j,i]
            end for
in
%
for i in rxl,rxh cross j in cyl,cyh
    S:= for initial
     xl  := rxl;
     k   := ryl;
     lim := ryh;
     while (~($FRVALUE{{x2[i,k-1]}{y2prime[j,k-1]}})  & (k < lim)) repeat 
     K := old k+1;
     returns value of k~=lim
     end for  
   returns array of S
   end for
end let  % end of caseQUICKSTOP1
}
%

$CASETRAN{function dotprodvv(x1:array[double_real]; y1:array[double_real]
returns double_real)
% This does vector-vector dot product 
 for initial 
  k:=0;
  red:=$FLID; % Identity element for reduction  
  lim:= array_limh(x1);
while k<=lim  repeat
  red:= $FLVALUE{{old red}{$FRVALUE{$XTto$CT(x1[old k])}{$YTto$CT(y1[old 
k])}}};
  k:= old k+1;
  returns value of red 
end for
end function

let
 ryl := array_liml(y2);
 ryh := array_limh(y2);
 cyl := array_liml(y2[ryl]);
 cyh := array_limh(y2[ryh]);
 rxl := array_liml(x2);
 rxh := array_limh(x2);
 y2prime := for i in cyl,cyh cross
 j in ryl,ryh
 returns array of y2[j,i]
 end for
in
for y1 in y2 at i cross j in cyl,cyh
returns array of dotprodvv(x2[i],y2prime[j])
end for
end let 
% end of caseTRAN}

end function

%Fragment     dot 233           Inner product on vector-rank-3
%Fragment plusdot 233           Inner product on vector-rank-3
%Fragment mpydot  233           Inner product on vector-rank-3
%Fragment maxdot  233           Inner product on vector-rank-3
%Fragment mindot  233           Inner product on vector-rank-3
%Fragment ordot   233           Inner product on vector-rank-3
%Fragment anddot  233           Inner product on vector-rank-3
function $FNAME(x2: array[array[$XTYPE]]; 
                y3: array[array[array[$YTYPE]]]
                returns array[array[array[$ZTYPE]]])

??? underconstruction

end function

