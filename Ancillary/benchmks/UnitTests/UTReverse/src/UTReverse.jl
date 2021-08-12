# TODO: Module and export
module UTReverse
export all

# Compiled by APEX Version: FIXME!! 2021-08-10 13:14:03.833
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
inline Float64[+] divXID(Int64[+] y)
{ #= Monadic scalar functions on array =#
  z = with {
        ( . <= iv <= .)
                : divXDD(toD(y[iv]));
        } : genarray(shape(y), 0.0d);
  return(z);
}

function barBBI(x::Bool, y::Bool)::Int64
  return BtoI(x)-BtoI(y)
end

function plusDID(x::Float64, y::Int64)::Array{Float64}
  #= SxA scalar function =#
      # TODO
         z = plusDDD.(repeat([x], length(y)), DtoD(y))
      return z
end


function plusBII(x::Bool, y::Int64)::Array{Int64}
  #= SxA scalar function =#
      # TODO
         z = plusIII.(repeat([x], length(y)), BtoI(y))
      return z
end


inline Float64[+] plusIDD(Int64[+] x, Float64 y)
{ #= AxS scalar function =#
  z = with {
     ( . <= iv <= .) {
              xel = x[iv];
   } : plusIDD(xel,y);
  } : genarray( shape(x), 0.0d);
  return(z);
}


