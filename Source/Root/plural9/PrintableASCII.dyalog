﻿ r←PrintableASCII
⍝# Printable (for SAC) ASCII characters
 r←' ,./<>?;'':"[]\{}∣‘~!@#$%^&*()_+-='
 r←r,26↑(⎕AV⍳'a')↓⎕AV
 r←r,26↑(⎕AV⍳'A')↓⎕AV
 r←r,10↑(⎕AV⍳'0')↓⎕AV
