 ⍙N ⍙DUMPws ⍙F;⍙I;⍙T;⎕IO
 ⍝Subroutine called by dumpws
 ⍝ ⍙F is the file name, ⍙N is the list of object names, ⍙QIO is global ⎕IO
 ⎕IO←1
 →(0=1↑0⍴⍙N)/⍙1               ⍝ If names were specified,
 ⍙N←⍙VTOM,' ',⍙N              ⍝    get the list as a matrix
 ⍙N←(⍙N∨.≠' ')⌿⍙N
 ⍙T←''
 →⍙2                          ⍝ Else,
⍙1:⍙N←⎕NL 2 3                 ⍝    write all fns and vars
 ⍝ Do this because APL.68000 Level I doesn't sort the ⎕NL result:
 ⍙N←⍙N[⎕AV⍋⍙N;]               ⍝    in alphabetic order
 ⍝ *** ↑ Dyadic grade, not available on all systems...
 ⍙T←GRPA2A ⍙OVER ⍙VTOM';⍙QIO;⍙N;⍙F;⍙I;⍙T'
 ⍙N←(0=⍙T ⍙MATIOTA ⍙N)⌿⍙N     ⍝    except the A2A objects
 ⍙N←⍙QVARS ⍙OVER ⍙N           ⍝    write quad variables too
⍙2:⍙OUT'Writing the following objects to file:'
 ⍙OUT' ',' ',(⎕PW-2)⍙TELPRINT ⍙N←⍙DLTB ⍙N
 ⍙T←'∇---- APLASCII version:  ',⍙A2AVER,⍙TCNL
 ⍙T←⍙T,'∇---- Source APL system:  ',⍙APLNAME,⍙TCNL
 ⍙T←⍙T,'∇---- Workspace:  ',⍙WSID,⍙TCNL
 ⍙T←APL2ASCII ⍙T

 ⍝ On APL*PLUS (in which TFWRITE has a noninteractive append option),
 ⍝   write one object at a time:
 →('APLPLUS'∨.≠7↑⍙APLVER)/⍙5
 ⍝ We write each to distinct named file
 ⍙I←0
⍙3:→((1↑⍴⍙N)<⍙I←⍙I+1)/⍙4      ⍝ Loop for each object
 ⍙T←INSERTFNS'∇',⍙N[⍙I;],⍙TCNL⍝    get the defn
 ⍙T TFWRITE ⍙F,(⍕⍙I),'.wif'   ⍝    append it to a new file
 ⍙T←0                         ⍝    reclaim storage
 →⍙3                          ⍝ Endloop
⍙4:⍙T←APL2ASCII'∇---- End of workspace'
 →⍙6

 ⍝ On other systems, build the whole result in memory:
⍙5:⍙T←⍙T,⍙TCNL ⍙MTOV INSERTFNS'∇',⍙N
 ⍙T←⍙T,APL2ASCII(2⍴⍙TCNL),'∇---- End of workspace'
 ⍙T TFWRITE ⍙F

⍙6:⍙OUT'Done.'
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
