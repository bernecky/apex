# TODO: Module and export
module iotan
export all

# Compiled by APEX Version: FIXME!! 2021-07-10 21:43:51.771
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
  return(DtoD(x)-DtoD(y))
end

function plusIDD(x::Int64, y::Float64)
  # In theory this should always work as long as it isnt fed weird types...
  return convert(Int64, x) + convert(Int64, y)
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
  return(BtoI(x)-BtoI(y))
end

inline Float64[+] plusDID(Float64 x, Int64[+] y)
{ #= SxA scalar function =#
  xel = toD(x);
  z = with {
     ( . <= iv <= .) {
              yel = toD(y[iv]);
                    } : plusDDD(xel,yel);
  } : genarray(shape(y), 0.0d);
  return(z);
}


function iotaXII(y::Int64, QUADio)
    # Index generator on scalar
    # HELP! Needs domain check for negative shp
    z = Int64(QUADio) .+ collect(0:Int64(y)-1)
    return z;
end

function quadXDD(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    # Use Base.print instead of just print because if the module name is print, there is a conflict
    Base.print(y)
end
function quadXII(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    # Use Base.print instead of just print because if the module name is print, there is a conflict
    Base.print(y)
end
function sameDDB(x::Float64, y::Float64 ,double QUADct)::Bool
 #= Scalar match scalar =#
  z = eqDDB(toD(x), toD(y), QUADct)
 return(z)
end



function plusslXDDFOLD(y::Array{Float64})::Float64
  #= First/last axis fold-based reduction of vector =#
  # TODO
  lim = size(y)[1]-1;
  z = with {
        (0*size(y) <= iv < size(y))
                : DtoD(y[lim-iv]);
       } :  fold( plusDDD, ItoD(0));
  return(z);
end


function plusDDD(x::Float64, y::Float64)
  # In theory this should always work as long as it isnt fed weird types...
  return convert(Int64, x) + convert(Int64, y)
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

function iotanXID(Int64 n ,Int64 QUADio)::Float64

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
 return(r_0);
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
 return(r_1);
end

end
