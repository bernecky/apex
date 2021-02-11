 RunAllBenchmarks;aks;akd;b;i;N
 ⍝ Run all APEX benchmarks; save results
 b←benchmks
 i←∨/¨(E'AKD')∊¨b
 akd←i/b
 aks←(~i)/b
⍝
⍝ Run each test N times, because
⍝ of poor timer precision
 N←5
 :For i :In aks
     RunBenchmark1¨N⍴E i
 :EndFor
 :For i :In akd
     RunBenchmark1¨N⍴E i
 :EndFor
