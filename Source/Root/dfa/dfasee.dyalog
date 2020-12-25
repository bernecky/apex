 asts←dfasee asts;ast;cv
⍝ Display current ast state for programmer
⍝ Make this work some day...
 Checkem asts
 :If #.globals.VisualizeDfa
     asttype ColorAST asts ⍝ Visual following of type determination
 :EndIf
