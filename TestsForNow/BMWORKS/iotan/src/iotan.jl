module iotan;
export all;

# Compiled by APEX Version: FIXME!! 2021-06-19 16:45:25.540
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
inline double barDDD(double x, double y)
{ return(DtoD(x)-DtoD(y));
}

inline double plusIDD(int x, double y)
{ return(ItoD(x)+DtoD(y));
}

inline double mpyIDD(int x, double y)
{ return(ItoD(x)*DtoD(y));
}

inline double divDID(double x, int y)
{ dx = DtoD(x);
  dy = ItoD(y);
  z = (dx == dy) ? 1.0  : dx/dy;
  return(z);
}

inline int barBBI(bool x, bool y)
{ return(BtoI(x)-BtoI(y));
}

inline double[+] plusDID(double x, int[+] y)
{ /* SxA scalar function */
  xel = toD(x);
  z = with {
     ( . <= iv <= .) {
              yel = toD(y[iv]);
                    } : plusDDD(xel,yel);
  } : genarray(shape(y), 0.0d);
  return(z);
}


function iotaXII(int y, int QUADio)
    # Index generator on scalar
    # HELP! Needs domain check for negative shp
    z = QUADio+iota(toi(y))
    return z;
end

function quadXDD(double[*] y, int QUADpp, int QUADpw)
    # {quad}{<-} anything
    # show(y);
    # return(y);
    return "TODO: Fragment quad";
end
function quadXII(int[*] y, int QUADpp, int QUADpw)
    # {quad}{<-} anything
    # show(y);
    # return(y);
    return "TODO: Fragment quad";
end
inline bool sameDDB(double x, double y,double QUADct)
{ /* Scalar match scalar */
  z = eqDDB(toD(x), toD(y), QUADct);
 return(z);
}



inline double plusslXDDFOLD(double[.] y)
{ /* First/last axis fold-based reduction of vector */
  lim = shape(y)[0]-1;
  z = with {
        (0*shape(y) <= iv < shape(y))
                : DtoD(y[lim-iv]);
       } :  fold( plusDDD, ItoD(0));
  return(z);
}


inline double plusDDD(double x, double y)
{ return(DtoD(x)+DtoD(y));
}

inline bool eqDDB(double x, double y, double QUADct)
{ /* A=B on doubles */
  /* We use | instead of || on the assumption that
   * the zero-fuzz case will eliminate the second leg,
   * and it also eliminate a CONDFUN.
   */
 return((DtoD(x) == DtoD(y)) | APEXFUZZEQ(DtoD(x),DtoD(y),QUADct));
}


inline bool APEXFUZZEQ(double x, double y, double QUADct)
{ /* ISO APL Tolerant equality predicate */
 absx = abs(x);
 absy = abs(y);
 tolerance = QUADct * max(absx,absy);
 z = abs(x-y) <= tolerance;
 return(z);
}

inline double iotanXID(int n ,int QUADio)
{ 
/*
 ?
*/
A_18iotaXII( n,QUADio) # dsf scalar(s)
A_19barDDD(1.5,0.5) # dsf scalar(s)
A_20plusDID(A_19,A_18)A_21plusslXDDFOLD( A_20) r_0( A_21) return(r_0);
}

inline int iotan_testXXI()
{ 
/*
 ?
*/
QUADio_0( false) QUADct_0( 1.0e-13) QUADpp_0( 10) QUADpw_0( 80) QUADrl_0( 16807) QUADio_1( false) n_0( 100000000) QUADrl_1( 16807) QUADpp_1( 16) QUADpw_1( 80) A_54iotanXID( n_0,QUADio_1) r_0( A_54) A_58quadXDD( r_0,QUADpp_1,QUADpw_1) # dsf scalar(s)
A_59barDDD(1.5,0.5) # dsf scalar(s)
A_60plusIDD(n_0,A_59)# dsf scalar(s)
A_61mpyIDD(n_0,A_60) # dsf scalar(s)
A_62divDID(A_61,2) A_64sameDDB(r_0,A_62,QUADct_0) # dsf scalar(s)
A_65barBBI(A_64,true)r_1( A_65) A_69quadXII( A_65,QUADpp_1,QUADpw_1) return(r_1);
}

