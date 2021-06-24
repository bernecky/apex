% Monadic Scalar Function code fragments
%
% Supports arbitrary user array index origin 1996-03-26 /rbe
%
% Fragment header contes:
%    percentFragment  marks the beginning of each code fragment.
%    Fields are delimited by blanks.
%    Field 1: primitive function jsymbol
%    Field 2: acceptable left argument types
%    Field 3: acceptable right argument types
%    Field 4: Left compute type for this fragment
%             (i.e., left argument will be coerced to this type
%             by EmitMonadicScalarFns
%             "x" if none
%    Field 5: Right compute type for this fragment
%             (i.e., right argument will be coerced to this type)
%             by EmitMonadicScalarFns
%    Field 6: Result type for fragment
%    Field 7: Comments
%

%Fragment query x bid x i i    Roll 
UnderConstruction($YV)
%
%
%Fragment mod x b x b b        Absolute value Boolean (nop)
$YV
%
%Fragment mod x i x i i        Absolute value Integer
abs($YV)
%
%Fragment mod  x d x d d       Absolute value Double 
abs($YV)
%
%Fragment bar  x b x i i       Negation Boolean
-$YV
%
%Fragment bar  x i x i i       Negation Integer
-$YV
%Fragment bar  x d x d d       Negation Double
-$YV
%
%Fragment plus x b x b b       Plus Boolean (nop)
$YV
%Fragment plus x i x i i       Plus Integer (nop)
$YV
%Fragment plus x d x d d       Plus Double (nop)
$YV
%
%Fragment min  x b x b b       Floor Boolean (nop)
$YV
%Fragment min  x i x i i       Floor Integer (nop)
$YV
%Fragment min  x d x d i       Floor Double 
floor($YV)
%
%Fragment max  x b x b b       Ceiling Boolean (nop)
$YV
%Fragment max  x i x i i       Ceiling Integer (nop)
$YV
%Fragment max  x d x d i       Ceiling Double 
%
% This is done using floor and the identity:
%  (ceiling y) = (- floor -y)
-floor(-$YV)
%
%Fragment mpy  x b x b b       Times Boolean (nop)
$YV                             
%Fragment mpy  x i x i i       Times Integer (Signum)
Isignum($YV)
%Fragment mpy  x d x d i       Times Double (Signum)
Dsignum($YV)   
%
%Fragment not  x b x b b       Not Boolean
~$YV
%Fragment not  x i x b b       Not Integer
~$YV
%Fragment not  x d x b b       Not Double
~$YV
%
%Fragment div  x b x d d       Divide Boolean
1.0d0/$YV
%Fragment div  x i x d d       Divide Integer
1.0d0/$YV
%Fragment div  x d x d d       Divide Double
1.0d0/$YV
%
%Fragment star x b x d d       Exp Boolean
exp(E,$YV)
%Fragment star x i x d d       Exp Integer
exp(E,$YV)
%Fragment star x d x d d       Exp Double
exp(E,$YV)
%
%Fragment log  x b x d d       Log Boolean
log($YV)
%Fragment log  x i x d d       Log Integer
log($YV)
%Fragment log  x d x d d       Log Double
log($YV)
%
%Fragment circ x b x d d       Circle Boolean
PI*$YV
%Fragment circ x i x d d       Circle Integer
PI*$YV
%Fragment circ x d x d d       Circle Double
PI*$YV
