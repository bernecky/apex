 r←LFtoCR txt
 r←txt
 r[(txt=LF)/⍳⍴txt]←CR
