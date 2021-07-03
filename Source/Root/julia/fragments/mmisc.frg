#=
Monadic miscfns
Will eventually handle:
     shape, index generator, matrix inverse,
     dex, nubsieve, thorn
Robert Bernecky 2007-05-13
=#

#Fragment iota x01 x bidc i .
function $FNAME($YTYPE y, int QUADio)
    # Index generator on scalar
    # HELP! Needs domain check for negative shp
    z = QUADio+iota(toi(y))
    return z;
end

#Fragment iota x01 x bidc i NonNeg
function $FNAMENonNeg($YTYPE y, int QUADio)
    # Index generator on ScalarN when N is non-negative integer
    z = QUADio+iota(toi(y))
    return z;
end

#Fragment iota x11 x bidc i .
function $FNAME($YTYPE[1] y, int QUADio)
    # Index generator on 1-element vector =#
    # HELP! Needs length error check =#
    # HELP! Needs domain check for negative shp =#
    z = QUADio+iota(toi(y[[0]]));
    return z;
end

#Fragment iota x11 x bidc i NonNeg
function $FNAMENonNeg(y, int QUADio)
    # Index generator on 1-element vector, known to be non-negative integer
    if ()
    z = QUADio+iota(toi(y[[0]]));
    return z;
end

#Fragment ltak *** x bidc bidc .
function $FNAME(y) 
    # Dex on anything
    return y;
end

#Fragment rho x01 x bidc i . 
function $FNAME(y) 
    # Shape of scalar 
    return size(y);
end

#Fragment rho x** x bidc i .
function $FNAME(y) 
    # Shape of non-scalar =#
    return size(y);
end

#Fragment quad x** x bidc bidc .
function $FNAME(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    print(y)
end