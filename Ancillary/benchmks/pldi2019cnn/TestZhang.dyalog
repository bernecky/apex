TestZhang←{
(k1 b1 k2 b2 fc b )←⍵ ⍝ Forward part, no weights
s1←2 2 AveragePool⍤2⊢ c1←Sigmoid ⍺ MultiConv (k1 b1)
s2←2 2 AveragePool⍤2⊢ c2←Sigmoid s1 MultiConv (k2 b2)
Sigmoid s2 MultiConv (fc b)
}

