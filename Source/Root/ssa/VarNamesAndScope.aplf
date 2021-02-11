 r←VarNamesAndScope cds;ast
⍝# Get variable names and scope for one function
 ast←D cds[ssaast]
 r←(~dfainit ast)∧ast[;astclass]∊astclassVARB
 r←r∧~ast[;asttarget]∊(E,'-'),(E,'⍞'),(E'⎕ts'),E'⎕wa'
 r←r⌿ast[;asttarget,astscope]
