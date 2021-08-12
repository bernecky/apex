
⎕IO←0
)load wss/apexn.dws
target←⎕SH'echo $TO'
t←↑(⊆'targetLanguage='),target[0]
ts←×/⍴t
arguments←ts⍴t
bm←benchmks.benchmks'Ancillary/benchmks/UnitTests'
⎕←z←⍪(⊆arguments)apex¨bm
