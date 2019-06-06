% Code fragments for outer product loop control.
% Robert Bernecky 1995-07-03

%Fragment  jotdot 000  Outer product on scalar scalar

function $FNAME(x0: $XTYPE; 
                y0: $YTYPE 
                returns $ZTYPE)
 returns value of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function

%Fragment  jotdot 011  Outer product on scalar vector

function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE]
                returns  array[$ZTYPE])
 for y0 in y1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function

%Fragment  jotdot 022  Outer product on scalar matrix

function $FNAME(x0: $XTYPE;
                y2: array[array[$YTYPE]]
                returns  array[array[$ZTYPE]])
for y1 in y0
returns array of 
 for y0 in y1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for  
end for
end function


%Fragment  jotdot 033  Outer product on scalar rank-3

function $FNAME(x0: $XTYPE;
                y3: array[array[array[$YTYPE]]]
                returns  array[array[array[$ZTYPE]]])
for y2 in y3
returns array of 
 for y1 in y0
  returns array of 
  for y0 in y1
  returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
  end for  
 end for
end for 
end function

%Fragment  jotdot 101  Outer product on vector scalar

function $FNAME(x1: array[$XTYPE];
                y1: $YTYPE
                returns  array[$ZTYPE])
 for x0 in x1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function

%Fragment  jotdot 202  Outer product on matrix scalar

function $FNAME(x2: array[array[$XTYPE]];
                y0: $YTYPE;
                returns  array[array[$ZTYPE]])
for x1 in x2
returns array of 
 for x0 in x1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for  
end for
end function

%Fragment  jotdot 303  Outer product on rank-3 scalar

function $FNAME(x3: array[array[array[$XTYPE]]];
                y0: $YTYPE;
                returns array[array[array[$ZTYPE]]])
for x2 in x3
returns array of 
 for x1 in x2
 returns array of 
  for x0 in x1
  returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
  end for  
 end for
end for
end function


%Fragment  jotdot 123  Outer product on vector matrix

function $FNAME(x1: array[$XTYPE];
                y2: array[array[$YTYPE]]
                returns array[array[array[$ZTYPE]]])
for y1 in y2
returns array of 
 for x0 in x1 cross y0 in y1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end for 
end function


%Fragment  jotdot 112  Outer product on vector vector

function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE]
                returns  array[array[$ZTYPE]])
 for x0 in x1 cross y0 in y1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function

%Fragment  jotdot 100  Outer product on vector scalar

function $FNAME(x1: array[$XTYPE]; 
                y0: $YTYPE
         returns array[$ZTYPE])
 for x0 in x1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function


%Fragment  jotdot 213  Outer product on matrix vector

function $FNAME(x2: array[array[$XTYPE]];
                y1: array[$YTYPE]
                returns array[array[array[$ZTYPE]]])
for x1 in x2
 for x0 in x1 cross y0 in y1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function

%Fragment  jotdot 123  Outer product on vector matrix

function $FNAME(x1: array[$XTYPE];
                y2: array[array[$YTYPE]]
                returns array[array[array[$ZTYPE]]])
for y1 in y2
 for x0 in x1 cross y0 in y1
 returns array of $FRVALUE{{$XCOER(x0)}{$YCOER(y0)}}
 end for 
end function

