﻿ r←APL ast;hdr;body;SGIN;SGOUT
⍝# Generate APL from ast
 hdr←APLHeader ast
 body←APLBody ast
 SGIN←APLSGIN ast
 SGOUT←APLSGOUT ast
 r←hdr,SGIN,SGOUT,body
