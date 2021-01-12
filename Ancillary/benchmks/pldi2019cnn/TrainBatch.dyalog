TrainBatch←{
 ⍝ Train batch using same parameters
 (tr_lab k1 b1 k2 b2 fc b)←⍵ 
s1← 2 2 AP⍤2⊢c1←Sigmoid ⍺ MC⍤2⊢(k1 b1)

s2← 2 2 AP⍤2⊢c2←Sigmoid s1 MC⍤3⊢(k2 b2)
out←Sigmoid s2 MC⍤4⊢(fc b)
d_out←out-tr_lab

(d_s2 d_fc d_b)←BMC((d_out BL out) fc s2 b)
d_c2←2 2 BAP d_s2
(d_s1 d_k2 d_b2)←BMC((d_c2 BL c2) k2 s1 b2)
d_c1←2 2 BAP d_s1
(_ d_k1 d_b1)←BMC((d_c1 BL c1) k1 ⍺ b1)

error←out MSE tr_lab

(d_k1 d_b1 d_k2 d_b2 d_fc d_b error)
}

