 r←x sntx n;i;j;k;src;tok;st;m;gst;f;s;ast;etr;cv;sj;wif
 ⍝ Build symbol table and abstract syntax tree from tokenized src
 gst←D x[0] ⋄ s←D x[1] ⍝ Global symbol table; tokenized source code
 st←gst Buildst D s[n] ⍝Build the local symbol table
 src←D(D s[n])[0]
 tok←D(D s[n])[1]
 ⍝ Should do this rank1, but don't have rank support for defined
 ⍝ fns in this APL system.
 i←src[0;]
 ⎕←'Syntax analysis for: ',(i⍳';')↑i
 ast←st Buildast(E src),E tok
 ast←ast HandleDeclarations src
 Checkem 2⍴E ast ⍝ Pardon the kludge
 r←(1↑⍴src)⍴E ast
 :For i :In 1↓⍳⍴r    ⍝ Line 0 is special
     ast←((E ast),E i)SyntaxAnalyzer(E src[i;]),E tok[i;]
     Checkem 2⍴E ast
 :EndFor
 ⍝ Deal with possibly differing ast st parts
 ⍝ The following assertion tries to make sure that all
 ⍝ lines of the function have the same idea about what
 ⍝ the classes of the locals and arguments are.
 ⍝ It fails for (at least) naked verbs, etc.
 r←ssalen⍴E'?'
 r[ssast]←E st
 r[ssaast]←E ast
 r[ssasrc]←E src
 r[ssatok]←E tok
