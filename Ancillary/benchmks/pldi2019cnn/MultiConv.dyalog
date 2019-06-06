Z←alpha MultiConv omega;wts;bias;A
A←alpha
(wts bias)←omega
Z←bias {⍺+⍵conv A}⍤(0,⍴⍴A)⊢wts

