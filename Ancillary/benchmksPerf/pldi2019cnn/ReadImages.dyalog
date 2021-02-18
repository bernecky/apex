 ReadImages←{
  t←GetFileInt8 ⍵
  Z←Ubyte (GetInt 12↑4↓t)⍴16↓t
  ⎕←'Read ',(⍕⍴Z),'images from ',⍵ 
  Z
}

