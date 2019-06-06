
% NONONONONNO Use the macros!

% Code fragments for take and drop
%
% Robert Bernecky 1995-03-29
% Totally reworked after discussions with Pat Miller on preallocation
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%

% %%%%%%%%%%%%%%%%%%% take %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fragment take 001             scalar take scalar
% Note to rbe: This should eventually be enhanced so that Boolean take
% is special cased. 
function $FNAME(x0: $XTYPE; 
                y0: $YTYPE
                returns array[$ZTYPE])
 let 
  xi  := $XTtoI(x0);
  len := abs(xi);
  z:=array_fill(SISALIO,len+SISALIO-1,$OTFILL);
  pos := if xi = len 
         then 0 else len-1
         end if;
 in
   z[SISALIO+pos:y0]
 end let
end function

%
%Fragment take 011             scalar take vector
function $FNAME(x0: $XTYPE; 
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
% Note to rbe: This should eventually be enhanced so that Boolean take
% is special cased. 
% Cases:
% error, identity, positive/negative overtake, positive/negative undertake


let 
 cols := $XTtoI(x0);
 colsy := array_size(y1);
in
% Identity
 if abs(cols) = array_size(y1) then y1
 else
% Undertake and overtake
  let
   % 0-origin index of first element fetched from y1
    first :=  if cols >= 0 then 0 
                     else max(0,cols+colsy)
                     end if;
    len := min(abs(cols),max(0,colsy-first));  % # of y elements
    fill := abs(cols) - len; % # fill elements
    prefill, postfill :=
       if cols >0 then 0,fill else fill,0 end if;
    in
     array_fill(SISALIO,SISALIO+prefill-1,$OTFILL)
     ||
     VECTORTAKEDROP(y1,first,len)
     || 
     array_fill(SISALIO,SISALIO+postfill-1,$OTFILL)
    end let
  end if
end let
end function

%
%Fragment take 111             vector take vector
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
% Cases:
% error, identity, positive/negative overtake, positive/negative undertake
let 
 % Detect length error on left argument
 cols := $XTtoI(x1[ConformSame(SISALIO,array_limh(x1))]);
 colsy := array_size(y1);
in
% Identity
 if abs(cols) = array_size(y1) then y1
 else
% Undertake and overtake
  let
   % 0-origin index of first element fetched from y1
    first :=  if cols >= 0 then 0 
                     else max(0,cols+colsy)
                     end if;
    len := min(abs(cols),max(0,colsy-first));  % # of y elements
    fill := abs(cols) - len; % # fill elements
    prefill, postfill :=
       if cols >0 then 0,fill else fill,0 end if;
    in
     array_fill(SISALIO,SISALIO+prefill-1,$OTFILL)
     ||
     VECTORTAKEDROP(y1,first,len)
     || 
     array_fill(SISALIO,SISALIO+postfill-1,$OTFILL)
    end let
  end if
end let
end function

%
%Fragment take 122             vector take matrix
function $FNAME(x1: array[$XTYPE]; 
                y2: array[array[$YTYPE]]
                returns array[array[$ZTYPE]])
% Cases:
% identity, positive/negative overtake, positive/negative undertake
% We know from dfa that x1 has two elements. 
% Ergo, no length error possible
 let 
  xrows := $XTtoI(x1[SISALIO]); % NO IPSA EXTENSIONS TODAY!
  zrows := abs(xrows);
  xcols := $XTtoI(x1[SISALIO+1]);
  zcols := abs(xcols);
  yrows := array_size(y2);          % # rows    in y2
  ycols := array_size(y2[SISALIO]); % # columns in y2
 in
  if (zrows = yrows) & (zcols = ycols) then y2 % Identity
  else  % Must do actual work.
   let   
    % Offset of upper left corner of y2 subcube within result
    frow := if xrows >= 0 then 0 else yrows+xrows end if;
    fcol := if xcols >= 0 then 0 else ycols+xcols end if;
    fillrows := zrows - yrows;
    fillcols := zcols - ycols;
   in
    array_setl(
    if fillrows <= 0 & fillcols <= 0 % Undertake vs overtake
    then % Undertake case
      for r in frow,frow+zrows-1 returns array of
      VECTORTAKEDROP(y2[r],fcol,zcols)
      end for

    else % Overtake case
     let 
      % Build long rowfiller if we need it. Otherwise,
      % build stubby one to save time.
      rlen := if fillrows ~= 0 then zcols else 0 end if;
      rowfill := array_fill(SISALIO,SISALIO+rlen-1,$OTFILL); % Extra row fill
     in
      array_fill(SISALIO,SISALIO+max(0,fillrows)-1,rowfill) %leading rows
      ||
       % Do possible overtakes on columns. 
       % Check for identity on column width
       if fillcols = 0 
       then y2 
       else
          for y1 in y2 returns array of 
          array_fill(SISALIO,SISALIO+max(0,-fillcols)-1,$OTFILL) % leading cols
          ||
          VECTORTAKEDROP(y1,fcol,zcols-abs(fillcols))
          || 
          array_fill(SISALIO,SISALIO+max(0,fillcols)-1,$OTFILL) % trailing cols
         end for
       end if
      || 
      array_fill(SISALIO,SISALIO+max(0,-fillrows)-1,rowfill) % trailing rows
     end let
    end if % Undertake vs overtake
    ,SISALIO) % outer array_setl 
   end let % Actual work
  end if % Identity vs real work
 end let
end function 


%% ------------------------ drop code fragments ------------------------
%
%Fragment drop 011             scalar drop vector
function $FNAME(x0: $XTYPE; 
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
% Cases:
% identity, positive/negative drop
let 
 drp := $XTtoI(x0); % Drop count
in
    if (drp = 0) then y1 % Identity
    else
     let
      colsy := array_size(y1);
      count := max(0,colsy-abs(drp)); % # elements in result
      liml := if drp > 0  % Origin-0 limits
       then min(drp,colsy) else 0 end if;
     in
      VECTORTAKEDROP(y1,liml,count)
     end let
    end if
end let
end function

%
%Fragment drop 111             vector drop vector
function $FNAME(x1: array[$XTYPE]; 
                y1: array[$YTYPE] 
                returns array[$ZTYPE])
% Cases:
% error, identity, positive/negative drop
% Identity
let 
 drp := $XTtoI(x1[ConformSame(0,array_limh(x1))]); % Drop count
in
   if (drp = 0) then y1 % Identity
   else
    let
     colsy := array_size(y1);
     count := max(0,colsy-abs(drp)); % # elements in result
     liml := if drp > 0  % Origin-0 limits
      then min(drp,colsy) else 0 end if;
    in
     VECTORTAKEDROP(y1,liml,count)
    end let
   end if
end let
end function

%
%Fragment drop 122             vector drop matrix
function $FNAME(x1: array[$XTYPE]; 
                y2: array[array[$YTYPE]]
                returns array[array[$ZTYPE]])
% Cases:
% identity, positive/negative drop
% Identity and error check

let 
 drows := $XTtoI(x1[SISALIO+ConformSame(2,array_size(x1))-2]); % drop counts
 dcols := $XTtoI(x1[SISALIO+1]);
 zrows := max(0,array_size(y2)-abs(drows));          % # rows in result
 zcols := max(0,array_size(y2[SISALIO])-abs(dcols)); % # cols in result
 firstrow := if drows <= 0 then 0 else drows end if;  % first result row, col
 firstcol := if dcols <= 0 then 0 else dcols end if;
 yrows := array_size(y2);
 ycols := array_size(y2[SISALIO]);
in
 if (zrows = yrows) & (zcols = ycols) 
  then y2   % Identity
  else      % Must do some real work
   let 
   % First, we drop off unneeded rows. Then, we drop each
   % column as needed.
    newy2 := if (zrows = yrows) then y2 % (0,x) drop y2
             else VECTORTAKEDROP(y2,firstrow,zrows)
             end if;
   in % Now do drop on each row
    if (zcols = ycols) then newy2 % (x,0) drop y2
    else array_setl( % Reset the SISAL array origin
         for y1 in newy2 
         returns array of VECTORTAKEDROP(y1,firstcol,zcols)
         end for
         ,SISALIO)
    end if
   end let
  end if % Identity on y2
end let
end function

