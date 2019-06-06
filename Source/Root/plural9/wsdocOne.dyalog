﻿ r←wsdocOne fn;fns;files;z
⍝ Generate postscript for fn in this ws
 fns←fn
 fns←ER1(~∨/fns∊'∆⍙')⌿fns ⍝ No evil characters, please
 files←noblankv¨(E'temp/'),¨fns
 r←(⎕VR¨fns)PutFile¨files,¨E'.apl'
 →(0∊r)⍴0.1 ⍝ oopsie
⍝ Now convert files to PostScript
 r←E'/opt/apl/rel5.4lx/postscript/apltops '
 r←r,¨(E'~/'),¨files,¨E'.apl'
 z←⎕SH¨r