inline Int64 rotrXII(Int64 y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Char rotrXCC(Char y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Char rot1XCC(Char y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Bool rotrXBB(Bool y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Bool rot1XBB(Bool y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Float64 rotrXDD(Float64 y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Float64 rot1XDD(Float64 y)
{ #= Transpose and reverse on scalars are NOPs =#
  return(y);
}

inline Bool[.] comaXBB(Bool y)
{ #= Ravel of scalar =#
  return([y]);
}

inline Bool[.] rotrXBB(Bool[.] y)
{ #= Vector reverse =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Bool[+] rot1XBB(Bool[+] y)
{ #= First axis reverse on anything =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Int64[.] comaXII(Int64 y)
{ #= Ravel of scalar =#
  return([y]);
}

inline Int64[.] rotrXII(Int64[.] y)
{ #= Vector reverse =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Int64[+] rot1XII(Int64[+] y)
{ #= First axis reverse on anything =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Float64[.] comaXDD(Float64 y)
{ #= Ravel of scalar =#
  return([y]);
}

inline Float64[.] rotrXDD(Float64[.] y)
{ #= Vector reverse =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Float64[+] rot1XDD(Float64[+] y)
{ #= First axis reverse on anything =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Char[.] comaXCC(Char y)
{ #= Ravel of scalar =#
  return([y]);
}

inline Char[.] rotrXCC(Char[.] y)
{ #= Vector reverse =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Char[+] rot1XCC(Char[+] y)
{ #= First axis reverse on anything =#
  z = Array::reverse( 0, y);
  return( z);
}

inline Bool[+] rotrXBB(Bool[+] y)
{#= Last axis reverse on rank>1 =#
  axis = _dim_A_( y) - 1;
  z = Array::reverse( axis, y);
  return( z);
}

inline Int64[+] rotrXII(Int64[+] y)
{#= Last axis reverse on rank>1 =#
  axis = _dim_A_( y) - 1;
  z = Array::reverse( axis, y);
  return( z);
}

inline Float64[+] rotrXDD(Float64[+] y)
{#= Last axis reverse on rank>1 =#
  axis = _dim_A_( y) - 1;
  z = Array::reverse( axis, y);
  return( z);
}

inline Char[+] rotrXCC(Char[+] y)
{#= Last axis reverse on rank>1 =#
  axis = _dim_A_( y) - 1;
  z = Array::reverse( axis, y);
  return( z);
}

inline Bool[*] rhoIBB(Int64[.] x, Bool[*] y)
{  #= APEX vector x reshape, with potential item reuse =#
   z = with {
         ( . <= iv <= .) {
           offset = V2O( toi( x), iv);
           offset = _aplmod_SxS_( offset, prod( shape(y)));
           el = y[ O2V( shape( y), offset)];
          } : el;
       } : genarray( toi(x), false);
   return( z);
}



inline Int64[*] rhoIII(Int64[.] x, Int64[*] y)
{  #= APEX vector x reshape, with potential item reuse =#
   z = with {
         ( . <= iv <= .) {
           offset = V2O( toi( x), iv);
           offset = _aplmod_SxS_( offset, prod( shape(y)));
           el = y[ O2V( shape( y), offset)];
          } : el;
       } : genarray( toi(x), 0);
   return( z);
}



inline Float64[*] rhoIDD(Int64[.] x, Float64[*] y)
{  #= APEX vector x reshape, with potential item reuse =#
   z = with {
         ( . <= iv <= .) {
           offset = V2O( toi( x), iv);
           offset = _aplmod_SxS_( offset, prod( shape(y)));
           el = y[ O2V( shape( y), offset)];
          } : el;
       } : genarray( toi(x), 0.0d);
   return( z);
}



inline Int64[*] iotaCCIQUADAV(Char[256] x, Char y, QUADio)
{ #= QUADav iota character scalar =#
 return(toi(y)+QUADio);
}

inline Char[*] rhoICC(Int64[.] x, Char[*] y)
{  #= APEX vector x reshape, with potential item reuse =#
   z = with {
         ( . <= iv <= .) {
           offset = V2O( toi( x), iv);
           offset = _aplmod_SxS_( offset, prod( shape(y)));
           el = y[ O2V( shape( y), offset)];
          } : el;
       } : genarray( toi(x), ' ');
   return( z);
}



inline Char[*] dropICC(Int64 x, Char[*] y)
{ #= Scalar drop non-scalar =#
  return(drop([toi(x)], y));
}

function iotaXII(y::Int64, QUADio)::UnitRange{Int64}
    # Index generator on scalar
    # HELP! Needs domain check for negative shp
    return QUADio .+ 0:y-1
end

function quadXBB(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    println(y)
    return y
end
function quadXII(y, QUADpp, QUADpw)
    # {quad}{<-} anything
    println(y)
    return y
end
inline char[256] quadavXXC()
{ #= QUADav - system character set =#
 z = with{
        ([0] <= [i] < [256]) : _toc_S_(i);
        } : genarray( [256], ' ');
 return(z);
}

inline Bool[2] comaBBB(Bool x, Bool y)
{#= SxS catenate first (or last) axis =#
 return([toB(x)]++[toB(y)]);
}

inline Bool[.] comaBBB(Bool[.] x, Bool y)
{#= VxS catenate first (or last) axis =#
 return(toB(x)++[toB(y)]);
}

function sameIIB(x::Int64, y::Int64 )::Bool
 #= Scalar match scalar =#
  z = eqIIB(toI(x), toI(y))
 return z
end



function sameCCB(x::Char, y::Char )::Bool
 #= Scalar match scalar =#
  z = eqCCB(toC(x), toC(y))
 return z
end



function sameBBB(x::Bool, y::Bool )::Bool
 #= Scalar match scalar =#
  z = eqBBB(toB(x), toB(y))
 return z
end



function sameDDB(x::Float64, y::Float64 , QUADct)::Bool
 #= Scalar match scalar =#
  z = eqDDB(toD(x), toD(y), QUADct)
 return z
end



inline Bool sameBBB(Bool[+] x, Bool[+] y)
{ #= Non-scalar match non-scalar =#
   z = (( _dim_A_( x) == _dim_A_( y))          &&
       ( all( _shape_A_( x) == _shape_A_( y))) &&
       ( all( eqBBB(toB( x),  toB( y)))));
  return(z);
}



inline Bool sameIIB(Int64[+] x, Int64[+] y)
{ #= Non-scalar match non-scalar =#
   z = (( _dim_A_( x) == _dim_A_( y))          &&
       ( all( _shape_A_( x) == _shape_A_( y))) &&
       ( all( eqIIB(toI( x),  toI( y)))));
  return(z);
}



inline Bool sameDDB(Float64[+] x, Float64[+] y, QUADct)
{ #= Non-scalar match non-scalar =#
   z = (( _dim_A_( x) == _dim_A_( y))          &&
       ( all( _shape_A_( x) == _shape_A_( y))) &&
       ( all( eqDDB(toD( x),  toD( y), QUADct))));
  return(z);
}



inline Bool sameCCB(Char[+] x, Char[+] y)
{ #= Non-scalar match non-scalar =#
   z = (( _dim_A_( x) == _dim_A_( y))          &&
       ( all( _shape_A_( x) == _shape_A_( y))) &&
       ( all( eqCCB(toC( x),  toC( y)))));
  return(z);
}



inline Bool andslXBBQUICKSTOP(Bool[.] y)
{ #= First/last axis reduction of vector with quick stop=#
  z = with {
         (0*shape(y) <= iv < shape(y))
                : BtoB(y[iv]);
        } : foldfix( andBBB, ItoB(1), ItoB(0));
  return(z);
}


inline Float64 divXDD(Float64 y)
{ return(1.0/tod(y));
}

function plusDDD(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function plusIII(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function plusIDD(x, y)
  # Remove the feed types because they are causing problems. Probably wise to add them back later though.
  # In theory this should always work as long as it isnt fed weird types...
  return x + y
end

function eqIIB(x::Int64, y)::Bool
    #= A=B on non-doubles =#
    # Always just compare first element?
    return Int64(collect(x)[1]) == Int64(collect(y)[1])
end

function eqCCB(x::Char, y)::Bool
    #= A=B on non-doubles =#
    # Always just compare first element?
    return Int64(collect(x)[1]) == Int64(collect(y)[1])
end

function eqBBB(x::Bool, y)::Bool
    #= A=B on non-doubles =#
    # Always just compare first element?
    return Int64(collect(x)[1]) == Int64(collect(y)[1])
end

function eqDDB(x::Float64, y::Float64, QUADct::Float64)::Bool
  #= A=B on doubles =#
  #= We use | instead of || on the assumption that
     the zero-fuzz case will eliminate the second leg,
     and it also eliminate a CONDFUN.
  =#
 return((DtoD(x) == DtoD(y)) | APEXFUZZEQ(DtoD(x),DtoD(y),QUADct));
end


inline Bool andBBB(Bool x, Bool y)
{ return(BtoB(x)&BtoB(y));
}

inline Bool[+] eqBBB(Bool[+] x, Bool[+] y)
{ #= AxA Dyadic scalar fn, shapes may or may not match =#
         sy = shape(y);
         z = with {
             ( . <= iv <= .) {
                      xel = x[iv];
                   yel = y[iv];
           } : eqBBB(xel,yel);
        } : genarray(sy, false);
  return(z);
}






inline Bool[+] eqIIB(Int64[+] x, Int64[+] y)
{ #= AxA Dyadic scalar fn, shapes may or may not match =#
         sy = shape(y);
         z = with {
             ( . <= iv <= .) {
                      xel = x[iv];
                   yel = y[iv];
           } : eqIIB(xel,yel);
        } : genarray(sy, false);
  return(z);
}






inline Bool[+] eqDDB(Float64[+] x, Float64[+] y, QUADct)
{ #= AxA Dyadic scalar fn, shapes may or may not match =#
         sy = shape(y);
         z = with {
             ( . <= iv <= .) {
                      xel = x[iv];
                   yel = y[iv];
           } : eqDDB(xel,yel, QUADct);
        } : genarray(sy, false);
  return(z);
}






inline Bool[+] eqCCB(Char[+] x, Char[+] y)
{ #= AxA Dyadic scalar fn, shapes may or may not match =#
         sy = shape(y);
         z = with {
             ( . <= iv <= .) {
                      xel = x[iv];
                   yel = y[iv];
           } : eqCCB(xel,yel);
        } : genarray(sy, false);
  return(z);
}






inline int V2O( int[.] shp, int[.] iv)
{ #= Vector iv to offset into array of shape shp =#
  #= See V2O.dws workspace =#
  offset = 0;
  wt = 1;
  for( i=shape(shp)[0]-1; i>=0; i--) {
    offset = offset + ( wt * iv[i]);
    wt = wt * shp[i];
  }
  return( offset);
}

inline int[.] O2V( int[.] shp, int offset)
{ #= Offset into array of shape shp to index vector =#
  #= See V2O.dws workspace =#
  iv = genarray( shape(shp), 1);
  wts = iv;
  for( i=shape(shp)[0]-2; i>=0; i--) {
    wts[i] = wts[i+1] * shp[i+1];
  }

  for( i=shape(shp)[0]-1; i>=0; i--) {
    iv[i] = _aplmod_SxS_( offset/wts[i], shp[i]);
    offset = offset - (iv[i]*wts[i]);
  }
  return( iv);
}

function APEXFUZZEQ(x::Float64, y::Float64, QUADct::Float64)::Bool
 #= ISO APL Tolerant equality predicate =#
 absx = abs(x)
 absy = abs(y)
 tolerance = QUADct * max(absx, absy)
 z = abs(x-y) <= tolerance
 return(z)
end

function eqBBB(x::Bool, y::Bool)::Array{Bool}
  #= SxA scalar function =#
      # TODO
         z = eqBBB.(repeat([x], length(y)), BtoB(y))
      return z
end


inline Bool[+] eqBBB(Bool[+] x, Bool y)
{ #= AxS scalar function =#
  z = with {
     ( . <= iv <= .) {
              xel = x[iv];
   } : eqBBB(xel,y);
  } : genarray( shape(x), false);
  return(z);
}


function eqIIB(x::Int64, y::Int64)::Array{Bool}
  #= SxA scalar function =#
      # TODO
         z = eqIIB.(repeat([x], length(y)), ItoI(y))
      return z
end


inline Bool[+] eqIIB(Int64[+] x, Int64 y)
{ #= AxS scalar function =#
  z = with {
     ( . <= iv <= .) {
              xel = x[iv];
   } : eqIIB(xel,y);
  } : genarray( shape(x), false);
  return(z);
}


function eqDDB(x::Float64, y::Float64, QUADct)::Array{Bool}
  #= SxA scalar function =#
      # TODO
         z = eqDDB.(repeat([x], length(y)), DtoD(y), QUADct)
      return z
end


inline Bool[+] eqDDB(Float64[+] x, Float64 y, QUADct)
{ #= AxS scalar function =#
  z = with {
     ( . <= iv <= .) {
              xel = x[iv];
   } : eqDDB(xel,y, QUADct);
  } : genarray( shape(x), false);
  return(z);
}


function eqCCB(x::Char, y::Char)::Array{Bool}
  #= SxA scalar function =#
      # TODO
         z = eqCCB.(repeat([x], length(y)), CtoC(y))
      return z
end


inline Bool[+] eqCCB(Char[+] x, Char y)
{ #= AxS scalar function =#
  z = with {
     ( . <= iv <= .) {
              xel = x[iv];
   } : eqCCB(xel,y);
  } : genarray( shape(x), false);
  return(z);
}


inline Bool[.] comaXBB(Bool[+] y)
{ #= Ravel of anything with rank>1 =#
  z = reshape([prod(shape(y))],y);
  return(z);
}

inline Int64[.] comaXII(Int64[+] y)
{ #= Ravel of anything with rank>1 =#
  z = reshape([prod(shape(y))],y);
  return(z);
}

inline Float64[.] comaXDD(Float64[+] y)
{ #= Ravel of anything with rank>1 =#
  z = reshape([prod(shape(y))],y);
  return(z);
}

inline Char[.] comaXCC(Char[+] y)
{ #= Ravel of anything with rank>1 =#
  z = reshape([prod(shape(y))],y);
  return(z);
}

function UTRevXXB(QUADio::Int64,QUADct::Float64)

#=
 ?
=#
A_85=rotrXII( 5) 
 A_87=sameIIB(5,A_85) 
 r_0=( A_87) 
 A_89=rotrXCC( 'x') 
 A_91=sameCCB('x',A_89) 
 A_92=comaBBB(r_0,A_91) 
 r_1=( A_92) 
 A_94=rot1XCC( 'x') 
 A_96=sameCCB('x',A_94) 
 A_97=comaBBB(r_1,A_96) 
 r_2=( A_97) 
 A_99=rotrXBB( false) 
 A_101=sameBBB(false,A_99) 
 A_102=comaBBB(r_2,A_101) 
 r_3=( A_102) 
 A_104=rot1XBB( false) 
 A_106=sameBBB(false,A_104) 
 A_107=comaBBB(r_3,A_106) 
 r_4=( A_107) 
 A_109=rotrXDD( 0.5) 
 A_111=sameDDB(0.5,A_109,QUADct) 
 A_112=comaBBB(r_4,A_111) 
 r_5=( A_112) 
 A_114=rot1XDD( 0.5) 
 A_116=sameDDB(0.5,A_114,QUADct) 
 A_117=comaBBB(r_5,A_116) 
 r_6=( A_117) 
 A_119=comaXBB( true) 
 A_120=rotrXBB( A_119) 
 A_121=comaXBB( true) 
 A_123=sameBBB(A_121,A_120) 
 A_124=comaBBB(r_6,A_123) 
 r_7=( A_124) 
 A_126=comaXBB( true) 
 A_127=rot1XBB( A_126) 
 A_128=comaXBB( true) 
 A_130=sameBBB(A_128,A_127) 
 A_131=comaBBB(r_7,A_130) 
 r_8=( A_131) 
 A_133=comaXII( 2) 
 A_134=rotrXII( A_133) 
 A_135=comaXII( 2) 
 A_137=sameIIB(A_135,A_134) 
 A_138=comaBBB(r_8,A_137) 
 r_9=( A_138) 
 A_140=comaXII( 2) 
 A_141=rot1XII( A_140) 
 A_142=comaXII( 2) 
 A_144=sameIIB(A_142,A_141) 
 A_145=comaBBB(r_9,A_144) 
 r_10=( A_145) 
 A_147=comaXDD( 2.5) 
 A_148=rotrXDD( A_147) 
 A_149=comaXDD( 2.5) 
 A_151=sameDDB(A_149,A_148,QUADct) 
 A_152=comaBBB(r_10,A_151) 
 r_11=( A_152) 
 A_154=comaXDD( 2.5) 
 A_155=rot1XDD( A_154) 
 A_156=comaXDD( 2.5) 
 A_158=sameDDB(A_156,A_155,QUADct) 
 A_159=comaBBB(r_11,A_158) 
 r_12=( A_159) 
 A_161=comaXCC( 'x') 
 A_162=rotrXCC( A_161) 
 A_163=comaXCC( 'x') 
 A_165=sameCCB(A_163,A_162) 
 A_166=comaBBB(r_12,A_165) 
 r_13=( A_166) 
 A_168=comaXCC( 'x') 
 A_169=rot1XCC( A_168) 
 A_170=comaXCC( 'x') 
 A_172=sameCCB(A_170,A_169) 
 A_173=comaBBB(r_13,A_172) 
 r_14=( A_173) 
 A_175=rotrXBB( [false,true,false,false]) 
 A_176=rotrXBB( A_175) 
 A_178=sameBBB([false,true,false,false],A_176) 
 A_179=comaBBB(r_14,A_178) 
 r_15=( A_179) 
 A_181=rot1XBB( [false,true,false,false]) 
 A_182=rot1XBB( A_181) 
 A_184=sameBBB([false,true,false,false],A_182) 
 A_185=comaBBB(r_15,A_184) 
 r_16=( A_185) 
 A_188=iotaXII( 5,QUADio) 
 A_189=rotrXII( A_188) 
 A_190=rotrXII( A_189) 
 A_192=iotaXII( 5,QUADio) 
 A_194=sameIIB(A_192,A_190) 
 A_195=comaBBB(r_16,A_194) 
 r_17=( A_195) 
 A_198=iotaXII( 5,QUADio) 
 A_199=rot1XII( A_198) 
 A_200=rot1XII( A_199) 
 A_202=iotaXII( 5,QUADio) 
 A_204=sameIIB(A_202,A_200) 
 A_205=comaBBB(r_17,A_204) 
 r_18=( A_205) 
 A_208=iotaXII( 20,QUADio) 
 # dsf scalar(s)
A_209=plusDID(0.5,A_208) 
 A_210=rotrXDD( A_209) 
 A_211=rotrXDD( A_210) 
 A_213=iotaXII( 20,QUADio) 
 # dsf scalar(s)
A_214=plusDID(0.5,A_213) 
 A_216=sameDDB(A_214,A_211,QUADct) 
 A_217=comaBBB(r_18,A_216) 
 r_19=( A_217) 
 A_220=iotaXII( 20,QUADio) 
 # dsf scalar(s)
A_221=plusDID(0.5,A_220) 
 A_222=rot1XDD( A_221) 
 A_223=rot1XDD( A_222) 
 A_225=iotaXII( 20,QUADio) 
 # dsf scalar(s)
A_226=plusDID(0.5,A_225) 
 A_228=sameDDB(A_226,A_223,QUADct) 
 A_229=comaBBB(r_19,A_228) 
 r_20=( A_229) 
 A_231=rotrXCC( ['a','b','c','d','e']) 
 A_232=rotrXCC( A_231) 
 A_234=sameCCB(['a','b','c','d','e'],A_232) 
 A_235=comaBBB(r_20,A_234) 
 r_21=( A_235) 
 A_237=rot1XCC( ['a','b','c','d','e']) 
 A_238=rot1XCC( A_237) 
 A_240=sameCCB(['a','b','c','d','e'],A_238) 
 A_241=comaBBB(r_21,A_240) 
 r_22=( A_241) 
 A_243=rhoIBB([2, 3],[false,true,false,true,false,true]) 
b_0=( A_243) 
 A_245=rotrXBB( b_0) 
 A_246=rotrXBB( A_245) 
 A_248=sameBBB(b_0,A_246) 
 A_249=comaBBB(r_22,A_248) 
 r_23=( A_249) 
 A_251=rot1XBB( b_0) 
 A_252=rot1XBB( A_251) 
 A_254=sameBBB(b_0,A_252) 
 A_255=comaBBB(r_23,A_254) 
 r_24=( A_255) 
 A_258=iotaXII( 20,QUADio) 
 A_259=rhoIII([4, 5],A_258) 
 b_1=( A_259) 
 A_261=rotrXII( b_1) 
 A_262=rotrXII( A_261) 
 A_264=sameIIB(b_1,A_262) 
 A_265=comaBBB(r_24,A_264) 
 r_25=( A_265) 
 A_267=rot1XII( b_1) 
 A_268=rot1XII( A_267) 
 A_270=sameIIB(b_1,A_268) 
 A_271=comaBBB(r_25,A_270) 
 r_26=( A_271) 
 A_274=iotaXII( 30,QUADio) 
 # dsf scalar(s)
A_275=plusBII(true,A_274) 
 A_276=divXID( A_275) 
 A_277=rhoIDD([5, 6],A_276) 
 b_2=( A_277) 
 A_279=rotrXDD( b_2) 
 A_280=rotrXDD( A_279) 
 A_282=sameDDB(b_2,A_280,QUADct) 
 A_283=comaBBB(r_26,A_282) 
 r_27=( A_283) 
 A_285=rot1XDD( b_2) 
 A_286=rot1XDD( A_285) 
 A_288=sameDDB(b_2,A_286,QUADct) 
 A_289=comaBBB(r_27,A_288) 
 r_28=( A_289) 
 A_291=quadavXXC( ) 
 A_292=quadavXXC( ) 
 A_295=iotaCCIQUADAV(A_292,'a',QUADio) 
 A_296=dropICC(A_295,A_291) 
 A_297=rhoICC([6, 7],A_296) 
 b_3=( A_297) 
 A_299=rotrXCC( b_3) 
 A_300=rotrXCC( A_299) 
 A_302=sameCCB(b_3,A_300) 
 A_303=comaBBB(r_28,A_302) 
 r_29=( A_303) 
 A_305=rot1XCC( b_3) 
 A_306=rot1XCC( A_305) 
 A_308=sameCCB(b_3,A_306) 
 A_309=comaBBB(r_29,A_308) 
 r_30=( A_309) 
 A_311=rhoIBB([2, 3, 4],[false,true]) 
 b_4=( A_311) 
 A_313=rotrXBB( b_4) 
 A_314=rotrXBB( A_313) 
 A_316=sameBBB(b_4,A_314) 
 A_317=comaBBB(r_30,A_316) 
 r_31=( A_317) 
 A_319=rot1XBB( b_4) 
 A_320=rot1XBB( A_319) 
 A_322=sameBBB(b_4,A_320) 
 A_323=comaBBB(r_31,A_322) 
 r_32=( A_323) 
 A_326=iotaXII( 120,QUADio) 
 A_327=rhoIII([3, 4, 5],A_326) 
 b_5=( A_327) 
 A_329=rotrXII( b_5) 
 A_330=rotrXII( A_329) 
 A_332=sameIIB(b_5,A_330) 
 A_333=comaBBB(r_32,A_332) 
 r_33=( A_333) 
 A_335=rot1XII( b_5) 
 A_336=rot1XII( A_335) 
 A_338=sameIIB(b_5,A_336) 
 A_339=comaBBB(r_33,A_338) 
 r_34=( A_339) 
 # dsf scalar(s)
A_341=plusIDD(b_5,0.5) 
 b_6=( A_341) 
 A_343=rotrXDD( b_6) 
 A_344=rotrXDD( A_343) 
 A_346=sameDDB(b_6,A_344,QUADct) 
 A_347=comaBBB(r_34,A_346) 
 r_35=( A_347) 
 A_349=rot1XDD( b_6) 
 A_350=rot1XDD( A_349) 
 A_352=sameDDB(b_6,A_350,QUADct) 
 A_353=comaBBB(r_35,A_352) 
 r_36=( A_353) 
 A_355=quadavXXC( ) 
 A_356=rhoICC([3, 4, 5],A_355) 
 b_7=( A_356) 
 A_358=rotrXCC( b_7) 
 A_359=rotrXCC( A_358) 
 A_361=sameCCB(b_7,A_359) 
 A_362=comaBBB(r_36,A_361) 
 r_37=( A_362) 
 A_364=rot1XCC( b_7) 
 A_365=rot1XCC( A_364) 
 A_367=sameCCB(b_7,A_365) 
 A_368=comaBBB(r_37,A_367) 
 r_38=( A_368) 
 return r_38
end

function UTReverse_testXXI()

#=
 ?
=#
QUADio_0=toI(( false)) 
 QUADct_0=( 1.0e-13) 
 QUADpp_0=( 10) 
 QUADpw_0=( 80) 
 QUADrl_0=( 16807) 
 A_38=UTRevXXB( QUADio_0,QUADct_0) 
 r_0=( A_38) 
 A_42=quadXBB( r_0,QUADpp_0,QUADpw_0) 
 A_43=andslXBBQUICKSTOP( r_0) 
 # dsf scalar(s)
A_47=barBBI(true,A_43) 
r_1=( A_47) 
 A_51=quadXII( A_47,QUADpp_0,QUADpw_0) 
 return r_1
end

end
