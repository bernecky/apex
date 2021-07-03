# Fragments for cut. 
# See compose for compositions
# See rank for rank operator
#
# Robert Bernecky 1995-02-16
#
# Attempt to remove loop fusion inhibitions 1996-03-26 /rbe
# Supports arbitrary user array index origin  1996-03-26 /rbe
#Fragment 3nuax 111 bidc bidc bidc 3cut
inline function $FNAME(x1: array[$XTYPE];
              y1: array[$YTYPE]
              returns array[$ZTYPE])
# This is overlapping windows with slices of length y1, no shards
# e.g., convolution
# One-element window size, please
#
let 
 qio := array_liml(x1);
 x0 := x1[ConformSame(qio,array_limh(x1))];
in
  for i in qio,1+array_limh(y1)-x0
   S := array_setl(for j in i,i+x0-1
        returns array of y1[j]
        end for,qio) 
   returns array of $FRVALUE{{}{S}}
  end for
end let 
end function

