﻿ r←MarkAdvConjFns ast;cv;tar
⍝# Mark ast rows that are adverbs or conjunctions
⍝# This allows disambiguation of them vs replicate/expand
⍝# and also gives us correct fns naming
 cv←ast[;astfn]∊,¨E¨'/⌿\⍀.∘ö⍤
 r←cv\~(cv⌿ast[;astlop])∊E NULL ⍝ Ignore replicate/expand
