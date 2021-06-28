∇ Z←A_alpha AveragePool A_omega
Z← avgpool⍤A_alpha ⊢A_omega
∇

∇ Z← avg A_omega
Z← (+/,A_omega )÷×/⍴A_omega
∇

∇ Z← avgpool A_omega ;x;y
 (x y)←⍴A_omega
Z← avg⍤2⊢((x÷2),(y÷2),2 2)⍴⍉⍤2⊢((x÷2),2,y)⍴A_omega
∇

∇ Z←A_alpha BackAvgPool A_omega
Z← RR⍤A_alpha ⊢A_omega
∇

∇ Z← BackBias A_omega
Z← SumRavel A_omega
∇

∇ Z← BackIn A_omega ;d_out;W;in
 (d_out W in)←A_omega
 Z←BackIn_115 ⍤99 1⊢⊃⍳⍴W
Z← +⌿((×/(-⍴⍴W)↓⍴Z),(⍴⍴W)↓⍴Z)⍴Z
∇

∇ Z← BackIn_115 A_omega ;cell
 cell←(⍴in)↑(-A_omega +⍴d_out)↑(A_omega ⌷W)×d_out
Z← cell
∇

∇ Z←A_alpha BackLogistic A_omega
Z← A_alpha ×A_omega ×1-A_omega
∇

∇ Z← BackMultiConv A_omega ;d_out;weights;in;bias;d_in;d_w;d_bias
 (d_out weights in bias) ← A_omega
 d_in ← +⌿d_out BackMultiConv_217 ⍤(⍴⍴in) ⊢ weights
 d_w ← d_out BackMultiConv_344 ⍤ (⍴⍴in) ⊢ weights
 d_bias ← BackMultiConv_503 ⍤ (⍴⍴in) ⊢ d_out
Z← (d_in d_w d_bias)
∇

∇ Z←A_alpha BackMultiConv_217 A_omega
Z← BackIn(A_alpha A_omega in)
∇

∇ Z←A_alpha BackMultiConv_344 A_omega
Z← BackW(A_alpha A_omega in)
∇

∇ Z← BackMultiConv_503 A_omega
Z← +/,A_omega
∇

∇ Z← BackW A_omega ;d_out;w;in
 (d_out w in)←A_omega
Z← (⍴w)↑d_out conv in
∇

∇ Z←A_alpha conv A_omega ;s
 s←1+(⍴A_omega )-⍴A_alpha
Z← (⊃⍳s) takedrop2⍤1 99⊢(A_alpha A_omega )
∇

∇ Z← ConvLab A_omega ;z
 z←A_omega ∘.=⍳10
Z← ((⍴z), 1 1 1 1)⍴z
∇

∇ Z← GetFileInt8 A_omega
 ⎕←'Reading file: ', A_omega ,' as int8'
Z← 83 ¯1 ⎕map A_omega
∇

∇ Z← GetInt A_omega ;f
 f←Ubyte A_omega
 Z←256⊥⍤1⊢(((⍴f)÷4),4)⍴f
Z← Z
∇

∇ Z← main A_omega ;epochs;batchsz;err;trainings;tests;rate;k1;b1;k2;b2;fc;b;tr_img;te_img;tr_lab;te_lab;t2;out;correct;error
 epochs←10
 batchsz←1
 err←0
 trainings←1000
 tests←10000
 rate←0.05
 k1←6 5 5⍴÷25
 b1←6⍴÷6
 k2←12 6 5 5⍴÷150
 b2←12⍴÷12
 fc←10 12 1 4 4⍴÷192
 b←10⍴÷10
 tr_img←ReadImages'src/input/train-images-idx3-ubyte'
 te_img←ReadImages'src/input/t10k-images-idx3-ubyte'
 tr_lab←ConvLab ReadLabels'src/input/train-labels-idx1-ubyte'
 te_lab←ConvLab ReadLabels'src/input/t10k-labels-idx1-ubyte'
 trainings←trainings⌊≢tr_img
 tests←tests⌊≢te_img
 ⎕←'Running Zhang with ',(⍕epochs),' epochs, batchsz ',⍕batchsz
 ⎕←(⍕trainings),' training images, ',(⍕tests),' tests',' rate ',⍕rate
 t2←trainings-1
 (k1 b1 k2 b2 fc b err)←TrAll (0 k1 b1 k2 b2 fc b tr_img tr_lab err batchsz rate t2)
 out←te_img TestZhang⍤2⊢ (k1 b1 k2 b2 fc b)
 correct←+/,(MaxPos⍤1⊢,⍤5⊢ te_lab)=MaxPos⍤1⊢,⍤5⊢out
 error←out MeanSquaredError te_lab
 ⎕←(⍕correct),' of ',(⍕tests),' correctly identified!'
 ⎕←'The mean error of ',(⍕tests), ' is ',⍕error÷tests
