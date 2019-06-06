% Code fragments for monadic derived functions, including
% scans, and cuts. These do non-last axis ONLY.
% NB. Replicate and expand live in replica1.frg
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%
%Fragment  sl1  x21        Reduction of matrix along first axis
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[$ZTYPE])

 function vvr(x1: array[$ZTYPE];
              y1: array[$YTYPE]
              returns array[$ZTYPE])
  % vector-vector reduction step for matrix
   array_setl(for x0 in x1 dot  y0 in y1
    returns array of $FVALUE{{x0}{$YCOER(y0)}}
   end for,SISALIO)
 end function % vvr  

 % Following is wrong. Want (_1 take rho y)rho 0
 if IsEmpty(y2) % case of 0 5 rho 0
   then array_fill(0,-1,$FRID) % Gives empty vector !!
   else  % Not empty on first axis
 
  % Reduce vector with vector. We would like to figure a way to
  % to this in parallel, but not today... 1996-02-11

   for initial
     i := 0;   
     z1 := array_fill(0,array_limh(y2[0]),$FRID); 
     while i <= array_limh(y2) repeat 
     i:= old i +1;
     z1 := vvr(old z1,y2[old i])
     returns value of z1
    end for
 end if 
end function
 
%Fragment  bsl1  x21        Scan of matrix along first axis
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[$ZTYPE])

 function vvr(x1: array[$ZTYPE];
              y1: array[$YTYPE]
              returns array[$ZTYPE])
  % vector-vector reduction step for matrix
    array_setl(for x0 in x1 dot  y0 in y1
     returns array of $FVALUE{{x0}{$YCOER(y0)}}
    end for,SISALIO)
 end function % vvr  

% Scan on empties is identity.

 if IsEmpty(y2) = 0 % case of 0 5 rho 0
   then array_fill(0,-1,$FRID) % Gives empty vector !!
   else  % Not empty on first axis

  % Scan vector with vector. We would like to figure a way to
  % to this in parallel, but not today... 1996-02-11
   
    for initial
     i := 0;   
     z1 := array_fill(0,array_limh(y2[0]),$FRID); 
     while i <= array_limh(y2) repeat 
     i:= old i +1;
     z1 := vvr(old z1,y2[old i])
     returns array of z1
    end for
 end if 
end function
 

