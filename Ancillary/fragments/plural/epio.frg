% Code fragments for search functions
% These include x iota y, x epsilon y, x epsbar y
%
% Rewritten for Plural 2012-01-29 Robert Bernecky

%Fragment iota 111 bi bi i PV
Parray *$FNAMEPV( Parray * x, Parray * y$SYSVARGDECL)
{
/* FIXME! How does a PV interact with QUADio? */
/* Build the index table. This is lots faster than an upgrade,
 *  and we also do not have to do binary search.
 * We make the table one element bigger than needed, and
 * put the not-found index in it.
 */

 /* Build table as: tbl[i] = x iota i  */
 tbl = with {
         ( . <= iv <= .)
                : shape(x)[[0]]+QUADio;
        } : genarray([1]+shape(x));
 tbl = with { 
        ( . <= iv <= .)
                : y[iv];
        }: modarray(shape(x), iv[[0]]);

/* Now, we can index the table with elements of the
 * right argument, giving their location in x.
 * We need a range check, though...
 */

 z = with {
        (. <= iv <= .) {
                v = max($YTto$CT(y[iv]),0);
                v = min(v,shape(x)); /* Note that tbl is 1 element
                                        than x, so this is OK.  */
                } : tbl[[v]];
        } : genarray(shape(y)l);
 return(z);
}

%Fragment iota 100  bic bic i .
$ZTYPE $FNAME(Parray * x, $YTYPE y$SYSVARGDECL)
{ /* Non-fuzzy Vector iota Scalar */
  auto shpx = x.getShp();
  auto valx = x.get$CT();
  z = shpx;
  for( auto i=0; i<shpc; i++) {
    if (eqDDB($XTto$CT(x[[i]]),$YTto$CT(y),QUADct)){
      z = i;
      i = shpx;
    }
 }
 return(z+QUADio);
}

%Fragment iota 100  d d i .
$ZTYPE $FNAME(Parray * x, $YTYPE y$SYSVARGDECL)
{ /* Fuzzy Vector iota Scalar */
  auto shpx = x.getShp();
  auto valx = x.get$CT();
  z = shpx;
  for( auto i=0; i<shpc; i++) {
    if (eqDDB($XTto$CT(x[[i]]),$YTto$CT(y),QUADct)){
      z = i;
      i = shpx;
    }
 }
 return(z+QUADio);
}
%Generate , eq, DDB, 000, ., $CT

%Fragment iota 1** b bid i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
/* FIXME: This should be busted into scalar and non-scalar
 * D cases, because we have Parray for non-scalar Y and int otherwise.
 */
{ /* Boolean iota number */
  /* Right argument almost always scalar */
  /* However, we'll do more work for the nonce, because it's easy */
  sx = shape(x)[[0]];
  table = [sx, sx, sx];
  table[[0]] = BooleanIotaScalar(x, false);
  table[[1]] = BooleanIotaScalar(x, true);
  z = with {
        (. <= iv <= .){ 
                if (toi( y[iv]) == 0) {
                        index = 0;
                } else if (toi( y[iv]) == 1) {
                        index = 1;
                } else {
                        index = 2;
                }
                } : table[[index]];
        } : genarray( shape(y), -666);
  return(z + QUADio);
}
%Generate , BooleanIotaScalar , BBI, 1**, ., $CT

%Fragment BooleanIotaScalar 1** b b i .
int BooleanIotaScalar( Parray *x, bool y)
{ 
  sx = x.getB().length;
  z = sx;
  for (i=0; i<sx; i++) {
    if( x[[i]] == y) {
      z = i;
      i = sx;
    }
  } 
  return(z);
}

%Fragment iota 100 c c i QUADAV
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* QUADav iota character scalar */
 return($YTtoI(y)+QUADio);
}

%Fragment iota 1** c c i QUADAV
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* QUADav iota character non-scalar */
  FIXME;
  z = z + QUADio;
 return(z);
}

