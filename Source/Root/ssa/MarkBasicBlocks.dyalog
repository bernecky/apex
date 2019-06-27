 r←MarkBasicBlocks y;ast;b;b2;i;b3;b4
 ⍝ Mark basic blocks in ast
 ⍝ Builds a partition vector for the ast
 ⍝ and inserts it into the ast.
 ⍝ This builds an excessive number of basic blocks,
 ⍝ as we force extra blocks to be generated in order
 ⍝ to prevent two assigns of the same variable in the
 ⍝ same block. As of 1995-06-17, this is ONLY used
 ⍝ to make SSARenameOne easier.
 ast←D y[ssaast]
 r←<\dfainit ast ⍝ Mark Entry node
 r←r∨ast[;asttarget]∊E':RE' ⍝ Mark exit node(s) as bb
 ⍝ Mark bb starters
 b←ast[;astfn]∊E':if'
 b←b∨0,¯1↓b ⍝ :If has decision, then split
 i←(E':else'),E':elseif'
 b←b∨ast[;astfn]∊i
 b←b∨0,¯1↓ast[;astfn]∊E':endif'
 b3←ast[;astfn]∊(E':while'),E':for'
 b3←b3∨0,¯1↓b3 ⍝ For loops: loop and body are bb
 ⍝ :EndFor/:While: It and next marks new bb
 b4←ast[;astfn]∊(E':endfor'),E':endwhile'
 b4←b4∨0,¯1↓b4
 b4←r∨b∨b3∨b4
 ⍝ Next line [we wish we didn't need it] busts basic
 ⍝ blocks even further down, to isolate multiple assigns
 ⍝ of same variable so that two assigns of same name
 ⍝ don't occur in same bb. SSA Renaming will then
 ⍝ handle their renaming.
 b4←b4∨DupAssigns ast
 r←y ⋄ r[ssaast]←E ast
 r[ssabb]←E b4
