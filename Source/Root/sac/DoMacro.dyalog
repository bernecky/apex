 r←mn DoMacro y;frag;lp;cv;mi;mp;ctl;mac;cvz;m;i;x
 ⍝ Macro Expander.
 ⍝ This extracts everything up to
 ⍝ the closing "}" of the macro defn in the
 ⍝ fragment.
 ⍝ mn[0] is the macro name.
 ⍝ mn[1...n] are strings to search for
 ⍝ We replace the iTH string by iTH argument
 ⍝ text in the fragment.
 ⍝ y[0] is source text
 ⍝ y[1] is text to replace the
 ⍝ macro name and operands in source text
 ⍝ If y[1]≡E'', the macro invocation vanishes,
 ⍝ except for other text replacements.
 ctl←D y[0]
 frag←D y[1]
 mac←D mn[0] ⍝ Get the macro name
 ⍝ ctl is boxed vectors of text
 ctl←,D ctl ⍝ Now text vector
 ⍝ Find the macro invocations
lp:x←mn ⍝ Refresh replacement list
 →(0=∨/cvz←mac MacroLocate ctl)⍴lz ⍝ No hits
 mi←1↓¯1↓(⍴mac)↓cvz/ctl ⍝ The invocation
 mp←MacroParms mi ⍝ Break parameters
 ⍝ Replace macro defn with fragment.
 i←cvz⍳1 ⋄ ctl←(i↑ctl),frag,i↓(~cvz)/ctl
LP:→(0=⍴x←1↓x)⍴lp
 ctl←ctl Strplc x[0],mp[0] ⋄ mp←1↓mp ⋄ →LP
lz:r←ctl
