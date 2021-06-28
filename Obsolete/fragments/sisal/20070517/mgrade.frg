% Code fragments for monadic upgrade, downgrade
%
% Robert Bernecky 1995-10-08
%

%Fragment ugrd x11       Vector upgrade
function $FNAME(y1: array[$YTYPE] returns array[integer])

% Do APL upgrade of vector y1 using heapsort.
% This version from "Numerical Recipes in C", p. 249
% R. Bernecky 1996-12-15
% Code runs origin-1 and is a bit nasty to fix due to shifts.

  function CorrectOrigin(indx: array[integer] returns array[integer])
  % Convert an origin-1 array into an origin-sensitive array
  array_setl(for i in indx returns array of QUADIO+i-1 end for,SISALIO)
  end function

  function Heapness(y1: array[$YTYPE]; ix: array[integer]; L: integer;
                    ir: integer; q: $YTYPE; indxt: integer;
                    returns array[integer])
  % Reestablish heap invariant.
   for initial
    i:= L;   % Start at this parent node
    j:= i+i; % And this child node
    indx := ix;
   while j<=ir  repeat
    % Find larger sibling, but do not fall off end of array
    newj:= if (old j<ir) % do not fall off end of array
           then 
            let lsibp:=old indx[old j]; 
                lsib:=y1[lsibp]; 
                rsibp:=old indx[old j+1];
                rsib:=y1[rsibp];
            in
              if lsib>rsib then old j % Left sib bigger
              elseif lsib<rsib then 1+old j % Right sib bigger
              elseif lsibp<rsibp then 1+old j % Sibs match, but
              % we have to swap order to preserve stability of sort.
              else old j
              end if
             end let
            else old j 
            end if;

    % Swap parent with larger child, if parent smaller.
    bigsibp:= old indx[newj]; bigsib:=y1[bigsibp];
    indx, j, i := if (q<bigsib) % Parent smaller - swap
                  then old indx[old i: bigsibp], newj+newj, newj 
                  elseif (q>bigsib) % Parent bigger -- no swap
                      then old indx, ir+1, old i
                      elseif (indxt < bigsibp) % Parent=child -- stability
                      then old indx[old i: bigsibp], newj+newj, newj 
                      % Parent=child, but stable as is. No swap.
                      else old indx, ir+1, old i end if;
    returns value of indx[i:indxt]
    end for
  end function   

  function MakeHeap(y1: array[$YTYPE]; indx: array[integer]; n:integer;
                    returns array[$YTYPE], array[integer],integer)
  % results are y1,indx,n (y1 and n are unchanged)

  % Build heap from y1, using index array indx, with n elements.
  % We know y1 has at least 2 elements.
  let newindx:=
    for initial
     L := 1+n/2;
     ix := indx;
     ir := n;
    while L > 1 repeat
     L := old L-1;
     indxt := old ix[L];
     q:= y1[indxt];
     ix := heapness(y1,old ix,L,ir,q,indxt);
    returns value of ix
    end for;
  in  y1,newindx,n
  end let
  end function  

   
  function UnHeap(y1: array[$YTYPE]; indx: array[integer]; n:integer;
                    returns array[integer])
  % result is new indx array.
  % Extract elements from heap in sorted order
  % We know y1 has at least 2 elements.
  let newindx, indxt2 :=
    for initial
     L := 1;
     ix := indx;
     ir := n;
     indxt := -666; % Should not happen. Artifact of SISAL 
    while ir > 0 repeat
     ir := old ir -1;
     indxt := old ix[old ir];
     q:= y1[indxt];
     ix := heapness(y1,old ix[old ir:old ix[1]],L,ir,q,indxt);
    returns value of ix
            value of indxt
    end for;
  in  newindx[1: indxt2]
  end let
  end function  

% Heapgrade runs entirely in origin 1, to permit shifts and
% doubling to be used efficiently to obtain indices of children.
% When we get done, we correct the index origin.

let
n := array_size(y1);
indx := for i in 1,n returns array of i end for; % Initial value of result
in
CorrectOrigin(if n<=1
              then indx 
              else Unheap(MakeHeap(array_setl(y1,1),indx,n))
              end if)
end let
end function

%Fragment ugrdpv x11       Vector upgrade of partition vector
function $FNAME(y1: array[$YTYPE] returns array[integer])

% Do APL upgrade of permutation vector.
% This exploits array predicate astPredPV.
let 
 lim := array_size(y1)-1; 
% -666 in next line only there to detect coding errors in upgrade.
% Really, what we want is for holder to allocate space without
% filling in any values, as we replace them all in next loop.
 holder := for i in SISALIO,SISALIO+lim returns array of -666 end for;
in
 for initial
 i:= 0;
 z:= holder;
 while i<=lim repeat
  i:= old i+1;
  z:= old z[y1[SISALIO+old i]-QUADIO: old i+QUADIO];
  returns value of z
 end for
end let
end function

%Fragment dgrd x11       Vector downgrade
function $FNAME(y1: array[$XTYPE] returns array[integer])

under construction

end function


