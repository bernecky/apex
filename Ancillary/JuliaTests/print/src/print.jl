# TODO: Module and export
module print
export all

# Compiled by APEX Version: FIXME!! 2021-07-10 13:17:26.727
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
function quadXCC(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    # Use Base.print instead of just print because if the module name is print, there is a conflict
    Base.print(y)
end
function print_testXXB()::Bool

#=
 ?
=#
QUADio_0=toI(( false)) 
 QUADct_0=( 1.0e-13) 
 QUADpp_0=( 10) 
 QUADpw_0=( 80) 
 QUADrl_0=( 16807) 
 txt_0=( ['H','e','l','l','o',',',' ','J','u','l','i','a',' ','B','a','c','k','e','n','d',' ','F','o','r',' ','A','P','E','X','!']) 
 A_41=quadXCC( txt_0,QUADpp_0,QUADpw_0) 
 r_0=( true) 
 return(r_0);
end

end
