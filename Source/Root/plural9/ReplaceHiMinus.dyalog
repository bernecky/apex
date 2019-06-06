 r←ReplaceHiMinus c
⍝ Replace ¯ by - in numeric constants
 r←c
 r[(c∊'¯')/⍳⍴c]←'-'
