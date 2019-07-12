U2H←{ ⍝ Unicode to HTML symbol
     ⍝ Courtesy of Brian Becker, brian@dyalog.com, 2019-07-07
     ⍝ Workaround for HTMLRenderer failure to render APL characters
     0∊⍴i←⍸255<u←⎕UCS r←⍵:⍵
     r[i]←{⊂'&#',(⍕⍵),';'}¨u[i]
     ∊r
}  
