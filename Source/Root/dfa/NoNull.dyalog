﻿ r←NoNull txt
⍝ Remove NULL! from txt elements
 r←txt
 r[(txt∊E'NULL!')/⍳⍴txt]←E''
