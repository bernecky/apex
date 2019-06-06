 ReadLabels←{
Z←Ubyte 8↓GetFileInt8 ⍵
 ⎕←'Read ',(⍕⍴Z),' labels from ',⍵  
 Z
}

