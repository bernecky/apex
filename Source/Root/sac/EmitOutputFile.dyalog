 r←EmitOutputFile y;wsid;APEXVersion;cuasts;cudefinedfns;cuprolog;code;b
 ⍝# Package the generated SAC code for one Compilation Unit(CU)
 ⍝# and write it to a host file..
 ⍝# Result is written to file in same directory as source.
 cuasts←D y[0] ⍝ All asts for the CU
 cudefinedfns←D y[1] ⍝ All defined fns for the CU
 cufnm←D y[2] ⍝ The APL file name for the CU
 cuprolog←ReadFile pathfrag,'prolog.',TargetLanguage ⍝ Get prolog code
 cuprolog←'$MAIN'Strepl(E cuprolog),E CUEntryPoint cuasts
 APEXVersion←'Compiled by APEX Version: ',⎕WSID
 cuprolog←cuprolog,(BuildComment APEXVersion,fts ⎕TS),NL
 cuprolog←cuprolog,ReadFile pathfrag,'stdlib.',TargetLanguage
 code←cuprolog,cudefinedfns
 r←toascii AddNL code
 b←cufnm,'.',TargetLanguage
 'PutFile failed'assert z←r PutFile b
 z←⎕SH'chmod g+w ',b

