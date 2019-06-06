 p CreateFnFiles n;lg
⍝ Create function paging file with n hash buckets
⍝ in directory p
 (⍕n)PutFile p,'dir-hash'
 lg←'ZI',(⍕⍴⍕n),',<.src>'
 (E'')PutFile¨(E p,'x'),¨ER1 lg ⎕FMT⍳n
