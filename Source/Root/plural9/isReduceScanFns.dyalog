﻿ r←isReduceScanFns fns;fn
⍝ Separate Reduce/Scan sheep from Compress\Expand goats
 fn←(E'sl'),(E'sl1'),(E'bsl'),E'bsl1'
 r←(fns[;fnsfn]∊fn)∧fns[;fnslop]∊NULL
⍝ This fails to detect cases of mask/mesh, if we ever implement them!
