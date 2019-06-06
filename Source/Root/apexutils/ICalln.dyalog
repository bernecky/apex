 r←ICalln ast;i;cnt
 ⍝ Get indices of defined funs called by ast, and count of calls
 i←astclassDFN,astclassMFN,astclassNFN
 r←1↓(ast[;astclass]∊i)/⍳1↑⍴ast ⍝ Ignore dfnname
 r←(~ast[r;asttarget]∊(E,'⎕'),E,'⍞')/r ⍝ Ignore APL oddities
 r←(r<+/~dfainit ast)/r ⍝ Ignore derived fns, conj/adv operands
 cnt←r⍳,ast[;astlop,astfn,astrop]
 cnt←cnt[⍋cnt]
 cnt←¯1↓plengths cnt≠¯1⌽cnt
 r←(E r),E cnt
⍝ R. Bernecky 2004-06-11 Attempt to deal with system fns, quad, etc.
