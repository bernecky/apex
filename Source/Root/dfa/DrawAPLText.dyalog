﻿ colors DrawAPLText qcr;txt;j
 ⍝ Draw ⎕cr (qcr) APL text with RTF colors.
 txt←colors MakeRTF qcr
 F.txt.RTFText←txt
 j←⎕DL 0.1
