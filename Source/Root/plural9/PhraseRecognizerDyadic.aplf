 r←PhraseRecognizerDyadic ast;ph;tars
⍝ Recognize dyadic phrases
⍝ These are a series of monadic functions
⍝ chained together, with the leftmost one dyadic.
 ph←PHRASE ⍝ Get dyadic phrases
 ph←(~ph[;PHRASEDyadicOut]∊E,':')⌿ph ⍝ Dyadics only
⍝ Quick, before APL96! Get it working!
 tars←(ER1 ph)PhraseRecognizer1¨E ast ⍝ Get all phrases
 ∘
 ∘
