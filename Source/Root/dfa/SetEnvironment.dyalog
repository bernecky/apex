 SetEnvironment
 ⍝ Establish environmental variables for compiler
⍝WINDOZE...  drive←'d:'
⍝ path←drive,'\benchmks\' ⍝ Path to input files
⍝ pathfrag←drive,'\apex\fragment\' ⍝ Code fragment path
⍝ pathsource←drive,'\apex\source\' ⍝ Source code path
⍝ linux
 drive←⎕chdir  '' ⍝ Current directory. this is dumb
⍝ Path to input files
 path←drive,PathDelim,'benchmks',PathDelim
⍝ Path to code fragments
 pathfrag←drive,PathDelim,'apex',PathDelim,'fragment'
