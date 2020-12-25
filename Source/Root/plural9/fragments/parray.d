///module parray;

/// import std.stdio;

// Plural array data structures
//
// A program refers to an array via a Parray. 
// The Parray points to the array's shape vector and
// raveled value vector.
//
// A Plural array is a pair of the array's shape and raveled value.
//
struct Parray {
  int[] shp;
  union {
    bool[]   _bval = null;
    int[]    _ival;
    double[] _dval;
    char[]   _cval;
  }
    // Add new basic types here.
    this( int[] shp, bool[] val) {
      this.shp = shp;
      this._bval = val;
    }
    this( int[] shp, int[] val) {
      this.shp = shp;
      this._ival = val;
    }
    this( int[] shp, double[] val) {
      this.shp = shp;
      this._dval = val;
    }

   public:
     int[] getShp() {
       return( shp);
     }

     bool[] getB() {
       return( _bval);
     }

     int[] getI() {
       return( _ival);
     }

     double[] getD() {
       return( _dval);
     }

     char[] getC() {
       return( _cval);
     }
}
unittest {
  writeln( "got to unittest for Array.d ");
  auto v = Parray();
  assert( (null == v.shp) && ( null == v._ival));
  assert( ( null == v._bval));
  assert( ( null == v._ival));
  assert( ( null == v._dval));
}
