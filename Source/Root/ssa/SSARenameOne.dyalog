 r←x SSARenameOne y;st;ast;bb;i;j;k;m;n;kv;top;rt;C;S;rt2;v;tar;nms;us
 ⍝ Rename one SSA variable
 ⍝ From Michael Wolfe , 1992
 ⍝ "High Performance Compliers", p 182
 ast←D y[ssaast] ⋄ bb←D y[ssabb]
 v←x[0] ⋄ tar←x[1] ⍝ Names, index
 top←(⍳v)GenSSANames ast[tar;asttarget]
 top←top,E(D ast[tar;asttarget]),'?' ⍝ Value error
 us←D ast[tar;asttarget]
 'SSARenameOne is renaming: ',(D ast[0;asttarget]),':',us
 ⍝ Provision of the value error name permits us to
 ⍝ detect use before set. It also simplifies
 ⍝ Gen logic in SSASearch. 1995-09-17
 k←ast[(⍴top)⍴tar;] ⍝ Copy s.t. entry
 k[;asttarget]←top
 ⍝ Inserted names can't be SGI, by definition,
 ⍝ but may still be SGO.
 n←(k[;astscope]∊astscopeSGI+0,astscopeSGO)/⍳1↑⍴k
 k[n;astscope]←k[n;astscope]-astscopeSGI
 ⍝ Insert new st rows into ast
 n←~dfainit ast ⍝ End of old st.
 m←¯1++/n
 j←(n×⍳⍴n)+(~n)×(1↑⍴top)+⍳⍴n ⍝ New row numbers
 ast←j RenumberAst ast
 ast←((m,¯1↑⍴ast)↑ast)⍪k⍪(m,0)↓ast ⍝ Insert new names
 bb←((⍴top)⍴0),bb ⍝ Same bb, names only added
 rt←y
 astok ast
 rt[ssabb]←E bb ⋄ rt[ssaast]←E ast
 ⍝ Right arg is ssa stuff, C, S
 ⍝ Since function arguments look like "generates" or "sets"
 ⍝ of variables, we have to fake up their C and S values.
 ⍝ Ditto semi-globals in!
 C←(ast[;astscope]∊astscopeSGI+0,astscopeSGO)/⍳1↑⍴ast ⍝ Semiglobals in
 C←tar∊dfnlarg,dfnrarg,C ⍝ Argument or semiglobal
 'DEBUG'assert~stophere∊tar
 'DEBUG stupid PHI'assert~ast[;astlarg]=⍳1↑⍴ast
 ⍝ First S element is value error or formal parameter
 S←((ast[;asttarget]⍳¯1↑top),tar)[,C]⍝ Top of list
 'DEBUG'assert~(E us)∊stophere
 Checkem rt
 rt←((E 0),E E tar)SSASearch(E rt),(E S),E top ⍝ Start w/node 0
 r←D rt[0] ⍝ New improved y
 'Rename failure'assert 1≥+/(D r[ssaast])[;asttarget]∊tar
 Checkem r
 astok D r[ssaast]
