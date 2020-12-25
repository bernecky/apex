% Niladic system functions: QUADav and QUADts
%
% Robert Bernecky 2007-05-20
%
% --------------- QUADts fragments ----------------------------
%Fragment quadts xx1  x x i .
inline $ZTYPE[.] $FNAME()
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
inline char[256] $FNAME()
{ /* QUADav - system character set */
 z = with{
        ([0] <= [i] < [256]) : _toc_S_(i);
        } : genarray( [256], ' ');
 return(z);
}

