﻿ r←PhraseRecognizer ast
⍝ This code recognizes phrases in the ast
⍝ and generates an updated ast that handles them.
 r←PhraseRecognizerMonadic ast ⍝ Do the monadic ones
 r←PhraseRecognizerDyadic r ⍝ and now the dyadic ones
 ∘
