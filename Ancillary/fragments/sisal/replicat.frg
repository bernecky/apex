% Code fragments for replicate and expand
% 1995-07-04 / rbe
% Expand added 1996-02-07 /rbe
% Supports either user index origin 1996-03-26 /rbe
% Attempts to enhance loop fusion 1996-03-26 /rbe
% Supports arbitrary SISAL index origin 1996-04-01 /rbe
% Uses new fragment naming scheme
% Fragment header:
%  jsymbol ranks:xyz lefttype righttype resulttype 
%  1       2         3        4         5         
%Fragment sl 001 b b b Compress scalar-scalar
%Fragment sl 001 b i i Compress scalar-scalar
%Fragment sl 001 b d d Compress scalar-scalar
%Fragment sl 001 b c c Compress scalar-scalar
%Fragment sl 001 i b b Replicate scalar-scalar
%Fragment sl 001 i i i Replicate scalar-scalar
%Fragment sl 001 i d d Replicate scalar-scalar
%Fragment sl 001 i c c Replicate scalar-scalar
%Fragment sl 001 d b b Replicate scalar-scalar
%Fragment sl 001 d i i Replicate scalar-scalar
%Fragment sl 001 d d d Replicate scalar-scalar
%Fragment sl 001 d c c Replicate scalar-scalar
% Scalar replicate scalar 
function $FNAME(x0: $XTYPE;
                y0: $YTYPE 
                returns array[$ZTYPE])  
array_fill(SISALIO,SISALIO+$XTtoI(x0)-1,y0);
end function

%Fragment sl 111 b b b Compress vector-vector
%Fragment sl 111 b i i Compress vector-vector
%Fragment sl 111 b d d Compress vector-vector
%Fragment sl 111 b c c Compress vector-vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE] 
                returns array[$ZTYPE])  
% True compression
 array_setl(for x0 in x1 at i
            returns array of y1[i] when x0
            end for,SISALIO)
end function

%Fragment sl 111 i b b Replicate vector-vector
%Fragment sl 111 i i i Replicate vector-vector
%Fragment sl 111 i d d Replicate vector-vector
%Fragment sl 111 i c c Replicate vector-vector
%Fragment sl 111 d b b Replicate vector-vector
%Fragment sl 111 d i i Replicate vector-vector
%Fragment sl 111 d d d Replicate vector-vector
%Fragment sl 111 d c c Replicate vector-vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE] 
                returns array[$ZTYPE])  
% Simple replicate 
 array_setl(for x0 in Conform1(x1,$XTYPE,y1) at i
  returns value of catenate
  array_fill(SISALIO,SISALIO+(ConformNonNegativeInt($XTtoI(x0)))-1,y1[i])
 end for,SISALIO)
end function

%Fragment sl 011 b b b Compress scalar-vector
%Fragment sl 011 b i i Compress scalar-vector
%Fragment sl 011 b d d Compress scalar-vector
%Fragment sl 011 b c c Compress scalar-vector
function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
if x0 then y1 else RemHFast(y1,SISALIO-1) end if
end function

