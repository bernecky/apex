﻿ r←benchmks nm
⍝ Return list of available benchmarks
 r←(GetOption'apexpath'),GetOption'benchpath'
 r←ls'-r ',r,nm
