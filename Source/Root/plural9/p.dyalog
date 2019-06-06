⌷p←
<array><shape>2</shape>
<array><shape>1</shape><enclosed>
<array><shape>352</shape><string>Parray*  minXDI(Parray* y,double QUADct)£%A;{ /* Monadic scalar functions on array */£%A;  auto shp = y.getShp();£%A;  auto val = new I[ xrhoShp( shp)];£%A;  foreach ( i; 0 .. val.length) {£%A;    val[i] = minXDI(DtoD(y.getD()[i]), QUADct);£%A;  }£%A;  auto z = new Parray( shp, val);£%A;£%A;  return(z);£%A;}£%A;%Generate , min, XDI, x00, ., D£%A;%Generate , xrhoShp, III,     X10, ., I£%A;</string></array></enclosed></array>
<array><shape>0 12</shape><enclosed>
<array><shape>0</shape><string></string></array></enclosed></array></array>
