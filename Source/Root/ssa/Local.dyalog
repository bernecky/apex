 r←vars Local asts;ast
⍝# This fn localizes these names
 r←(vars[;1]∊astscopeL)⌿vars[;0]
