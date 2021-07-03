# TODO: Module and export
# module add;
# export all;

# Compiled by APEX Version: FIXME!! 2021-07-03 19:19:16.554
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
function plusIII(x::Int64, y::Int64)
  # In theory this should always work as long as it isnt fed weird types...
  return convert(Int64, x) + convert(Int64, y)
end

function add_testXXI()::Int64

#=
 ?
=#
QUADio_0=toI(( false)) 
 QUADct_0=( 1.0e-13) 
 QUADpp_0=( 10) 
 QUADpw_0=( 80) 
 QUADrl_0=( 16807) 
 n1_0=( 2) 
 n2_0=( 2) 
 # dsf Scalar & clique
A_42=plusIII(n1_0,n2_0) 
r_0=( A_42) 
 return(r_0);
end
