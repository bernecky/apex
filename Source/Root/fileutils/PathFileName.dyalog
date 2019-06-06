 r←PathFileName fnm
⍝ Extract filename from path name
 r←(⌽∧\⌽fnm≠PathDelim)/fnm
