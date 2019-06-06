 r←GetOption y;opts
⍝ Get APEX compiler option y
⍝ These are defined as:
⍝ 'option1=value1' 'option2=value2' ...
⍝ E.g., APEXGetOption 'output'
⍝
 opts← ReadFile'apex.opt' ⍝ Get option file
 opts←vtom NL,opts
 opts←(opts[;0]≠'#')⌿opts ⍝ Ignore comments
 opts←opts rcat y,'=' ⍝ Avoid index error
 r←(opts[;⍳1+⍴y]∧.=y,'=')⌿opts ⍝ Option name must start in col 0
 r←dtb dlb(1+⍴y)↓r[0;]
