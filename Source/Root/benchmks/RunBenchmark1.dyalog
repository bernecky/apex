 RunBenchmark1 bm;args;blist;argv;ufns;fntext;argfn;Invoke;p;op;fns;r
⍝ Run benchmark in path bm
 blist←ReadFile bm
 ufns←ER1 vtom ¯1⌽blist,(NL≠¯1↑blist)⍴NL
 fntext←ReadFile¨(E #.fileutils.Path bm),¨ufns
 :If ∨/'AKD'⍷bm
     argv←ReadFile(#.fileutils.Path bm),'bench.argv'
     argv←(argv⍳NL)↑argv
 :Else
     argv←''
 :EndIf
 fns←CreateLocalFns(E ufns),E argv
 fntext←vtom¨NL,¨fntext
 p←#.fileutils.PathFileName(-1+⍴#.fileutils.PathFileName bm)↓bm
 ⎕←(fts ⎕TS),': Invoking: ',p
 ForceBigWS
 r←E'Start time: ',fts ⎕TS
 r←r,fns Invoke fntext
 r←r,E'Stop time: ',fts ⎕TS
 ⎕←(fts ⎕TS),': Finished: ',p
 r←,(D r),NL
 op←'APEXtime.',(2 ⎕NQ'.' 'GetBuildID'),'.'
 op←op,fts ⎕TS ⍝ Output filename
 op[(op=' ')/⍳⍴op]←'_'
 op←(#.fileutils.Path bm),op
 op PutFile r