%Fragment sl 011 i b b Replicate scalar-vector
%Fragment sl 011 i i i Replicate scalar-vector
%Fragment sl 011 i d d Replicate scalar-vector
%Fragment sl 011 i c c Replicate scalar-vector
%Fragment sl 011 d b b Replicate scalar-vector
%Fragment sl 011 d i i Replicate scalar-vector
%Fragment sl 011 d d d Replicate scalar-vector
%Fragment sl 011 d c c Replicate scalar-vector
%Fragment sl 011 c b b Replicate scalar-vector
%Fragment sl 011 c i i Replicate scalar-vector
%Fragment sl 011 c d d Replicate scalar-vector
%Fragment sl 011 c c c Replicate scalar-vector
function $FNAME(x0: $XTYPE;
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
 let
   n := ConformNonNegativeInt($XTtoI(x0));
 in
   array_setl(for y0 in y1
   returns value of catenate array_fill(SISALIO,SISALIO+n-1,y0)
   end for,SISALIO)
 end let
end function

%Fragment sl 022 b b b Compress scalar-matrix
%Fragment sl 022 b i i Compress scalar-matrix
%Fragment sl 022 b d d Compress scalar-matrix
%Fragment sl 022 b c c Compress scalar-matrix
function $FNAME(x0: $XTYPE;
                y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
if x0 then y2 else 
 for y1 in y2 returns array of
  RemHFast(y1,SISALIO-1) 
 end for
end if
end function 

%Fragment sl 022 i b b Replicate scalar-matrix
%Fragment sl 022 i i i Replicate scalar-matrix
%Fragment sl 022 i d d Replicate scalar-matrix
%Fragment sl 022 i c c Replicate scalar-matrix
%Fragment sl 022 d b b Replicate scalar-matrix
%Fragment sl 022 d i i Replicate scalar-matrix
%Fragment sl 022 d d d Replicate scalar-matrix
%Fragment sl 022 d c c Replicate scalar-matrix
%Fragment sl 022 c b b Replicate scalar-matrix
%Fragment sl 022 c i i Replicate scalar-matrix
%Fragment sl 022 c d d Replicate scalar-matrix
%Fragment sl 022 c c c Replicate scalar-matrix
function $FNAME(x0: $XTYPE;
                y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
 let
   n := ConformNonNegativeInt($XTtoI(x0));
 in
  for y1 in y2 returns array of
   array_setl(for y0 in y1
   returns value of catenate array_fill(SISALIO,SISALIO+n-1,y0)
   end for,SISALIO)
  end for
 end let
end function

%Fragment sl 122 b b b Replicate vector-matrix
%Fragment sl 122 b i i Replicate vector-matrix
%Fragment sl 122 b d d Replicate vector-matrix
%Fragment sl 122 b c c Replicate vector-matrix
%Fragment sl 122 i b b Replicate vector-matrix
%Fragment sl 122 i i i Replicate vector-matrix
%Fragment sl 122 i d d Replicate vector-matrix
%Fragment sl 122 i c c Replicate vector-matrix
%Fragment sl 122 d b b Replicate vector-matrix
%Fragment sl 122 d i i Replicate vector-matrix
%Fragment sl 122 d d d Replicate vector-matrix
%Fragment sl 122 d c c Replicate vector-matrix
function $FNAME(x1: array[$XTYPE];
                y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])
% Vector-matrix replicate

 function vvrep(x1: array[$XTYPE];
                y1: array[$YTYPE];
                returns array[$YTYPE])
 % vector-vector replicate
 array_setl(for x0 in Conform1(x1,$XTYPE,y1) at i
 returns value of catenate 
  array_fill(SISALIO,SISALIO+ConformNonNegativeInt($XTtoI(x0))-1,y1[i])
 end for,SISALIO)
 end function % vvrep

for y1 in y2 returns array of
 vvrep(x1,y1)
end for
end function

%Fragment sl 101 b b b Compress vector-scalar
%Fragment sl 101 b i i Compress vector-scalar
%Fragment sl 101 b d d Compress vector-scalar
%Fragment sl 101 b c c Compress vector-scalar
%Fragment sl 101 i b b Replicate vector-scalar
%Fragment sl 101 i i i Replicate vector-scalar
%Fragment sl 101 i d d Replicate vector-scalar
%Fragment sl 101 i c c Replicate vector-scalar
%Fragment sl 101 d b b Replicate vector-scalar
%Fragment sl 101 d i i Replicate vector-scalar
%Fragment sl 101 d d d Replicate vector-scalar
%Fragment sl 101 d c c Replicate vector-scalar
function $FNAME(x1: array[$XTYPE];
                y0: $YTYPE
                returns array[$ZTYPE])  
  function SumNonNeg(x1: array[$XTYPE] returns integer)
  for x0 in x1
  returns sum of ConformNonNegativeInt($XTtoI(x0))
  end function

 array_fill(SISALIO,SISALIO+SumNonNeg(x1)-1,y0)
end function


% ------------------ Code fragments for first axis replicate -----------

%Fragment sl1 022 i b b Replicate scalar-matrix first axis
%Fragment sl1 022 i i i Replicate scalar-matrix first axis
%Fragment sl1 022 i d d Replicate scalar-matrix first axis
%Fragment sl1 022 i c c Replicate scalar-matrix first axis
%Fragment sl1 022 d b b Replicate scalar-matrix first axis
%Fragment sl1 022 d i i Replicate scalar-matrix first axis
%Fragment sl1 022 d d d Replicate scalar-matrix first axis
%Fragment sl1 022 d c c Replicate scalar-matrix first axis
%Fragment sl1 022 c b b Replicate scalar-matrix first axis
%Fragment sl1 022 c i i Replicate scalar-matrix first axis
%Fragment sl1 022 c d d Replicate scalar-matrix first axis
%Fragment sl1 022 c c c Replicate scalar-matrix first axis

function $FNAME(x0: $XTYPE;
                y2: array[array[$YTYPE]] 
                returns array[array[$ZTYPE]])

let
   n := ConformNonNegativeInt($XTtoI(x0));
in
 array_setl(for y1 in y2 returns value of catenate
  for i in 1,n returns array of y1
  end for
 end for,SISALIO)
end let
end function




% ------------------------ Expand code fragments ----------------------
%
% Code fragments for expand
%

%Fragment bsl 111 b b b vector\vector
%Fragment bsl 111 b i i vector\vector
%Fragment bsl 111 b d d vector\vector
%Fragment bsl 111 b c c vector\vector
%Fragment bsl 111 i b b vector\vector
%Fragment bsl 111 i i i vector\vector
%Fragment bsl 111 i d d vector\vector
%Fragment bsl 111 i c c vector\vector
%Fragment bsl 111 d b b vector\vector
%Fragment bsl 111 d i i vector\vector
%Fragment bsl 111 d d d vector\vector
%Fragment bsl 111 d c c vector\vector
function $FNAME(x1: array[$XTYPE];
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
  function SumNonNeg(x1: array[$XTYPE] returns integer)
  for x0 in x1
   returns value of sum ConformNonNegativeInt($XTtoI(x0))
  end for
  end function

 array_setl( for initial 
  i := SISALIO;
  j := SISALIO + ConformSame(array_size(y1),SumNonNeg(x1))-
      array_size(y1); % Silliness to get length error
  z := array $YT1 [];
  lim := SISALIO+array_size(x1)-1;
 while i <= lim repeat
  i := old i+1;
  curel := $XTtoB(x1[old i]);   % Current element of lharg
  j := old j + if curel then 1 else 0 end if;
  z:= array_addh(old z, if curel then y1[old j] else $OTFILL end if);
  returns value of z
 end for,SISALIO)
end function

