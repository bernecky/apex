 r←m LFNast ast;i;j;k;nast;iv;m;n;b;sr;b;v;ar;cv;di;f
 ⍝ Tinker ast for local fn invocation
 di←dfainit ast ⍝ Handy item
 ast[;asttag]←ER0⍳1↑⍴ast ⍝ Tag for caller
 cv←m ExtractSubFn ast ⍝Find subtree
 iv←cv∨~di ⋄ iv←iv\⍳+/iv ⍝ New numbers
 nast←iv RenumberAst ast ⍝ Extract it
 iv←,m⌿ast ⍝ The invocation
 iv[asttarget]←E 1 ⍝ Canonical result
 k←astlop,astfn,astrop,asttag,astchar
 k←k,astlr,astll,astlt,astrt ⍝ Cloning info
 f←iv[astfn] ⍝ The fn being invoked
 iv[k]←ast[D f;k] ⍝ Move fn into skeleton
 iv[astclass]←astclassVARB ⍝ Now a varb for sure
 ⍝ Now fix argument row #s
 k←astlop,astrop,asttag,astchar
 k←k,astlr,astrr,astlt,astrt ⍝ Cloning info
 b←(isnum iv[k])∧~k∊NULL
 ⍝ Insert argument(s) to local fn.
 ⍝ Cases are: local fn monadic or dyadic.
 ⍝ If call is dyadic, fn must be dyadic.
 ⍝ If call is monadic, argument is right arg
 ⍝ of local fn if available, else left argument
 v←iv[astlarg,astrarg]∊NULL ⍝ Available lfn args
 ar←,(m⌿ast)[;astlarg,astrarg] ⍝ Invocation lfn args
 ar←(~ar∊NULL)/ar ⍝ Less holes
 'Dyadic invocation of monadic fn'assert(+/v)≥⍴ar
 ⍝ Invocation is ok.
 ∘
 iv[v/astlarg,astrarg]←ar,(¯1++/v)/NULL
 i←astlarg,astlop,astfn,astrop,astrarg,asttag
 nast[m/⍳⍴m;i]←iv[i] ⍝ Fill in stuff.
 ⍝ If we are only referent to lfn, kill its defn
 i←~f∊nast[;astlop,astfn,astrop]
 i←D i/f
 nast[i;]←astNewRows⍴i
 r←nast
