 r←benchmark y;p;nms
 p←path,y,'\'
 nms←ls p,'*.wif' ⍝ All wif files in this dir are
 ⍝ fair game.
 nms[;8]←'.'
 nms←(E p),¨ER1 noblanks nms[;⍳12]
 r←Compile nms
