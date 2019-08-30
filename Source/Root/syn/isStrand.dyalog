isStrand←{
 ⍝ Check for Strand on Stack ⍵ at offset ⍺ from TOS
 ⍝ (a b) is a strand; (c) is not a strand
 StS=((⍺-1),Stkstate)⌷StackCopy ⍺
}

