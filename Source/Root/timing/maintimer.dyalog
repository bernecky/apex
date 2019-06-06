 maintimer;t;bname;j;LF;r;i
⍝ Timer for APL benchmarks
 r←⍳0
 :For i :In ⍳5
     j←⎕AI
     main
     j←⎕AI-j
     ⎕←'CPU time: ',j[1],'msec'
     r←r,j[1]
 :EndFor
 bname←⎕WSID                  ⍝ Benchmark name
 bname←(∧\bname≠'.')/bname    ⍝ drop .dws
 bname←(⌽∧\⌽bname≠'/')/bname  ⍝ drop path
 bname←bname,'.dyalogAPL'     ⍝ Identify source of timing
 t←⍕((⍴r),1)⍴(1⌈r)÷1000       ⍝ times in seconds. Sigh.
 LF←⎕AV[2]
 t←bname,LF,,t,((1↑⍴t),5)⍴'user',LF
 t PutFile'sandbox/',bname,'.timings'
