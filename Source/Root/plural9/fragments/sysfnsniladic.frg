% Niladic system functions: QUADav and QUADts
%
% Robert Bernecky 2012-01-29 Plural code generator
%
% --------------- QUADts fragments ----------------------------
%Fragment quadts xx1  x x i .
$ZTYPE $FNAME()
{ /* QUADts - system timestamp */
  /* FIXME: This should be changed to double, so we can report nanoseconds */
 ts, nsec = gettime();
 secs = to_time(ts);
 d = mday(secs);
 m = mon (secs);
 y = year(secs);
 h,mi,s = clock(secs);
 z = [y + 1900, m + 1 , d, h, mi, s, nsec/1000000];
 return(z);
}

% --------------- QUADav fragment ----------------------------
%Fragment quadav xx1  x x c .
$ZTYPE $FNAME()
{ /* QUADav - system character set */
 auto z = Parray( [256]);
 
 foreach( i; 0 .. 256) {
   z[i] = cast(char) i;
 }
 return(z);
}

