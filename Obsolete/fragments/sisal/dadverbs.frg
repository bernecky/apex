% Code fragments for dyadic derived functions.
% As of 1995-10-28, this is window reduce only
% scans, and cuts.
% Attempts to improve loop fusionability. 1996-03-26/rbe
% Supports arbitrary user index origin
% SISAL arrays in are any origin.
% SISAL arrays out are random origin.

%Fragment sl 011          scalar window reduce vector
function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE];
                $GLOBALS
                returns array[$ZTYPE])
% This is overlapping windows with slices of length x0, no shards
% e.g., convolution
  for i in array_liml(y1),array_limh(y1)+1-x0
    S := array_setl(for j in i,i+x0-1
         returns array of y1[j]
         end for,SISALIO)
    returns array of $FRVALUE{{S}}
   end for
end function

%Fragment sl 111          vector window reduce vector
% The vector alpha must be 1 element, so the code for
% this case is essentially the same as for sl 011

function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE];
                $GLOBALS
                returns array[$ZTYPE])
% This is overlapping windows with slices of length x1, no shards
% e.g., convolution
% One-element window size, please
%
% Silliness below with ConformSame is to make sure x1 has 1 element.
% Then, we select the first element to get window size.
  let 
   x0 := x1[ConformSame(1,array_size(x1))-1] 
  in
   for i in array_liml(y1),array_limh(y1)+1-x0
    S := array_setl(for j in i,i+x0-1
         returns array of y1[j]
         end for,SISALIO)
    returns array of $FRVALUE{{S}}
   end for
  end let 
end function

