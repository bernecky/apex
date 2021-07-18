#=
Monadic miscfns
Will eventually handle:
     shape, index generator, matrix inverse,
     dex, nubsieve, thorn
Robert Bernecky 2007-05-13
=#

#Fragment iota x01 x bidc i .
function $FNAME(y::$YTYPE, QUADio)::UnitRange{Int64}
    # Index generator on scalar
    # HELP! Needs domain check for negative shp
    return QUADio .+ 0:y-1
end

#Fragment iota x01 x bidc i NonNeg
function $FNAMENonNeg($YTYPE y, QUADio)
    # Index generator on ScalarN when N is non-negative integer
    return QUADio .+ 0:y-1
end

#Fragment iota x11 x bidc i .
function $FNAME($YTYPE[1] y, QUADio)
    # Index generator on 1-element vector =#
    # HELP! Needs length error check =#
    # HELP! Needs domain check for negative shp =#
    return QUADio .+ 0:y-1
end

#Fragment iota x11 x bidc i NonNeg
function $FNAMENonNeg(y, QUADio)
    # Index generator on 1-element vector, known to be non-negative integer
    # z = 0+collect(toi(y[[0]]));
    return QUADio .+ 0:y-1
end

#Fragment ltak *** x bidc bidc .
function $FNAME(y) 
    # Dex on anything
    return y
end

#Fragment rho x01 x bidc i . 
function $FNAME(y) 
    # Shape of scalar 
    return size(y)
end

#Fragment rho x** x bidc i .
function $FNAME(y) 
    # Shape of non-scalar =#
    return size(y)
end

#Fragment quad x** x bidc bidc .
function $FNAME(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    println(y)
    return y
end