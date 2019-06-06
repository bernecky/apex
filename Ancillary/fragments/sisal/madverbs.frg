% Code fragments for monadic derived functions, including
% scans, and cuts. These do LAST axis ONLY.
%
% This supports arbitrary user array index origin 1996-03-26 /rbe

% NB. Replicate and expand are located in replicat.frg
%
%Fragment sl x00          Reduction of a scalar (nop)
function $FNAME(y: $YTYPE returns $ZTYPE)                  
 y
end function                                                                   

%Fragment sl x10          Reduction of a vector
function $FNAME(y1: array[$YTYPE] 
                returns $ZTYPE)                  
for y in y1
  returns value of $FRVALUE{{y}}
end for
end function                                                                   

%Fragment  sl  x21        Reduction of matrix along last axis
function $FNAME(y2: array[array[$YTYPE]] 
                returns array[$ZTYPE])
  for y1 in y2
    t1 := for y in y1
          returns value of $FRVALUE{{y}}
          end for
  returns array of t1
  end for
end function
 
%Fragment  sl  x32        Reduction of rank-3 along last axis        
function $FNAME(y3: array[array[array[$YTYPE]]]
                returns array[array[$ZTYPE]])

  function VecReduce (y1: array[$YTYPE];
                      returns $ZTYPE)
    for y in y1 
     returns value of $FRVALUE{{y}}
    end for
  end function

 function MatReduce (y2: array[array[$YTYPE]];
                     returns array[$ZTYPE])
   for y1 in y2
    returns array of VecReduce(y1)
   end for
 end function

% Whew. Finally we can do some work.
   for y2 in y3
    returns array of MatReduce(y2)
   end for
end function
 

