﻿ r←Mean y
 r←(+/y)-⌈/y ⍝Ignore largest timing as noise
 r←r÷¯1+⍴y
