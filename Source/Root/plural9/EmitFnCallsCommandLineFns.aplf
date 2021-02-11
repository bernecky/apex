 r←EmitFnCallsCommandLineFns y;fns;cv;cal;ast;sc;ctl
⍝# Emit calls for command-line fns
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 ctl←7 FragmentCode'commandline'
 cv←∨/<\(ctl FindFn fns)∧ctl FindType fns
 :If TargetLanguage≡'plural' ⍝ Kludge
     cal[cv/⍳⍴cv;callarg]←E'args, '
 :EndIf
 cal[cv/⍳⍴cv;calranks]←E'' ⍝ No argument rank needed for SAC
 cal←cv EmitAssignment(E ast),E cal
 r←y ⋄ r[3]←E cal
