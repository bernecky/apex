﻿r←ast TargetName y;n;tt;cv;t;nul        
 ⍝ Generate names of targets             
 ⍝ y is potential targets.               
 ⍝3 categories: named, temp (#), and null
 n←(dfainit ast)⍳1 ⍝ Mark temp targets   
 r←,y                                    
 cv←(~nul←r∊NULL)∧isnum r                
 t←cv/r                                  
 tt←n≤,D t ⍝ Temp targets                
 r[nul/⍳⍴nul]←E'NULL!' ⍝ End, nulls      
 n←(cv⍀tt)/⍳⍴cv                          
 r[n]←TempName tt/t                      
 tt←~tt ⍝ Chase non-temp names           
 r[(cv⍀tt)/⍳⍴cv]←ast[,D tt/t;asttarget]  
 r←(⍴y)⍴r                


