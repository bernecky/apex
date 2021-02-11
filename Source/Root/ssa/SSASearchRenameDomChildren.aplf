 r←x SSASearchRenameDomChildren yy;X;tar;S;domt;domtc;d
 ⍝ SSA Search from Wolfe 1992, p. 183
 X←D x[0] ⋄ tar←D x[1] ⍝ Vars,target varb
 domt←D(D yy[0])[ssadomt]
 ⍝
 ⍝ For each child(X) do search(Y)
 ⍝
 domtc←domt[;X]
 domtc←domtc/⍳⍴domtc
 :For d :In domtc
     r←((E d),E tar)SSASearch yy
     yy←r ⍝ Allow us to check the result during debug
 :EndFor
 r←yy
