# TODO: Add STDLIB 

# (This stuff below is temporary)

toB(x) = Bool(x)
function toI(x)
    if(isa(x, Array))
        convert.(Int64, x)
    else 
        Int64(x)
    end
end
toD(x) = Float64(x)
toC(x) = Complex(x)
toc(x) = Complex(x)

BtoB(x) = x
ItoI(x) = x
DtoD(x) = x
CtoC(x) = x

BtoI(x) = Int64(x)
BtoD(x) = Float64(x)
ItoB(x) = Bool(x)
ItoD(x) = Float64(x)
DtoB(x) = Bool(x)
DtoI(x) = Int64(x)