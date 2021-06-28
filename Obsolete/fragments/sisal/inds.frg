% Code fragments for indexed assign
% 1995-09-28
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%
% The rank specifiers after the fragment name are the ranks of
% x,i,y in x[i]<-y
% An x in the rank specifier means an elided index, eg:
%  vector[]<-scalar will be 1x0.
%
% NB. This differs from the naming convention in the fns!
%
% Keyword definitions:

% $FNAME: The name of the SISAL function being produced for this
%         code fragment. Its name will depend on the types and
%         ranks of lhs, rhs, and list i.

% $SFNAME: The name of the SISAL subfunction being invoked for this
%         code fragment. Its name will depend on the types and ranks
%         of lhs,rhs, and 1 drop list i.

% $XTYPE: The type of lhs, e.g., double_real

% $XT:    The type abbreviation of lhs, e.g., D  (for double_real)

% $YTYPE: The type of rhs, e.g., integer

% $YT:    The type abbreviation of rhs, e.g., I (for integer)

% $ITYPE0: The type of the first element of list i.

% $ITYPE1: The rank & types of the remaining elements of list i.
%
% List i is the list of thingies in the brackets.
%
%
% Start of fragments for indexing of vector lhs
%
%Fragment inds 1x0           Vector[]<-scalar
function $FNAME(lhs: array[$XTYPE];
                rhs: $YTYPE
                returns array[$XTYPE])
array_fill(0,array_limh(lhs), $YTto$XT(rhs))
end function

%Fragment inds 1x1           Vector[]<-vector
function $FNAME(lhs: array[$XTYPE];
                rhs: array[$YTYPE]
                returns array[$XTYPE])
% Need length check on vector lengths here.
for i in 0,array_limh(lhs)
returns array of $YTto$XT(rhs[i])
end for
end function

%Fragment inds 1x2           Vector[]<-matrix
function $FNAME(lhs: array[$XTYPE];
                rhs: array[array[$YTYPE]]
                returns array[$XTYPE])
% Need length check on shapes here. This is valid
% only when the matrix has a 1 in its shape vector.
UNDER CONSTRUCTION
end function

%Fragment inds 1x3           Vector[]<-rank3
function $FNAME(lhs: array[$XTYPE];
                rhs: array[array[array[$YTYPE]]]
                returns array[$XTYPE])
UNDER CONSTRUCTION
end function

%Fragment inds 100           Vector[scalar]<-scalar
function $FNAME(lhs: array[$XTYPE];
                ia0: $ITYPE0;
                rhs: $YTYPE;
                returns array[$XTYPE])
lhs[$IT0toI(ia0)-QUADIO: $YTto$XT(rhs)]
end function

%Fragment inds 110           Vector[vector]<-scalar
function $FNAME(lhs: array[$XTYPE];
                ia0:  array[$ITYPE0];
                rhs: $YTYPE;
                returns array[$XTYPE])
 for initial  
   i:= 0;     
   z:= lhs;   
   lim:= array_limh(ia0);   
  while i<=lim repeat       
   indx:= $IT0toI(ia0[old i]);
   z:= old z[indx-QUADIO: $YTto$XT(rhs)];
   i:= old i +1;            
   returns value of z       
  end for     
end function

%Fragment inds 111           Vector[vector]<-vector
function $FNAME(lhs: array[$XTYPE];
                ia0:  array[$ITYPE0];
                rhs: array[$YTYPE];
                returns array[$XTYPE])
 for initial  
   i:= 0;     
   z:= lhs;   
   lim:= array_limh(ia0);   
  while i<=lim repeat       
   indx:= $IT0toI(ia0[old i]);
   z:= old z[indx-QUADIO: $YTto$XT(rhs[old i])];
   i:= old i +1;            
   returns value of z       
  end for     
end function


%Fragment inds 101           Vector[scalar]<-vector
%Fragment inds 102           Vector[scalar]<-matrix
%Fragment inds 103           Vector[scalar]<-rank3
%Fragment inds 112           Vector[vector]<-matrix
%Fragment inds 113           Vector[vector]<-rank3
%Fragment inds 120           Vector[matrix]<-scalar
%Fragment inds 121           Vector[matrix]<-vector
%Fragment inds 122           Vector[matrix]<-matrix
%Fragment inds 123           Vector[matrix]<-rank3
%Fragment inds 130           Vector[rank3 ]<-scalar
%Fragment inds 131           Vector[rank3 ]<-vector
%Fragment inds 132           Vector[rank3 ]<-matrix
%Fragment inds 133           Vector[rank3 ]<-rank3
function $FNAME
UNDERCONSTRUCTION
end function


