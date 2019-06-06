 r←ph PhraseRecognizer1 ast;cv;pc;pn;tar;i;j;t
⍝ Recognize the single phrase ph,
⍝ a series of monadic functions
⍝ chained together. The leftmost may be dyadic or
⍝ monadic. Caller will figure it out.
 pn←D ph[PHRASEName] ⍝ The names
⍝ KLUDGE de jure -- we look at vector left/right only.
⍝ This is in an attempt to make at least one benchmark
⍝ work with phrases before the Conference and the Thesis
 cv←D ast[D ast[;astrarg];astrank]
 cv←1=cv ⍝ KLUDGE VECTORS ONLY
 cv←cv∧ast[;astfn]∊ER1 pn[0] ⍝ Starting point
 tar←cv/⍳⍴cv
⍝
 t←tar
⍝ Now loop over users of targets. Oh, another KLUDGE:
 :For i :In 1+⍳¯1+⍴pn
⍝
     t←,D ast[t;astrarg] ⍝ Get operands
     j←ast IsTemp t ⍝ Ignore non-temps KLUDGE AGAIN
     j←j∧ast[t;astlarg]∊NULL
     j←j∧ast[t;astfn]∊E pn[,i]
     cv←cv\j
     tar←j/tar ⍝ Delete chaff
     t←j/t
⍝
     tar←t,¨tar
 :EndFor
 r←tar ⍝ Return vector of vectors of the phrase
