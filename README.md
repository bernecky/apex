# The APEX APL Compiler

APEX compiles a subset of Dyalog APL into one of several languages, currrently SISAL, SaC, and Plural).

To generate the compiler from github, clone the repository, say to apexgit, then do:
```
  cd apexgit
  ⍝ Start Dyalog APL V18.0 (or newer), downable from www.dyalog.com:
  )clear
  ]link.create # Source/Root
```
  
  At this point, you should have an unnamed workspace, which you can
  try out this way:
  ```
      '' apex 'TestsForNow/ipbb'
  ```    
  If specified, the left argument to the "apex" verb is a set of space-delimited
  compiler options, e.g. ``` 'option0=x option1=y...' ```
  
  Default options are:
  ``` targetlanguage=sac trace=0 ```
  This disables debug tracing during compilation, and tells the
  compiler to generate SaC code as its output.
  
  The right argument is a folder name, containing the APL code
  to be compiled, and a file, blist.cu, specifying that set of
  APL verbs. E.g., in the folder ipbb, blist.cu contains:
  ```
    ipbb.ufn
    main.ufn
  ```
  
  The verb main.ufn is:
  
```  r←main;⎕IO;⎕RL;n;⎕PP;⎕PW
  ⎕IO←0
  n←4000
  ⎕RL←16807
  ⎕PP←16
  ⎕PW←80
  r←ipbb n
  ⎕←r
  ⎕←r←1-r=5333334
```
  The verb ipbb.ufn 
  (This input format is to be changed to use work with ]link-generated files) is:

```
  r←ipbb siz;m
 ⍝ Inner product Boolean ∨.∧ Boolean
 m←(2⍴siz)⍴0 1 1 0 0 0
 r←+/+/m∨.∧⍉m
``` 
 The compiler's output will be a SaC source code file in the input
 folder, ipbb. When compiled with sac2c (www.sac-home.org), the resulting
 binary, when executed, will compute the sum of the ravel of
 the Boolean inner product ∨.∧ of a Boolean matrix of shape 4000 4000.
 The result (r) of executing main should be 0 if the result is correct,
 and 0 otherwise.

 

    
