﻿ snxx
 ⍝ State is expression, signal is expression
 ⍝ This is likely a strand, such as:
 ⍝   ((x foo y) c d)
 Push Stx ⍝ Hopefully, we will rescan the strand (fooz c d)
 ⍝⍝ PushCursor Push Stx
