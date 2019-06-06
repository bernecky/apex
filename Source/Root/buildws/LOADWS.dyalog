 ⍙Z←LOADWS ⍙F;⍙QIO
 ⍝Reads transliterated file ⍵, defining objects in the workspace
 ⍙QIO←⎕IO       ⍝ setting this serves as a flag for DEFINEFNS
 ⍙Z←⍙LOADSUB ⍙F ⍝ do most of the work
 ⎕IO←⍙QIO       ⍝ set value imported from the file
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
