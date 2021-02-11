 r←n FragmentCode y;cv;i;b;j;cf;cnt;frg
 ⍝ Break code frags into pieces:
 ⍝  Code fragments, names,n types
 ⍝ See msf.sis for more docn on types
 ⍝ If fragment has been broken already,
 ⍝ use it. Otherwise, break it up, and
 ⍝ refresh the broken fragment.
 →(2=⍴frg←FragBuffered y)⍴lz
 'Fragment got lost!'assert 0
lz:r←D frg[1]
 r←r[;⍳n⌊¯1↑⍴r]
