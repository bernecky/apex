ListStrand←{                           
  NULL=⍵  : ⍳0
  cur←⍺[⍵;astlarg,astfn,astrarg]
  cur←(NULL≠cur)/cur
  cur←cur,⍺ ListStrand ⍺[⍵;astrarg]      
  cur←(~isTempName¨cur)/cur
}                                      
  
