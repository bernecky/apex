﻿ fns←CreateLocalFns(ufns args);hdr;txt;fail
 fns←(-⍴'.ufn')↓¨dtb¨ufns ⍝ The fns to localize
 hdr←E('r←fns Invoke fntext ;r;fxr;bef;aft',D Raze';',¨fns)
 txt←hdr,E'fxr←⎕fx¨fntext'
 txt←txt,E'''local fn fix failed'' assert fxr≡fns'
 txt←txt,E'bef←⎕ai'
 txt←txt,E'r←main ',args
 txt←txt,E'aft←⎕ai'
 txt←txt,E'⎕←(~0≡r)/''wrong result'''
 txt←txt,E'r←E''Start quadai: '', ⍕bef'
 txt←txt,E'r←r,E''Stop quadai: '',⍕aft'
 txt←txt,E'r←r,E''Delta quadai: '',⍕aft-bef'
 'Invoke fn fix failed'assert'Invoke'≡⎕FX D txt
