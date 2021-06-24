#define TAKE( a)                                                                 \
inline                                                                           \
a[+] overtake( int[.] v, a[+] array)                                             \
{                                                                                \
  shpa = _shape_A_( array);                                                      \
  zr = _mul_VxS_( shpa, 0);                                                      \
  ylb = zr;                                                                      \
  lb = zr;                                                                       \
  vext = shpa;                                                                   \
                                                                                 \
  /* Pad take count for Bernecky's extended take */                              \
  /* See APL model in function Take in apex test suite UTTakeDrop */             \
  /* for-loop should get unrolled */                                             \
  for( i=0; _lt_SxS_( i, _sel_VxA_( [0], _shape_A_( v))); i= _add_SxS_( i, 1)) { \
    vel = _sel_VxA_( [i], v);                                                    \
    shpel = _sel_VxA_( [i], shpa);                                               \
    vext  = _idx_modarray_AxSxS_( vext,  i,  vel);                               \
    val = _sub_SxS_(0, vel);                                                     \
    val = _sub_SxS_( val, shpel);                                                \
    val = _max_SxS_( val, 0);                                                    \
    val = _mask_SxSxS_( _ge_SxS_( vel, 0), 0, val);                              \
    lb = _idx_modarray_AxSxS_( lb, i, val);                                      \
    val = _max_SxS_( 0, _add_SxS_( shpel, vel));                                 \
    val = _mask_SxSxS_( _ge_SxS_( vel, 0), 0, val);                              \
    ylb = _idx_modarray_AxSxS_( ylb, i, val);                                    \
  }                                                                              \
  shpz = _abs_V_( vext);                                                         \
  ub = _min_VxV_( shpa, shpz);                                                   \
  ub = _add_VxV_( ub, lb);                                                       \
  res = with {                                                                   \
          ( lb <= iv < ub ) :                                                    \
              _sel_VxA_( _add_VxV_(                                              \
                           _sub_VxV_( ylb, lb), iv), array);                     \
        } : genarray( shpz, zero(array));                                        \
  return( res);                                                                  \
}


#define DROP( a)                                                                 \
inline                                                                           \
a[*] drop( int[.] v, a[*] array)                                                 \
{                                                                                \
  shpa = _shape_A_( array);                                                      \
  zr = _mul_VxS_( shpa, 0);                                                      \
  offset = zr;                                                                   \
  /* Pad drop count */                                                           \
  vext = zr;                                                                     \
  for( i=0; _lt_SxS_( i, _sel_VxA_( [0], _shape_A_( v))); i= _add_SxS_( i, 1)) { \
    el     = _sel_VxA_( [i], v);                                                 \
    shpel  = _sel_VxA_( [i], shpa);                                              \
    vext   = _idx_modarray_AxSxS_( vext,  i,  el);                               \
    val    = _mask_SxSxS_( _le_SxS_( el, 0), 0, _min_SxS_( shpel, el));              \
    offset = _idx_modarray_AxSxS_( offset, i, val);                              \
  }                                                                              \
  shpz = _max_VxV_( zr,_sub_VxV_( shpa, _abs_V_( vext)));                        \
  res = with {                                                                   \
          ( . <= iv <= . ) : _sel_VxA_( _add_VxV_( offset, iv), array);          \
        } : genarray( shpz, zero(array));                                        \
  return( res);                                                                  \
}

