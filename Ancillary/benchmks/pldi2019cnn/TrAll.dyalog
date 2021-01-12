 Z←TrAll omega;i;k1;b1;k2;b2;fc;b;tr_img;tr_lab;err;batchsz;rate;trainings;blk;target;d_k1;d_b1;d_k2;d_b2;d_fc;d_b;error
 (k1 b1 k2 b2 fc b tr_img tr_lab err batchsz rate trainings)←omega
 error←0
 :For i :In batchsz×⍳trainings÷batchsz
     sz←batchsz⌊≢tr_img
     blk←sz↑i↓tr_img
     target←sz↑i↓tr_lab
     (d_k1 d_b1 d_k2 d_b2 d_fc d_b err)←blk TrainBatch(target k1 b1 k2 b2 fc b)
     k1←k1 AdjWts d_k1
     k2←k2 AdjWts d_k2
     b1←b1 AdjWts d_b1
     b2←b2 AdjWts d_b2
     b←b AdjWts d_b
     fc←fc AdjWts d_fc
     error←error++⌿err
 :EndFor
 ⎕←'Error at end of batch is: ',⍕error ⍝⍝ ÷trainings
 ⎕←'Done training'
 Z←(k1 b1 k2 b2 fc b err)
