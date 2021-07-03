#  Monadic query (roll) and Dyadic query (deal)
#
# Robert Bernecky 2006-07-27
# SAC code generator
#

#Fragment quer X00 x bid i .
inline $ZTYPE, int $FNAME($YTYPE y, int QUADio, int QUADrl)
{ #= Monadic query (roll) -  scalar =#
 inty = toi(y);
 if (inty <= 0) print(tochar("roll domain error"));
 QUADrl = Lehmer(QUADrl);
 z = (tod(QUADrl) * tod(inty)) / tod(2147483647);
 return(toi(z) + QUADio, QUADrl);
}
#Generate , Lehmer, $XT$YT$ZT, X00, ., I


#Fragment quer X** x bid i .
inline $ZTYPE[+], int $FNAME($YTYPE[+] y, int QUADio, int QUADrl)
{ #= Monadic query (roll) - non=scalar =#
 zxrho = prod(shape(y));
 ravely = reshape([zxrho], y);
 inty = toi(y);
 if (any(inty <= 0)) print(tochar("roll domain error"));
 #= The following presumes ordering, so we use FOR loop. Sorry =#
 z = genarray([zxrho], -1);
 for (i=0; i<zxrho; i++) {
        QUADrl = Lehmer(QUADrl);
        val = (tod(QUADrl) * tod(ravely[[i]])) / tod(2147483647);
        z[[i]] =  QUADio + toi(val);
 }
 z = reshape(shape(y), z);
 return(z, QUADrl);
}
#Generate , Lehmer, $XT$YT$ZT, X00, ., I


#Fragment quer 001  bid bid i .
inline $ZTYPE[.], int $FNAME($XTYPE x, $YTYPE y, int QUADio, int QUADrl)
{ #= Dyadic query (deal) - scalar =#
  #= This allocates an array of shape y. If this
   * causes you memory grief, use the algorithm in workspace 42 query,
   * or use smaller y!
   =#
 intx = toi(x);
 inty = toi(y);
 shpz = toi(x);
 z = iota (inty);

 for( i=0; i<intx; i++) {
        #= Interchange z[i] with z[i + ? y - i] =#
        rand, QUADrl = querXII(inty -i, 0, QUADrl);
        c = i + rand;
        if ( c < shpz) {
                tmp    = z[[c]];
                z[[c]] = z[[i]]; 
                z[[i]] = tmp;
        }
 }      
 z = take([intx], z);
 return(z + QUADio, QUADrl);
}
#Generate , quer, X$YT$ZT, X00, ., I 

#Fragment quer 111  bid bid i .
inline $ZTYPE[.], int $FNAME($XTYPE[.] x, $YTYPE[.] y, int QUADio, int QUADrl)
{ #= Dyadic query (deal) - non-scalar =#
 #= need length error check FIXME =#
 return(querIII(x[0],y[0],QUADio,QUADrl));
}
#Generate , quer, III, 000, ., I 

#Fragment quer 011  bid bid i .
inline $ZTYPE[.], int $FNAME($XTYPE x, $YTYPE[.] y, int QUADio, int QUADrl)
{ #= Dyadic query (deal) - non-scalar =#
 #= need length error check FIXME =#
 return(querIII(x,y[0],QUADio,QUADrl));
}
#Generate , quer, III, 000, ., I 

#Fragment quer 101  bid bid i .
inline $ZTYPE[.], int $FNAME($XTYPE[.] x, $YTYPE y, int QUADio, int QUADrl)
{ #= Dyadic query (deal) - non-scalar =#
 #= need length error check FIXME =#
 return(querIII(x[0],y,QUADio,QUADrl));
}
#Generate , quer, III, 000, ., I 
