Z← TrAll omega;i;k1;b1;k2;b2;fc;b;tr_img;tr_lab;err;batchsz;rate;trainings;blk;target;d_k1;d_b1;d_k2;d_b2;d_fc;d_b;error;junki

(junki k1 b1 k2 b2 fc b tr_img tr_lab err batchsz rate trainings)←omega

⍝ need blk and target in synch over rank conj.
:for i :in batchsz×⍳trainings÷batchsz

 blk←i⌷tr_img
 target←i⌷tr_lab
 (d_k1 d_b1 d_k2 d_b2 d_fc d_b err)←blk TrainZhang (target k1 b1 k2 b2 fc b)
 k1←k1-rate×d_k1 ⍝ Put AverageOuter calls back when batching works
 k2←k2-rate×d_k2
 b1←b1-rate×d_b1
 b2←b2-rate×d_b2
 fc←fc-rate×d_fc
 b← b -rate×d_b
 error←+/err
  ⎕←'Error at iteration ',(⍕i),' is ',⍕error ⍝⍝ ÷trainings
:endfor

 ⍝⍝⍝ (i<trainings): ∇ ((i+batchsz) k1 b1 k2 b2 fc b tr_img tr_lab err batchsz rate trainings)

 ⎕←'Done training'
Z←(k1 b1 k2 b2 fc b err)
 
