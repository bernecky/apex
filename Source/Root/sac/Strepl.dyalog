﻿ r←k Strepl y;rinp;sub
 ⍝ Replace k by D y[1] in D y[0]
 ⍝ This because we don't have a working "each"
 rinp←D y[0] ⋄ sub←D y[1]
 r←rinp Strplc(E k),E sub
