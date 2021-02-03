% Niladic system functions: QUADav and QUADts
%
% Robert Bernecky 2007-05-20
%
% --------------- QUADts fragments ----------------------------
%Fragment quadts xx1  x x i .
inline $ZTYPE[.] $FNAME()
{ // QUADts - system time-of-day timestamp 
  // This function provides system time in ISO 8601 format,
  // via CLOCK_REALTIME.
  // It may not be the best way to measure elapsed time. For that,
  // see documentation for clock_gettime, using CLOCK_MONOTONIC.
 sec, nsec = gettime(); // From Stdlib module RTClock 
 secs = to_time(toi(sec));
 d = mday(secs);
 m = mon (secs);
 y = year(secs);
 h,mi,s = clock(secs);
 z = [y + 1900, m + 1 , d, h, mi, s, toi(nsec)/1000000];
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

