﻿ r←x RenameCloneRefs astscaller;callee;suffix;callsite;pv;np;refs;target;cv;astcaller
⍝ Rename one call of a subfn by a call to the subfn clone
 callee←D x[0]                    ⍝ Subfn being called
 suffix←D x[1]                    ⍝ Suffix for subfn clone
 callsite←D x[2]                  ⍝ Caller ast row for call
 ⍝ This isn't quite going to work for "foo.foo" and the like...
 astcaller←D astscaller[ssaast]
 cv←D astscaller[ssacv]
 target←astcaller[;asttarget]⍳E callee    ⍝ Find fn name
 ⍝ Find and clone :GI and :GO entries
 pv←(1↑⍴astcaller)⍴1
 pv[target]←2
 np←+\0,¯1↓pv
 astcaller←pv⌿np RenumberAst astcaller    ⍝ Renumber non-clone stuff
 astscaller[ssacv]←E pv/cv
 astcaller[target+1;asttarget]←E callee,suffix ⍝ Rename subfn in caller
 astcaller[target+1;asttag]←E target+1
 refs←astcaller[callsite+1;astptrs]       ⍝ Point fn calls to clones
 pv←refs∊target
 refs[pv/⍳⍴pv]←refs[pv/⍳⍴pv]+1
 astcaller[callsite+1;astptrs]←refs
 r←astscaller
 r[ssaast]←E astcaller
