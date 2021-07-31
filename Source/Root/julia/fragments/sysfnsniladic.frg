# Niladic system functions: QUADav and QUADts
#
# Robert Bernecky 2007-05-20
#
# --------------- QUADts fragments ----------------------------
#Fragment quadts xx1  x x i .
function $FNAME()::Array{$ZTYPE}
    # QUADts - system time-of-day timestamp 
    # This function provides system time in ISO 8601 format (but array),
    # via now(). See https://docs.julialang.org/en/v1/stdlib/Dates/

    z = Dates.format(now(), "Y m d H M S s") # Create Date
    z = convert(String, z) # Convert from DateTime type to String
    z = split(z, " ") # Convert from single String to Array of substrings
    z = parse.(Int64, z) # Convert Array of Substrings to Array of Ints
    return z
end

# --------------- QUADav fragment ----------------------------
#Fragment quadav xx1  x x c .
inline char[256] $FNAME()
{ #= QUADav - system character set =#
 z = with{
        ([0] <= [i] < [256]) : _toc_S_(i);
        } : genarray( [256], ' ');
 return(z);
}

