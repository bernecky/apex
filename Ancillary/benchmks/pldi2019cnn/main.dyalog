 main←{
 ⍝ This requires 1=⎕ml and 0=⎕io
     epochs←10 ⋄ batchsz←100 ⋄ err←0
     trainings←1000 ⋄ tests←10000 ⋄ rate←0.05
     k1←6 5 5⍴÷25 ⋄ b1←6⍴÷6 ⋄ k2←12 6 5 5⍴÷150 ⋄ b2←12⍴÷12
     fc←10 12 1 4 4⍴÷192 ⋄ b←10⍴÷10
     tr_img←ReadImages'src/input/train-images-idx3-ubyte'
     te_img←ReadImages'src/input/t10k-images-idx3-ubyte'
     tr_lab←ConvLab ReadLabels'src/input/train-labels-idx1-ubyte'
     te_lab←ConvLab ReadLabels'src/input/t10k-labels-idx1-ubyte'
     trainings←trainings⌊≢tr_img
     tests←tests⌊≢te_img

     ⎕←'Training Zhang with ',(⍕epochs),' epochs, batchsz ',⍕batchsz
     ⎕←(⍕trainings),' training images, ',(⍕tests),' tests',' rate ',⍕rate

     ⎕←'Training Zhang started at: ',fts ⎕TS
     (k1 b1 k2 b2 fc b err)←{
         t←⎕AI
         (k1 b1 k2 b2 fc b err)←TrAll(k1 b1 k2 b2 fc b tr_img tr_lab err batchsz rate trainings)
         ⎕←'Time for training was ',(⍕1⌷⎕AI-t),'msec'
         ⎕←'Average error after epoch was ',(⍕err)
         k1 b1 k2 b2 fc b err ⍝  Loop result
     }⍣epochs⊣(k1 b1 k2 b2 fc b i)
     ⎕←'Training Zhang ended at: ',fts ⎕TS

     ⎕←'Testing Zhang started at: ',fts ⎕TS
     out←te_img TestZhang⍤2⊢(k1 b1 k2 b2 fc b)
     correct←+/,(MaxPos⍤1⊢,⍤5⊢te_lab)=MaxPos⍤1⊢,⍤5⊢out
     error←out MeanSquaredError te_lab
     ⎕←(⍕correct),' of ',(⍕tests),' correctly identified!'
     ⎕←'The mean error of ',(⍕tests),' is ',⍕error÷tests
     ⎕←'Testing Zhang ended at: ',fts ⎕TS

     correct-1028 ⍝ Expected result
 }
