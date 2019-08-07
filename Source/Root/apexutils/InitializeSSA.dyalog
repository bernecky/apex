 InitializeSSA
 ⍝ DFA and SSA data structure
 ssaast←1+ssast←0                   ⍝ Symbol table, AST
 ssacfg←1+ssabb←1+ssacv←1+ssaast    ⍝ Control flow graph,
                                    ⍝ Basic block pv, worklist
 ssadomt←1+ssadf←1+ssadom←1+ssacfg  ⍝ Dominator tree, ?
                                    ⍝ Dominators
 ssatok←1+ssasrc←1+ssadomt          ⍝ tokenized source, source
 ssawif←1+ssatok                    ⍝ WIF-format source
 ssaastbackup←1+ssawif              ⍝ Backup copy of ast for cloning
 ssalen←1+ssaastbackup
