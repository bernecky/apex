﻿ r←DeleteCaps txt
⍝# Delete upper case text from txt
 r←~txt∊⎕AV[(⎕AV⍳'A')+⍳26]
 r←r/txt