%Fragment iota 1** c c i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Character vector iota character non-scalar */
 FIXME;
 table = genarray([256],shape(x)[[0]]); /* Not found */
 for(i=shape(x)[[0]]-1; i>=0; i--)
        table[toi(x[[i]])] = i;
 z = with {
        (. <= iv <= .)
                : table[[toi(y[iv])]];
        }: genarray(shape(y), 0);
 return(z+QUADio);
}

%Fragment iota 1** bid bid i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{
/* General case uses crude search today. Sorry */
 FIXME;
 z = [42];
 z = z + QUADio;
 return(z);
}
%Generate , UpgradeHeap , X$YTI,   X10, ., $CT
%Generate , BinarySearch, $XT$YTI, 110, ., $CT
%Generate , MinMatch    , $XT$YTI, 110, ., $CT
%Generate , EPIORemoveDups    , $XT$YTI, 110, ., $CT

%Fragment EPIORemoveDups 110 bidc bidc i .
int[] EPIORemoveDups ($XTYPE x, int[] PV)
{ /* Remove dups from PV of sorted left argument to indexof(right arg of membership */
 FIXME;
 z = PV; 
 shp = (shape(PV))[[0]];
 if (0 != shp) {
        sink = 0;
        source = 1;
        while (source < shp) {
                if ( x[[z[[sink]]]] != x[[PV[[source]]]]) {
                        sink++;
                        z[[sink]] = PV[[source]];
                }
                source++;
        }
 z = take([sink+1], z);
 }
 return(z);
}

%Fragment BinarySearch 110 bidc bidc i . 
int BinarySearch($XTYPE x, $YTYPE y, int[] PV)
{ /* Binary search x[PV] for y
   * PV is a permutation vector guaranteed to bring y into
   * non-descending order
   * If not-found, result is shape(x) 
   */
 FIXME;
 found = false;
 first = 0;
 sx  = (shape(PV))[[0]];
 indx = -1;                   /* Bobbo kant kode if this appears! */
 last = sx - 1;
 while ((first <= last) && !found) {
        indx = (first+last)/2;  /* index of middle entry */
        xval = to$CT(x[[PV[[indx]]]]);
        yval = to$CT(y); /* This is wrong - type coercion may fail! */
        if (    yval == xval) {
                found = true;
        } else if (yval < xval) {
                last = indx - 1;
        } else {
                first = indx + 1;
        }
 }
 z = found ? indx : sx;
 return(z);
} 

%Fragment MinMatch 110 bidc bidc i .
int MinMatch ($XTYPE x, int[] PV, int i)
{ /* Search permutation vector for minimum match.
   * i is an index into PV. PV is a permutation vector for
   * x that places x in non-descending order.
   *  We want minimum index into x that matches x[[PV[[i]]]]
   *  Because upgrade is stable, we only have to look left
   *  (except for real/complex x with non-zero {quad}ct)
   */
 v = x[[PV[[i]]]];
 j = i - 1;
 r = i;
 while (j >= 0) {
        if ( v == x[[PV[[j]]]]) {
                r = j;        /* new minimum index */
        } else {
                j = -1;       /* no more matches. Stop */  
        }
        j = j - 1;
 }      
 return(r);
}  

%
% -------------------- epsilon fragments -----------------------------
%
%Fragment eps 000 bi bi b .
%Fragment eps 000 c  c  b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y)
{ /* Non-fuzzy membership SxS*/
  z = $XTto$CT(x) == $YTto$CT(y);
  return(z);
}

%Fragment eps 000 d d b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Fuzzy membership SxS */
 z = TEQ$CT($XTto$CT(x),$YTto$CT(y)$SYSVARGKER);
 return(z);
}

%Fragment eps 010  bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Non-fuzzy membership SxA */
 FIXME;
 z = [true];
 return(z);
}

%Fragment eps 010  d   d  b .
%Fragment eps 010  bi  d  b .
%Fragment eps 010  d  bi  b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Fuzzy membership SxA*/
  z = [true];
  return(z);
}
%Generate , eq, DDB, 000, ., $CT

