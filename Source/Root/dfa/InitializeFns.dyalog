 InitializeFns
 fnslop←0        ⍝ Left operand of conjunction
 fnsfn←1        ⍝ Function/conj/adverb name being called
 fnsrop←2        ⍝ Right operand of conjunction/adverb
 fnstypes←3      ⍝ Function types (l,r,z)
 fnstypeslarg←0 ⍝  type of left argument
 fnstypesrarg←1 ⍝  type of right argument
 fnstypesz←2    ⍝  type of result
 fnsranks←4      ⍝ Function rank  (l,r,z)
 fnsrankslarg←0 ⍝  rank of left argument
 fnsranksrarg←1 ⍝  rank of right argument
 fnsranksz←2    ⍝  rank of result
 fnslpar←5       ⍝ Left paren of call
 fnslarg←6       ⍝ Left argument name and trailing comma
 fnsrarg←7       ⍝ Right argument name
 fnsrpar←8       ⍝ Right paren of call
 fnscols←9       ⍝ Number of columns in a fns entry
 ⍝ We should really use the same column definitions for
 ⍝ fns and cal...
 calfn←2         ⍝ Function name being called
 caltypes←4      ⍝ Function types (see what I mean about cal/fn?)
 calranks←5      ⍝ Function ranks
 callpar←6       ⍝ Left paren of call
 callarg←7       ⍝ Left argument name
 calcomma←8      ⍝ Comma betwen callarg,calrarg
 calrarg←9       ⍝ Right argument name(s) (for indexing)
 calrpar←10      ⍝ Right paren of call
