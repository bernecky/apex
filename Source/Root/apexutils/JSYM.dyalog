 r←JSYM
 r←'diamon      3             ⋄     end-of-statement.          ',TCNL
 r←r,'doll        9             $     dollar sign                ',TCNL
 r←r,'cent        11            ¢     cent sign                  ',TCNL
 r←r,'dot         17            .     period, aka dot.           ',TCNL
 r←r,'lpar        33            (     left parenthesis           ',TCNL
 r←r,'rpar        35            )     right parenthesis          ',TCNL
 r←r,'semi        37            ;     semicolon                  ',TCNL
 r←r,'sl          39            /     slash                      ',TCNL
 r←r,'bsl         41            \     back slash                 ',TCNL
 r←r,'assg        43            ←     left arrow                 ',TCNL
 r←r,'goto        45            →     right arrow                ',TCNL
 r←r,'dier        51            ¨     dieresis (upshift 1)       ',TCNL
 r←r,'plus        53            +     plus                       ',TCNL
 r←r,'bar         55            -     minus                      ',TCNL
 r←r,'mpy         57            ×     times                      ',TCNL
 r←r,'div         59            ÷     divide                     ',TCNL
 r←r,'star        61            *     star                       ',TCNL
 r←r,'max         63            ⌈     maximum                    ',TCNL
 r←r,'min         65            ⌊     minimum                    ',TCNL
 r←r,'mod         67            |     residue                    ',TCNL
 r←r,'and         69            ∧     and                        ',TCNL
 r←r,'or          71            ∨     or                         ',TCNL
 r←r,'lt          73            <     less than                  ',TCNL
 r←r,'le          75            ≤     less than or equal         ',TCNL
 r←r,'eq          77            =     equal                      ',TCNL
 r←r,'ge          79            ≥     greater than or equal      ',TCNL
 r←r,'gt          81            >     greater than               ',TCNL
 r←r,'ne          83            ≠     not equal                  ',TCNL
 r←r,'alph        85            ⍺     alpha                      ',TCNL
 r←r,'eps         87            ∊     epsilon                    ',TCNL
 r←r,'iota        89            ⍳     iota                       ',TCNL
 r←r,'rho         91            ⍴     rho                        ',TCNL
 r←r,'omeg        93            ⍵     omega                      ',TCNL
 r←r,'coma        95            ,     comma                      ',TCNL
 r←r,'bang        97            !     exclamation mark.          ',TCNL
 r←r,'rotr        99            ⌽     rotate and reversal.       ',TCNL
 r←r,'dtak        101           ⊥     decode (base value)        ',TCNL
 r←r,'utak        103           ⊤     encode (representation)    ',TCNL
 r←r,'circ        105           ○     circle                     ',TCNL
 r←r,'quer        107           ?     query                      ',TCNL
 r←r,'not         109           ~     logical negation           ',TCNL
 r←r,'take        111           ↑     take. up-arrow             ',TCNL
 r←r,'drop        113           ↓     drop. down-arrow           ',TCNL
 r←r,'subs        115           ⊂     subset                     ',TCNL
 r←r,'rsub        117           ⊃     right subset               ',TCNL
 r←r,'cap         119           ∩     cap                        ',TCNL
 r←r,'cup         121           ∪     cup                        ',TCNL
 r←r,'ubar        123           _     underscore                 ',TCNL
 r←r,'tran        125           ⍉     transpose                  ',TCNL
 r←r,'ibem        127           ⌶     i-beam                     ',TCNL
 r←r,'jot         129           ∘     jot  (small circle)        ',TCNL
 r←r,'quad        131           ⎕←    quad output                ',TCNL
 r←r,'quad        131           ←⎕    quad input                 ',TCNL
 r←r,'qqd         133           ⍞←    quote-quad output          ',TCNL
 r←r,'qdd         133           ←⍞    quote-quad input           ',TCNL
 r←r,'log         135           ⍟     log                        ',TCNL
 r←r,'nand        137           ⍲     nand                       ',TCNL
 r←r,'nor         139           ⍱     nor                        ',TCNL
 r←r,'lamp        141           ⍝     lamp-comment               ',TCNL
 r←r,'ugrd        143           ⍋     up grade                   ',TCNL
 r←r,'dgrd        145           ⍒     down grade                 ',TCNL
 r←r,'rot1        147           ⊖     overstruck circle-hyphen   ',TCNL
 r←r,'sl1         149           ⌿     overstruck slash-hyphen    ',TCNL
 r←r,'bsl1        151           ⍀     overstruck backslash-hyphen',TCNL
 r←r,'mdiv        153           ⌹     domino                     ',TCNL
 r←r,'thrn        155           ⍕     format                     ',TCNL
 r←r,'hydr        157           ⍎     execute                    ',TCNL
 r←r,'rtak        161           ⊣     right tack                 ',TCNL
 r←r,'ltak        163           €     left tack                  ',TCNL
 r←r,'rbr         165           }     right curly brace          ',TCNL
 r←r,'lbr         167           {     left curly brace           ',TCNL
 r←r,'same        183           ≡     same (aka idem, aka match).',TCNL
 r←r,'nuax        185           ⍣     nuax (aka on).             ',TCNL
 r←r,'coax        187           ö     coax (aka along).          ',TCNL
 r←r,'comb        193           ⍪     comma bar.                 ',TCNL
 r←r,'epsb        195           ⍷     epsilon bar.               ',TCNL
 r←r,'indr        xxx           [     Indexed reference          ',TCNL
 r←r,'inds        xxx           ]     Indexed                    ',TCNL
 r←r,'quadfi      xxx           ⎕fi   ⎕fi                        ',TCNL
 r←r,'quadvi      xxx           ⎕vi   ⎕vi                        ',TCNL
 r←r,'quadts      xxx           ⎕ts   ⎕ts                        ',TCNL
 r←r,'quadav      xxx           ⎕av   ⎕av                        ',TCNL
 r←vtom TCNL,r
