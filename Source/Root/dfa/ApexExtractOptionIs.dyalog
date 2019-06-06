﻿ r←ApexExtractOptionIs y;f;b;op
⍝ Predicate for APEX option set (one option only)
 f←,ApexExtractOption y ⍝ Left-justify
 f←(1+⍴y)↓f ⍝ delete option name
 f←dtb dlb f ⍝ Delete leading and trailing blanks
 r←(E f)∊(E,'1'),(E'true'),E'yes'
