TrainZhang←{
 (tr_lab k1 b1 k2 b2 fc b)←⍵ 
s1← 2 2 AveragePool⍤2⊢c1←Sigmoid ⍺ MultiConv⍤2⊢(k1 b1)
s2← 2 2 AveragePool⍤2⊢c2←Sigmoid s1 MultiConv⍤3⊢(k2 b2)
out←Sigmoid s2 MultiConv⍤4⊢(fc b)
d_out←out-tr_lab
error←out MeanSquaredError tr_lab
(d_s2 d_fc d_b)←BackMultiConv((d_out BackLogistic out) fc s2 b)
d_c2←2 2 BackAvgPool d_s2
(d_s1 d_k2 d_b2)←BackMultiConv((d_c2 BackLogistic c2) k2 s1 b2)
d_c1←2 2 BackAvgPool d_s1
(_ d_k1 d_b1)←BackMultiConv((d_c1 BackLogistic c1) k1 ⍺ b1)
(d_k1 d_b1 d_k2 d_b2 d_fc d_b error)
}

