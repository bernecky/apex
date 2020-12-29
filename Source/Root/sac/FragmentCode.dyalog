 r←n FragmentCode y;cv;i;b;j;cf;cnt;frg
 ⍝ Break code frags into pieces:
 ⍝  Code fragments, names,n types
 ⍝ See msf.sis for more docn on types
 frg←FragBuffered y
 'Fragment got lost!'assert 2=⍴frg
 r←D frg[1]
 r←r[;⍳n⌊¯1↑⍴r]