%Fragment eps *0* bic bic b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Non-fuzzy membership AxS */
  z = [false];
  return(z);
}

%Fragment eps *0* bid d b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Fuzzy membership AxS */
  z = [false];
  return(z);
}
%Generate , eq, DDB, 000, ., $CT

%Fragment eps *** c c b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* character membership AxA*/
 FIXME;
 ry = comaX$YT$YT(y);
 tbl = genarray([256],false);
 for(i=0; i<shape(ry)[[0]]; i++) {
  tbl[[toi(ry[[i]])]] = true;
 }

 z = with { 
        (. <= iv <= .)
                : tbl[[toi(x[iv])]];
        } : genarray(shape(x), false);
 return(z);
}
%Generate , coma, X$YT$YT, X*1, ., $YT
 
%Fragment eps *** c c b QUADAV
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* A member QUADav. This is kinda silly... */
 FIXME;
 z = genarray(shape(x), true);
 return(z);
}

%Fragment eps *** bid c    b .
%Fragment eps *** c   bid  b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /* Char member non-char, and vice versa */
 FIXME;
 z = genarray(shape(x), false);
 return(z);
}

%Fragment eps *** bidc bidc bidc .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{ /*  Fuzzy, non-fuzzy Membership AxA*/
/* General case: uses HeapGrade */
FIXME;
 z = [true];
 return(z);
}
%Generate , UpgradeHeap , X$YTI,   X10, ., $CT
%Generate , BinarySearch, $XT$YTI, 110, ., $CT
%Generate , MinMatch    , $XT$YTI, 110, ., $CT
%Generate , EPIORemoveDups    , $XT$YTI, 110, ., $CT

% ------------------ ebar fragments -------------------------------

%
%
%Fragment epsb 111 bidc bidc b .
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{
WONTWORK
}
%
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE]
                returns array[boolean])

% We look for the left arg in the right arg.
% We should implement Boyer-Moore here, but time is
% tight. 1996-02-12
% This is OK for short phrases. Should have algorithm
% selector in code generator for this.

$SFCASES{{ % General case (0)
MATCHRESTVECTOR($XTYPE,$YTYPE,$XT,$YT,$CT)

 if IsEmpty(x1) then array_fill(0,array_limh(y1),true) % x1 empty
 else
 let 
  lasti := array_limh(y1) - array_limh(x1); % Last y1 index where
                                            % match can occur
 in
   for y0 in y1 at i returns array of
    if $XTto$CT(x1[0]) ~= $YTto$CT(y0) 
     % Quick out if no match on first character
      | i > lasti          % or past end of y1
    then false
    else MatchRestVector(x1,y1,i)
    end if
   end for
 end let
 end if
end function
}}
 
%
%Fragment epsb 122 bidc bidc b .
%
$ZTYPE $FNAME($XTYPE x, $YTYPE y$SYSVARGDECL)
{
}
function $FNAME(x1: array[$XTYPE]; 
                y2: array[$YTYPE]
                returns array[array[boolean]])

% We look for the left arg in the right arg.
% We should implement Boyer-Moore here, but time is
% tight. 1996-02-12
% This is OK for short phrases. Should have algorithm
% selector in code generator for this.
$SFCASES{{ % General case (0)

 MATCHRESTVECTOR($XTYPE,$YTYPE,$XT,$YT,$CT)

 if IsEmpty(x1) = 0 then 
     array_fill(array_fill(0,array_limh(y2),
        % Stupid empty array kludge needed here
          array_fill(0,array_limh(y2[0]),true) % x1 empty
 else
  for y1 in y2 returns array of 
   let 
    lasti := array_limh(y1) - array_limh(x1); % Last y1 index where
                                              % match can occur
   in
     for y0 in y1 at i returns array of
      if $XTto$CT(x1[0]) ~= $YTto$CT(y0) 
       % Quick out if no match on first character
        | i > lasti          % or past end of y1
      then false
      else MatchRestVector(x1,y1,i)
      end if
     end for
   end let
  end for
 end if
}}
end function

