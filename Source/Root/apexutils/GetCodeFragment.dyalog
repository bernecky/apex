 r←n GetCodeFragment y;cv;i;b;j;cf;cnt;frg
 ⍝ Get code fragment and break it into pieces:
 ⍝  Code fragments, names,n types
 ⍝ See msf.sis for more docn on types
 ⍝ If fragment has been broken already,
 ⍝ use it. Otherwise, break it up, and
 ⍝ refresh the broken fragment.
 cf←TABtoBlank nolf ReadFile #.globals.PathFrag,y,'.frg'
 cf←¯1⌽cf,(NL≠¯1↑cf)/NL
 i←1⌽D(cf=NL)PartitionedEnclose cf
 ⍝ Discard pure comments, but leave Fragment and Generate
 i←(~(i[;0]='%')∧~i[;1]∊'FG')⌿i
 j←i[;⍳10]∧.='%Fragment ' ⍝ Find frags
 b←,(⌽∨\0 1↓⌽i≠' '),1 ⍝ Mark trailing blanks
 cv←(⍴i)⍴0 ⋄ cv[;0]←j ⍝ Matrix cut marks
 i←b/,i ⋄ cv←b/,cv
 r←cv PartitionedEnclose i ⍝ Cut code frags
 j←r⍳¨NL ⍝ Find header ends
 i←(D j↑¨r),' ' ⍝ Headers
 r←(1+¨j)↓¨r ⍝ Fragments sans header
 ⍝ Handle aliasing -- one fragment, many names
 j←,D⍴¨r ⋄ r←((j≠0)/r)[¯1↓+\0,j≠0]
 r←⍪r
 cnt←9⌈n ⍝ Maximum field count
lp:i←rtnb rtb i ⍝ Names or types
 j←field1 i
 r←r,⍪(+/j≠' ')⍴¨ER1 j ⍝ No blanks
 →(0≤cnt←cnt-1)⍴lp
 r←(E y),E r
