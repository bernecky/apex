 r←seecfg cfg;az
 ⍝ Display cfg in human readable form
 az←mcb⍳1⍴⍴cfg
 r←(⍴cfg)⍴(,cfg)\(,cfg)/,(⍴cfg)⍴az
 r←(⍕az),':',⍕r
