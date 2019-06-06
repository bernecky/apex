﻿ clsinit
⍝ Initialize token classes
 clsassign←'a' ⍝ Left arrow (assignment)
 clsrbr←'b' ⍝    Right square bracket
 clslbr←'B' ⍝    Left  square bracket
 clschar←'c' ⍝   Character constant
 clslamp←'C' ⍝   Comment
 clsconj←'d' ⍝   Conjunction (dyadic operator) e.g., +.×
 clssep←'D' ⍝    Diamond statement separator
 clsfn←'f' ⍝     Primitive function
 clsgoto←'g' ⍝   Branch arrow
 clsid←'i' ⍝     Identifier
 clsctl←'k' ⍝    Ctl structure
 clscolon←'L' ⍝  Colon
 clssemic←'l' ⍝  Semicolon
 clsadverb←'m' ⍝ Adverb (monadic operator) e.g., +/
 clsnum←'n' ⍝    Numeric constant
 clsNilFn←'N' ⍝  Niladic function
 clslpar←'P' ⍝   Left parenthesis
 clsqq←'q' ⍝     Quote quad or quad
 clsrpar←'p' ⍝   Right parenthesis
 clsrescan←'R' ⍝ Rescan with new token class
 clsspace←'s'  ⍝ Blank
 clsexpn←'x' ⍝   Evaluated expn already on stack
 clsqdnm←'⎕' ⍝   System function or variable
 classes←clsassign,clsrbr,clslbr,clschar,clslamp,clsconj,clssep
 classes←classes,clsfn,clsgoto,clsid,clsctl,clscolon,clssemic
 classes←classes,clsadverb,clsnum,clsNilFn,clslpar,clsqq,clsrpar
 classes←classes,clsrescan,clsspace,clsexpn,clsqdnm
