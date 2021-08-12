# TODO: Module and export
module UTClock
export all

# Compiled by APEX Version: FIXME!! 2021-07-31 11:51:41.502
using Dates
# TODO: Add STDLIB 

# (This stuff below is temporary)

toB(x) = Bool(x)
toI(x) = Int64(x)
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
function barBBI(x::Bool, y::Bool)::Int64
  return BtoI(x)-BtoI(y)
end

function eqIIB(x::Int64, y::Int64)::Array{Bool}
  #= SxA scalar function =#
      # TODO
         z = eqIIB.(repeat([x], length(y)), ItoI(y))
      return z
end


function quadXII(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    println(y)
    return y
end
function rhoXII(y)
    # Shape of non-scalar =#
    return size(y)
end

function quadtsXXI()::Array{Int64}
    # QUADts - system time-of-day timestamp
    # This function provides system time in ISO 8601 format (but array),
    # via now(). See https://docs.julialang.org/en/v1/stdlib/Dates/

    z = Dates.format(now(), "Y m d H M S s") # Create Date
    z = convert(String, z) # Convert from DateTime type to String
    z = split(z, " ") # Convert from single String to Array of substrings
    z = parse.(Int64, z) # Convert Array of Substrings to Array of Ints
    return z
end

function indr(x::Array{Bool}, i::Int64)::Array{Bool}
    #= X[scalarI;;;] =#
    #= Used only in conjunction with other indexing, e.g.,
    # X[scalarI;;j;]
    =#
    z = x[i]
    return z
end




function eqIIB(x::Int64, y)::Bool
    #= A=B on non-doubles =#
    # Always just compare first element?
    return Int64(collect(x)[1]) == Int64(collect(y)[1])
end

function indrfr(fr::Int64, X::Array{Bool}, I::Array{Int64})::Array{Bool}
  #= X[;;;I;;;], where I has fr (framerank) semicolons to its left =#
  #= This is actually "I from"fr X" =#
  println("indrfr",fr)
  println("indrfr",X)
  println("indrfr",I)
  exit()


  #=frameshape = take([fr], shape(X));
  cellshape =  shape(I)++drop([fr+1], shape(X));
  cell = genarray(cellshape, false);
 z = with {
        (. <= iv <= .)
                : indrfr0(X[iv], I);
        } : genarray(frameshape, cell);
 return(z);=#
end

function indrfr0(X::Array{Bool}, I::Array{Int64})
  #= X[I;;;] or    I from X ::Array{Bool} =#
  println("indrfr0",X)
  println("indrfr0",I)
  exit()

  #=cellshape =  drop([1], shape(X));
  cell = genarray(cellshape, false);
 z = with {
        (. <= iv <= .)
                : sel( I[iv], X);
        } : genarray(shape(I), cell);
 return(z);=#
end



function indrfr(fr::Int64, X::Array{Bool}, I::Int64)::Array{Bool}
  #= X[;;;I;;;], where I has fr (framerank) semicolons to its left =#
  #= This is actually "I from"fr X" =#
  println("indrfr1",fr)
  println("indrfr1",X)
  println("indrfr1",I)
  exit()
 #=frameshape = take([fr], shape(X));
 cellshape = drop([1+fr],shape(X));
 cell = genarray(cellshape,false);


 z = with {
        (. <= iv <= .)
                : sel( I, X[iv]);
        } : genarray(frameshape, cell);
 return z=#
end


function ABC(I::Int64, Xshape::Int64)::Int64
 #= (OLD) Array bounds check for indexed ref X[scalarI] & indexed assign =#
 z = I + 1
 return z
end

function ABC(I::Array{Int64}, Xshape::Int64)::Array{Int64}
 #= (OLD) Array bounds check for indexed ref X[nonscalarI] & indexed assign =#
 z = I .+ 1
 return z
end

function UTClock_testXXI()

#=
 ?
=#
QUADio_0=toI(( false)) 
 QUADct_0=( 1.0e-13) 
 QUADpp_0=( 10) 
 QUADpw_0=( 80) 
 QUADrl_0=( 16807) 
 QUADio_1=toI(( false)) 
 QUADrl_1=( 16807) 
 QUADpp_1=( 16) 
 QUADpw_1=( 80) 
 A_47=quadtsXXI( ) 
 z_0=( A_47) 
 A_51=quadXII( z_0,QUADpp_1,QUADpw_1) 
 A_53=rhoXII( z_0) 
 # dsf scalar(s)
A_55=eqIIB(7,A_53) 
 A_52= ABC(toI(false)-QUADio_1, length(A_55)[1])
A_57=A_55[A_52] 
# dsf scalar(s)
A_58=barBBI(true,A_57) 
 r_0=( A_58) 
 A_62=quadXII( A_58,QUADpp_1,QUADpw_1) 
 return r_0
end

end