Z← correct-1028
∇

∇ Z← MaxPos A_omega
Z← A_omega ⍳⌈/A_omega
∇

∇ Z←A_alpha MeanSquaredError A_omega
Z← +/,0.5×(A_omega -A_alpha )*2
∇

∇ Z←alpha MultiConv omega;wts;bias;A
A←alpha
(wts bias)←omega
Z←bias Z_109 ⍤(0,⍴⍴A)⊢wts
∇

∇ Z←A_alpha Z_109 A_omega
Z← A_alpha +A_omega conv A
∇

∇ Z←A_alpha MultiConvHelper A_omega
Z← A_alpha +A_omega conv A
∇

∇ Z← ReadImages A_omega ;t
 t←GetFileInt8 A_omega
 Z←Ubyte (GetInt 12↑4↓t)⍴16↓t
 ⎕←'Read ',(⍕⍴Z),'images from ',A_omega
Z← Z
∇

∇ Z← ReadLabels A_omega
 Z←Ubyte 8↓GetFileInt8 A_omega
 ⎕←'Read ',(⍕⍴Z),' labels from ',A_omega
Z← Z
∇

∇ Z← RR A_omega
Z← 2⌿2/A_omega ÷4
∇

∇ Z← Sigmoid A_omega
Z← ÷1+*-A_omega
∇

∇ Z← SumRavel A_omega
Z← +/,A_omega
∇

∇ Z←A_alpha takedrop2 A_omega ;fil;img
 (fil img)←A_omega
Z← +/,fil×(⍴fil)↑A_alpha ↓ img
∇

∇ Z←A_alpha TestZhang A_omega ;k1;b1;k2;b2;fc;b;s1;c1;s2;c2
 (k1 b1 k2 b2 fc b )←A_omega
 s1←2 2 AveragePool⍤2⊢ c1←Sigmoid A_alpha MultiConv (k1 b1)
 s2←2 2 AveragePool⍤2⊢ c2←Sigmoid s1 MultiConv (k2 b2)
Z← Sigmoid s2 MultiConv (fc b)
∇

∇ Z←A_alpha TrainZhang A_omega ;tr_lab;k1;b1;k2;b2;fc;b;s1;c1;s2;c2;out;d_out;error;d_s2;d_fc;d_b;d_c2;d_s1;d_k2;d_b2;d_c1;_;d_k1;d_b1
 (tr_lab k1 b1 k2 b2 fc b)←A_omega
 s1← 2 2 AveragePool⍤2⊢c1←Sigmoid A_alpha MultiConv (k1 b1)
 s2← 2 2 AveragePool⍤2⊢c2←Sigmoid s1 MultiConv (k2 b2)
 out←Sigmoid s2 MultiConv (fc b)
 d_out←out-tr_lab
 error←out MeanSquaredError tr_lab
 (d_s2 d_fc d_b)←BackMultiConv((d_out BackLogistic out) fc s2 b)
 d_c2←2 2 BackAvgPool d_s2
 (d_s1 d_k2 d_b2)←BackMultiConv((d_c2 BackLogistic c2) k2 s1 b2)
 d_c1←2 2 BackAvgPool d_s1
 (_ d_k1 d_b1)←BackMultiConv((d_c1 BackLogistic c1) k1 A_alpha b1)
Z← (d_k1 d_b1 d_k2 d_b2 d_fc d_b error)
∇

∇ Z← TrAll omega;i;k1;b1;k2;b2;fc;b;tr_img;tr_lab;err;batchsz;rate;trainings;junki;blk;target;d_k1;d_b1;d_k2;d_b2;d_fc;d_b;error
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
∇

∇ Z← Ubyte A_omega
Z← A_omega +256×A_omega <0
∇

