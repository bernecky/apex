# TODO: Module and export
module iotan
export all

# Compiled by APEX Version: FIXME!! 2021-07-17 20:47:05.034
#=use Array: all;
use ArrayFormat: all;
use Bits: all;
use Clock: {clock,mday,mon,year,to_time};
use CommandLine: all;
use Numerical : all;
use RTClock: all;
use StdIO : all;
use String: {to_string,tochar,sscanf};=#

# TODO Do prolog

# Is this needed? I use all base libraries anyways...
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
function barDDD(x::Float64, y::Float64)::Float64
  return DtoD(x)-DtoD(y)
end

function plusIDD(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function mpyIDD(x::Int64, y::Float64)::Float64
  return ItoD(x) * DtoD(y)
end

function divDID(x::Float64, y::Int64)::Float64
  dx = DtoD(x)
  dy = ItoD(y)
  z = (dx == dy) ? 1.0 : dx/dy
  return z
end

function barBBI(x::Bool, y::Bool)::Int64
  return BtoI(x)-BtoI(y)
end

function plusDID(x::Float64, y)
         #= SxA scalar function =#
      # TODO
         z = plusDDD.(repeat([x], length(y)),y)
         return z
end


function iotaXII(y::Int64, QUADio)::UnitRange{Int64}
    # Index generator on scalar
    # HELP! Needs domain check for negative shp
    return QUADio .+ 0:y-1
end

function quadXDD(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    println(y)
    return y
end
function quadXII(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    println(y)
    return y
end
function sameDDB(x::Float64, y::Float64 , QUADct)::Bool
 #= Scalar match scalar =#
  z = eqDDB(toD(x), toD(y), QUADct)
 return z
end



function plusslXDDFOLD(y)::Float64
  #= First/last axis fold-based reduction of vector =#
  # TODO: Is this good enough?
  #=lim = size(y)[1]-1
  z = with {
        (0*size(y) <= iv < size(y))
                : DtoD(y[lim-iv]);
       } :  fold( plusDDD, ItoD(0));
  return(z);=#
  z = reduce(plusDDD, y)
  return z
end


function plusDDD(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function eqDDB(x::Float64, y::Float64, QUADct::Float64)::Bool
  #= A=B on doubles =#
  #= We use | instead of || on the assumption that
     the zero-fuzz case will eliminate the second leg,
     and it also eliminate a CONDFUN.
  =#
 return((DtoD(x) == DtoD(y)) | APEXFUZZEQ(DtoD(x),DtoD(y),QUADct));
end


function APEXFUZZEQ(x::Float64, y::Float64, QUADct::Float64)::Bool
 #= ISO APL Tolerant equality predicate =#
 absx = abs(x)
 absy = abs(y)
 tolerance = QUADct * max(absx, absy)
 z = abs(x-y) <= tolerance
 return(z)
end

function iotanXID(n::Int64,QUADio::Int64)::Float64

#=
 ?
=#
A_18=iotaXII( n,QUADio) 
 # dsf scalar(s)
A_19=barDDD(1.5,0.5) 
 # dsf scalar(s)
A_20=plusDID(A_19,A_18) 
A_21=plusslXDDFOLD( A_20) 
 r_0=( A_21) 
 return r_0
end

function iotan_testXXI()::Int64

#=
 ?
=#
QUADio_0=toI(( false)) 
 QUADct_0=( 1.0e-13) 
 QUADpp_0=( 10) 
 QUADpw_0=( 80) 
 QUADrl_0=( 16807) 
 QUADio_1=toI(( false)) 
 n_0=( 100000000) 
 QUADrl_1=( 16807) 
 QUADpp_1=( 16) 
 QUADpw_1=( 80) 
 A_54=iotanXID( n_0,QUADio_1) 
 r_0=( A_54) 
 A_58=quadXDD( r_0,QUADpp_1,QUADpw_1) 
 # dsf scalar(s)
A_59=barDDD(1.5,0.5) 
 # dsf scalar(s)
A_60=plusIDD(n_0,A_59) 
# dsf scalar(s)
A_61=mpyIDD(n_0,A_60) 
 # dsf scalar(s)
A_62=divDID(A_61,2) 
 A_64=sameDDB(r_0,A_62,QUADct_0) 
 # dsf scalar(s)
A_65=barBBI(A_64,true) 
r_1=( A_65) 
 A_69=quadXII( A_65,QUADpp_1,QUADpw_1) 
 return r_1
end

end
