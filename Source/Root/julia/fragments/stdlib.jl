# TODO: Add STDLIB 

# (This stuff below is temporary)

toB(x) = convert(Bool, x)
toI(x) = convert(Int64, x)
toD(x) = convert(Float64, x)
toC(x) = convert(Complex, x)
toc(x) = convert(Complex, x)

BtoB(x) = x
ItoI(x) = x
DtoD(x) = x
CtoC(x) = x

BtoI(x) = convert(Int64, x)
BtoD(x) = convert(Float64, x)
ItoB(x) = convert(Bool, x)
ItoD(x) = convert(Float64, x)
DtoB(x) = convert(Bool, x)
DtoI(x) = convert(Int64, x)