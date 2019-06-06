 r←MultipleAssigns ast;i;j;k;tar;counts
 ⍝ Get cv & count for ast names w/multiple
 ⍝ assignments to them. I.e., those needing
 ⍝ to be renamed for SSA purposes
 i←NamedAssigns ast ⍝ Find non-temp assigns
 r←i∧0 ⍝ Initialize result cv
 k←histogram(i⌿ast)[;asttarget]
 ⍝ We must consider formal args to the function
 ⍝ as assigns, or we'll miss the first subsequent set
 ⍝ e.g., in "foo y", a line reading "y{<-}{iota}y".
 tar←D k[0] ⍝ targets of assigns
 counts←D k[1]
 r[tar]←counts
 ⍝ ⍺ and ⍵
 r[2 3]←r[2 3]+~ast[2 3;asttarget]∊E' -'
