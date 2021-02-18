 Z←TrAll omega;i;k1;b1;k2;b2;fc;b;img;lab;err;batchsz;rate;trainings;blk;target;d_k1;d_b1;d_k2;d_b2;d_fc;d_b;error;labs;res
 (k1 b1 k2 b2 fc b img labs err batchsz rate trainings)←omega
 error←0
 :For i :In batchsz×⍳trainings÷batchsz
     sz←batchsz⌊≢img
     blk←sz↑i↓img
     lab←sz↑i↓labs
     ⍝⍝(d_k1 d_b1 d_k2 d_b2 d_fc d_b err)←blk TrainBatch2⍤2 5⊢lab
     res←blk TrainBatch2⍤2 5⊢lab
     k1←k1 AdjWts D res[;0]
     b1←b1 AdjWts D res[;1]
     k2←k2 AdjWts D res[;2]
     b2←b2 AdjWts D res[;3]
     fc←fc AdjWts D res[;4]
     b←b AdjWts D res[;5]
     error←error++/res[;6]

 :EndFor
 ⎕←'Error at end of batch is: ',⍕error ⍝⍝ ÷trainings
 ⎕←'Done training'
 Z←(k1 b1 k2 b2 fc b err)
