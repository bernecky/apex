﻿ r←mainconvo2 y;tr;wz;r1;r2
 ⍝ Execute convolution problems and compare results
 wz←0.1 0.3 0.6 0.8 1 0.8 0.6 0.3 0.1
 tr←0.1+⍳y
 r1←wz convo tr ⍝ Perform outer product convolution
 r2←wz conv tr ⍝ Perform inner product convolution
 r←r1≡r2