% Start of fragments for indexing matrix lhs

%Fragment inds 200           Matrix[scalar;ia1]<-scalar
function $FNAME(lhs: array[array[$XTYPE]];
                ia0:  $ITYPE0;
                $IA1{{}{ia1: $IRT1;}}
                rhs: $YTYPE;
                returns array[array[$XTYPE]])
let 
 i:= $IT0toI(ia0)-QUADIO;
in
 lhs[i: $SFCALL{{$SFNAME(lhs[i],rhs)}
                {$SFNAME(lhs[i],ia1,rhs)}}]
end let
end function


%Fragment inds 210           Matrix[vector;ia1]<-scalar
function $FNAME(lhs: array[array[$XTYPE]];
                ia0:  array[$ITYPE0];
                $IA1{{}{ia1: $IRT1;}}
                rhs: $YTYPE;
                returns array[array[$XTYPE]])

 for initial  
   i:= 0;     
   z:= lhs;   
   lim:= array_limh(ia0);   
  while i<=lim repeat       
   indx:= $IT0toI(ia0[old i])-QUADIO;
   z:= old z[indx: 
        $SFCALL{{$SFNAME(old z[indx],rhs)}
                {$SFNAME(old z[indx],ia1,rhs)}}];
   i:= old i +1;            
   returns value of z       
  end for     
end function

%Fragment inds 211           Matrix[vector;ia1]<-vector
function $FNAME(lhs: array[array[$XTYPE]];
                ia0:  array[$ITYPE0];
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[$YTYPE];
                returns array[array[$XTYPE]])

 for initial  
   i:= 0;     
   z:= lhs;   
   lim:= array_limh(ia0);   
  while i<=lim repeat       
   indx:= $IT0toI(ia0[old i])-QUADIO;
   z:= old z[indx: $SFCALL{{$SFNAME(old z[indx],rhs[old i])}
                        {$SFNAME(old z[indx],ia1,rhs[old i])}}];
   i:= old i +1;            
   returns value of z       
  end for     
end function

%Fragment inds 2x0           Matrix[;ia]<-scalar
function $FNAME(lhs: array[array[$XTYPE]];
                $IA1{{}{ia1: $IRT1;}}
                rhs: $YTYPE;
                returns array[array[$XTYPE]])

 for i in 0,array_limh(lhs)
 returns array of
  $SFCALL{{$SFNAME(lhs[i],rhs)}
          {$SFNAME(lhs[i],ia1,rhs)}}
 end for     
end function

%Fragment inds 2x1           Matrix[;ia]<-vector
function $FNAME(lhs: array[array[$XTYPE]];
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[$YTYPE];
                returns array[array[$XTYPE]])

 for i in 0,array_limh(lhs)
 returns array of
  $SFCALL{{$SFNAME(lhs[i],rhs[i])}
          {$SFNAME(lhs[i],ia1,rhs[i])}}
 end for     
end function

%Fragment inds 2x2           Matrix[;ia]<-matrix
function $FNAME(lhs: array[array[$XTYPE]];
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[array[$YTYPE]];
                returns array[array[$XTYPE]])

 for i in 0,array_limh(lhs)
 returns array of
  $SFCALL{{$SFNAME(lhs[i],rhs[i])}
          {$SFNAME(lhs[i],ia1,rhs[i])}}
 end for     
end function

%Fragment inds 2x3           Matrix[;ia]<-rank3
function $FNAME(lhs: array[array[$XTYPE]];
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[array[array[$YTYPE]]];
                returns array[array[$XTYPE]])

 for i in 0,array_limh(lhs)
 returns array of
  $SFCALL{{$SFNAME(lhs[i],rhs[i])}
          {$SFNAME(lhs[i],ia1,rhs[i])}}
 end for     
end function

