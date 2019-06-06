 EmitOutputFile y;wsid;APEXVersion;cuasts;cudefinedfns;cuprolog;code;b;r
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
 b←toascii AddNL code
 r←cufnm,'.',FileExtension TargetLanguage
 'PutFile failed'assert b←b PutFile r
 r←⎕SH'chmod g+w ',r
 ⍝ Halt on write error
