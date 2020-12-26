 st←gst Buildst y;src;tok;loc;ids;lab;i;j;fnm;val;con;args;b;hdr;res;hdrtok
⍝ Build symbol table for a single function.
⍝ A symbol table row is a triple of name, syntax class, scope
⍝ First 4 rows are function name, result, larg, rarg
 src←D y[0] ⋄ tok←D y[1]
 i←src[0;]⍳'←'
 i←i×i≠¯1↑⍴src ⍝ possible result
 res←E(i↑src[0;]),(i=0)/astNoFn
 res←#.arrayutils.squeeze¨res               ⍝ Drop any leading blanks
 i←i+×i
 hdr←i↓src[0;] ⋄ hdrtok←i↓tok[0;]
 i←hdr⍳';' ⋄ j←i×i≠⍴hdr ⍝ Extract fn name, args
 args←1⌽⌽(i↑hdr)getids i↑hdrtok
 loc←mcb(i↓hdr)getids i↓hdrtok ⍝ Get locals
 lab←src getlbls tok ⍝ Get line labels
 fnm←''⍴args ⍝ Get fn name, remove from arg list
 args←1↓args
⍝⍝⍝?? 2005-11-04 args←⌽1↓args
 :If fnm≡E'main' ⍝ Localize all system vars for main.wif
     loc←loc⍪mcb(~#.globals.sysvars∊loc)/#.globals.sysvars
 :EndIf
 ⍝ Result, larg, rarg
 args←mcb res,((2-⍴args)⍴astNoFn),args
 ids←mcb(1 0↓src)getids 1 0↓tok ⍝ Get all ids
 ids←(~,ids∊#.globals.sysfns,#.globals.sysconsts,#.globals.sysnfns,E,'⎕')⌿ids ⍝ Stupid APL\360 ⎕←
 ⍝ Class unknown, local
 ids←ids,((1↑⍴ids),2)⍴(E'?'),E astscopeL
 loc←loc,((1↑⍴loc),2)⍴NULL,E astscopeL
 ⍝ Class for locals was varb, but fn assign makes this harder.
 ⍝ Args are local varbs
 args←args,((1↑⍴args),2)⍴astclassVARB,E astscopeL
 i←(astclassNFN,astclassMFN,astclassDFN)[2-+/1↓args[;stname]∊astNoFn]
 st←((fnm,E i),E astscopeL)⍪args ⍝ User-defined fns
 loc←(~loc[;0]∊st[;0])⌿loc ⍝ no dups in st
 st←st⍪loc⍪(gst[;0]∊ids[;stname])⌿gst ⍝Locals and globals
 ⍝ Labels are local constants
 st←st⍪(mcb D lab[1]),(mcb(⍴D lab[1])⍴clscolon),E astscopeL
 ⍝ Everything else is a semi-global or global.
 ⍝ We'll mark it semi-global, since the difference is moot.
 ids←nub ids[;0]
 i←ids∊st[;stname] ⍝ Known names
 i←(~i)/ids ⍝ Unknown names
 st←st⍪((mcb i),NULL),E astscopeSGI+astscopeSGO ⍝ Semglobal, but
 ⍝ nobody will care about its value probably
 ⍝ We killed the constants part sometime after 1995-10-29,
 ⍝ but on 1995-12=05, discovered that we do indeed need it.
 ⍝ (nmomain)
 ⍝ Add entries for all non-local system fns and variables. 2004-06-11
 ids←#.globals.sysvars
 i←st[;stname]∊ids ⍝ Note local system var names
 ids←(~ids∊st[;stname])/ids ⍝ Non-localized sysvar names
 ids←((mcb ids),E astclassVARB),E astscopeSGI+astscopeSGO
 ⍝ Correct stclass of system vars
 st←st⍪ids
 st[(st[;stname]∊#.globals.sysvars)/⍳1↑⍴st;stclass]←astclassVARB
 st[(st[;stname]∊(E'⎕wa'),E'⎕ts')/⍳1↑⍴st;stscope]←astscopeL
 ids←clsnum GetConstants y ⍝ Add entries for constants.
 ids←((mcb ids),E astclassNC),E astscopeL
 i←clschar GetConstants y
 ids←ids⍪((mcb i),E astclassCC),E astscopeL
 ids←(~ids[;stname]∊st[;stname])⌿ids ⍝ Ignore name if already there
 st←st⍪ids                   ⍝ Append constants
 st←st[⍳4;]⍪D nub ER1 4 0↓st ⍝ Kill dups, e.g., constants
 ⍝ but leave the first 4 magic rows
 st←(~st[;stname]∊(E,'⎕'),E,'⍞')⌿st ⍝ Remove the sins of the past
