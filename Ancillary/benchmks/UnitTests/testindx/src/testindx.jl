# TODO: Module and export
module testindx
export all

# Compiled by APEX Version: FIXME!! 2021-08-10 11:13:19.859
using Dates
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
function plusIII(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function barDDD(x::Float64, y::Float64)::Float64
  return DtoD(x)-DtoD(y)
end

function plusDDD(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function barIDD(x::Int64, y::Float64)::Float64
  return ItoD(x)-DtoD(y)
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

function plusIDD(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function barBBI(x::Bool, y::Bool)::Int64
  return BtoI(x)-BtoI(y)
end

function plusDID(x::Float64, y::Int64)::Array{Float64}
  #= SxA scalar function =#
      # TODO
         z = plusDDD.(repeat([x], length(y)), DtoD(y))
      return z
end


function rhoIII(x::Int64, y::Int64)::Array{Int64}
  # [Scalar reshape scalar]

  z = repeat([toI(x)], y)
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



function indr(x::Array{Int64}, i::Int64)::Array{Int64}
    #= X[scalarI;;;] =#
    #= Used only in conjunction with other indexing, e.g.,
    # X[scalarI;;j;]
    =#
    z = x[i]
    return z
end


function inds0(x::Array{Int64}, I, yin::Int64)::Array{Int64}
  #= X[;;nonscalarI;;;]<- scalarY =#
  
  z = ItoI(x)
  Y = Yin;

  
  # TODO: Very very todo...
  z[I0]=ItoI((Y));

  
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

function testindxXID(n::Int64,QUADio::Int64)

#=
 ?
=#
A_26=rhoIII(n,9) 
 r_0=( A_26) 
 A_29=iotaXII( n,QUADio) 
 A_CTR30_= 0;
A_CTR30z_ = (length(A_29)[1])-1;
r_3=toI(r_0);
for(; A_CTR30_ <= A_CTR30z_; A_CTR30_++){
i_0 = A_29[A_CTR30_]
 A_32= ABC(toI(i_0)-QUADio, length(r_3)[1])
A_34=inds0(r_3,A_32,i_0) 
 r_2=( A_34) 
 A_36= ABC(toI(i_0)-QUADio, length(r_2)[1])
A_38=r_2[A_36] 
 # dsf scalar(s)
A_39=plusIII(A_38,2) 
 A_40= ABC(toI(i_0)-QUADio, length(r_2)[1])
A_42=inds0(r_2,A_40,A_39) 
 r_3=( A_42) 
 }
 # dsf Scalar & clique
A_45=barDDD(0.5,0.5) 
 # dsf scalar(s)
A_46=plusDID(A_45,r_3) 
 A_47=plusslXDDFOLD( A_46) 
 r_4=( A_47) 
 return r_4
end

function testindx_testXXI()

#=
 ?
=#
QUADio_0=toI(( false)) 
 QUADct_0=( 1.0e-13) 
 QUADpp_0=( 10) 
 QUADpw_0=( 80) 
 QUADrl_0=( 16807) 
 QUADio_1=toI(( false)) 
 n_0=( 1000000) 
 QUADrl_1=( 16807) 
 QUADpp_1=( 17) 
 QUADpw_1=( 80) 
 A_53=testindxXID( n_0,QUADio_1) 
 r_0=( A_53) 
 A_57=quadXDD( A_53,QUADpp_1,QUADpw_1) 
 # dsf Scalar & clique
A_58=plusDDD(0.5,0.5) 
# dsf scalar(s)
A_59=barIDD(n_0,A_58) 
 # dsf scalar(s)
A_60=mpyIDD(n_0,A_59) 
 # dsf scalar(s)
A_61=divDID(A_60,2) 
 # dsf scalar(s)
A_62=plusIDD(n_0,A_61) 
 # dsf scalar(s)
A_63=plusIDD(n_0,A_62) 
 A_65=sameDDB(r_0,A_63,QUADct_0) 
 # dsf scalar(s)
A_66=barBBI(true,A_65) 
 r_1=( A_66) 
 A_70=quadXII( A_66,QUADpp_1,QUADpw_1) 
 return r_1
end

end