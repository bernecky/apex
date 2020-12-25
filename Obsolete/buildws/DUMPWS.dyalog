 {⍙N}DUMPWS ⍙F;KEEPUS;⍙QIO
⍝Writes all objects in the workspace to file ⍵
⍝ Arguments:
⍝   ⍙F   - the name of the file to write
⍝   ⍙N   - (optional) the names of functions and variables to write.
⍝          If ⍙N is omitted or is numeric, all objects are written.
⍝
 ⍎(0=⎕NC'⍙N')/'⍙N←0' ⍝ write everything by default
 KEEPUS←1            ⍝ preserve all character distinctions
 ⍙QIO←⎕IO            ⍝ capture global value for use by INSERTFNS
 ⍙N ⍙DUMPSUB ⍙F      ⍝ do the work
⍝ APLASCII.DYALOG version 1.4 (1995.10.15)
