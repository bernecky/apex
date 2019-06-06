r←dfaRank y;ast;wl;i;j;newy                
 ⍝ Handle rank conjunction                  
 ast←D y[ssaast]                            
 wl←D y[ssacv]                              
 i←wl∧ast[;astfn]∊ER1 mcb'⍣'                
 i←i∧(isnum ast[;astrop])∧~ast[;astrop]∊NULL
 i←i\~(i/ast[;astclass])∊astclassNC         
 wl←wl∧~i ⍝ Update worklist                 
 i←i∧~(D ast[;astPred])[;astPredKnowValue]  
 newy←y                                     
 newy[ssacv]←E wl                           
 :For j :In i/⍳⍴i ⍝ Easier one at a time.   
     newy←j dfaRankOne newy                 
 :EndFor                                    
 r←newy                                     
      
