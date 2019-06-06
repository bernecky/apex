 j←cfg WhichPred2 wv;w;v
 ⍝ v is jTH predecessor in list of
 ⍝ predecessors of w in cfg
 w←wv[0] ⋄ v←wv[1]
 j←(cfg[;w]/⍳1↑⍴cfg)⍳v
