% QUADfi and QUADvi code fragments for Plural
%
% Robert Bernecky 2012-01-29
%
% --------------- QUADfi fragments ----------------------------
%Fragment quadfi x01  x c d .
$ZTYPE[.] $FNAME($YTYPE y)
{ /* QUADfi on scalar */
 z = toi(y)-toi('0');
 z = z * toi((z>=0) & (z<=9));
 return([z]);
}

%Fragment quadfi x11  x c d .
$ZTYPE $FNAME($YTYPE y)
{ /* BROKEN!!!  QUADfi on vector */
zshape = with {
         ([0] <= iv < shape(y)-[1])
                : toi((' ' == y[iv]) && (' ' != y[iv+[1]]));
        } : fold(+, 0);
 zshape= zshape+1;
 z = genarray([zshape],-42.0);
 str = to_string(y);
 for(i=0; i<zshape; i++){
        v,str = strtod(str);
        z[i] = v;
        }
 return(z);
}

% --------------- QUADvi fragments ----------------------------
%
%Fragment quadvi x01  x c bid .
$ZTYPE $FNAME($YTYPE y)
{ /* QUADvi on scalar */
 z = toi( (y>='0') & (y<='9'));
 return([z]);
}

%Fragment quadvi x11  x c bid .
$ZTYPE $FNAME($YTYPE y)
{ /* QUADvi on vector */
zshape = with {
        ([0] <= iv < shape(y)-[1])
                : toi((' ' == y[iv]) && (' ' != y[iv+[1]]));
        } : fold(+, 0);
 zshape= zshape+1;
 z = genarray([zshape], false);
 str = to_string(y);
 for(i=0; i<zshape; i++){
        v,str = strtod(str);
        z[i] = 0.0 != v;
        }

 return(z);
}
