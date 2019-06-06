% Code fragment for quote-quad input and probably others

%Fragment qdd XX1 X X C .
inline char[.] $FNAME()
{ /* Quote-quad input */
  arbitrarylimit = 100000;
  z = drop([-1], tochar(scanl(arbitrarylimit)));
  return( z);
}