%Fragment inds 212           Matrix[vector;ia]<-matrix
% next few fragments the same as this except for ia1 type
function $FNAME(lhs: array[array[$XTYPE]];
                ia0: array[$ITYPE0];
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[array[$YTYPE]];
                returns array[array[$XTYPE]])
 for initial  
   i:= 0;     
   z:= lhs;   
   lim:= array_limh(ia0);   
  while i<=lim repeat       
   indx:= $IT0toI(ia0[old i])-QUADIO;
   z:= old z[indx: $SFCALL{{rhs[old i]}
                        {$SFNAME(old z[indx],ia1,rhs[old i])}}];
   i:= old i +1;            
   returns value of z       
  end for     
end function

%Fragment inds 213           Matrix[vector;ia]<-rank3
function $FNAME(lhs: array[array[$XTYPE]];
                ia0: array[$ITYPE0];
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[array[array[$YTYPE]]];
                returns array[array[$XTYPE]])
 for initial  
   i:= 0;     
   z:= lhs;   
   lim:= array_limh(ia0);   
  while i<=lim repeat       
   indx:= $IT0toI(ia0[old i])-QUADIO;
   z:= old z[indx: $SFCALL{{rhs[old i]}
                        {$SFNAME(old z[indx],ia1,rhs[old i])}}];
   i:= old i +1;            
   returns value of z       
  end for     
end function

%Fragment inds 201           Matrix[scalar;ia]<-vector
function $FNAME(lhs: array[array[$XTYPE]];
                ia0: $ITYPE0;
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[$YTYPE];
                returns array[array[$XTYPE]])
let 
 i:= $IT0toI(ia0)-QUADIO;
in
 lhs[i: $SFCALL{{rhs}
                {$SFNAME(lhs[i],ia1,rhs[i])}}]
end let
end function

%Fragment inds 202           Matrix[scalar;ia]<-matrix
function $FNAME(lhs: array[array[$XTYPE]];
                ia0: $ITYPE0;
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[array[$YTYPE]];
                returns array[array[$XTYPE]])
let 
 i:= $IT0toI(ia0)-QUADIO;
in
  lhs[i: $SFCALL{{rhs}
                {$SFNAME(lhs[i],ia1,rhs[i])}}]
end let
end function

%Fragment inds 203           Matrix[scalar;ia]<-rank3
function $FNAME(lhs: array[array[$XTYPE]];
                ia0: $ITYPE0;
                $IA1{{}{ia1: $IRT1;}}
                rhs: array[array[array[$YTYPE]]];
                returns array[array[$XTYPE]])
let 
 i:= $IT0toI(ia0)-QUADIO;
in
  lhs[i: $SFCALL{{rhs}
          {$SFNAME(lhs[i],ia1,rhs[i])}}]
end let
end function


%Fragment inds 221           Matrix[matrix;ia]<-vector
%Fragment inds 222           Matrix[matrix;ia]<-matrix
%Fragment inds 223           Matrix[matrix;ia]<-rank3
function $FNAME(x: integer returns integer)
UNDERCONSTRUCTION
end function


% Start of fragments for indexing rank3 lhs

%Fragment inds 300           Rank3[scalar;ia;ia]<-scalar
%Fragment inds 310           Rank3[vector;ia;ia]<-scalar
%Fragment inds 320           Rank3[matrix;ia;ia]<-scalar
%Fragment inds 330           Rank3[rank3 ;ia;ia]<-scalar
%Fragment inds 301           Rank3[scalar;ia;ia]<-vector
%Fragment inds 311           Rank3[vector;ia;ia]<-vector
%Fragment inds 321           Rank3[matrix;ia;ia]<-vector
%Fragment inds 331           Rank3[rank3 ;ia;ia]<-vector
%Fragment inds 302           Rank3[scalar;ia;ia]<-matrix
%Fragment inds 312           Rank3[vector;ia;ia]<-matrix
%Fragment inds 322           Rank3[matrix;ia;ia]<-matrix
%Fragment inds 332           Rank3[rank3 ;ia;ia]<-matrix
%Fragment inds 303           Rank3[scalar;ia;ia]<-rank3
%Fragment inds 313           Rank3[vector;ia;ia]<-rank3
%Fragment inds 323           Rank3[matrix;ia;ia]<-rank3
%Fragment inds 333           Rank3[rank3 ;ia;ia]<-rank3
function $FNAME(x: integer returns integer)
UNDERCONSTRUCTION
end function


