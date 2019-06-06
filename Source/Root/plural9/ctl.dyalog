⌷ctl←
<array><shape>17 6</shape>
<array><shape>82</shape><string>bool $FNAME($YTYPE y)£%A;{ /* Absolute value Boolean (NOP) */£%A; return($YTtoB(y));£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>mod</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>55</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ return(abs($YTto$CT(y)));£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>mod</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>2</shape><string>id</string></array>
<array><shape>2</shape><string>id</string></array>
<array><shape>41</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ return(!y);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>bar</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>41</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ return(-y);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>bar</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>2</shape><string>id</string></array>
<array><shape>2</shape><string>id</string></array>
<array><shape>40</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ return(y);£%A;}£%A;£%A;</string></array>
<array><shape>4</shape><string>plus</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>40</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ return(y);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>min</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>2</shape><string>bi</string></array>
<array><shape>2</shape><string>bi</string></array>
<array><shape>111</shape><string>$ZTYPE $FNAME($YTYPE y,double QUADct)£%A;{ return(DFLOOR(y,QUADct));£%A;}£%A;%Generate , DFLOOR, X$YT$ZT, X00, ., $CT£%A;£%A;£%A;</string></array>
<array><shape>3</shape><string>min</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>d</string></array>
<array><shape>1</shape><string>i</string></array>
<array><shape>78</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ /* Boolean/integer ceiling (NOP) */£%A;  return(y);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>max</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>2</shape><string>bi</string></array>
<array><shape>2</shape><string>bi</string></array>
<array><shape>129</shape><string>$ZTYPE $FNAME($YTYPE y, double QUADct)£%A;{ /* Ceiling */£%A; return(-DFLOOR(-y, QUADct));£%A;}£%A;%Generate , DFLOOR, X$YT$ZT, X00, ., $CT£%A;£%A;</string></array>
<array><shape>3</shape><string>max</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>d</string></array>
<array><shape>1</shape><string>i</string></array>
<array><shape>68</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ /* Boolean signum (NOP) */£%A; return(y);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>mpy</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>163</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ /* signum int */£%A; int z;£%A;£%A; if (0 == $YTtoi(y)) {£%A;   z = 0;£%A; } else if (0 &gt; $YTtoi(y)) {£%A;   z = -1;£%A; } else {£%A;   z = 1;£%A; }£%A; return(z);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>mpy</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>i</string></array>
<array><shape>1</shape><string>i</string></array>
<array><shape>172</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ /* double signum */£%A;  int z;£%A;  if (0.0 == tod(y)) {£%A;    z = 0;£%A;  } else if (0.0 &gt; tod(y)) {£%A;    z = -1;£%A;  } else {£%A;    z = 1;£%A;  }£%A;  return(z);£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>mpy</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>1</shape><string>d</string></array>
<array><shape>1</shape><string>i</string></array>
<array><shape>69</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ /* Boolean NOT */£%A;  return(!$YTtoB(y));£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>not</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>1</shape><string>b</string></array>
<array><shape>52</shape><string>$ZTYPE $FNAME($YTYPE y)£%A;{ return(1.0/$YTtod(y));£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>div</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>1</shape><string>d</string></array>
<array><shape>72</shape><string>$ZTYPE $FNAME ($YTYPE y)£%A;{ return(pow(2.718281828459046,$YTtod(y)));£%A;}£%A;£%A;</string></array>
<array><shape>4</shape><string>star</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>1</shape><string>d</string></array>
<array><shape>54</shape><string>$ZTYPE $FNAME ($YTYPE y)£%A;{ return(log($YTtod(y)));£%A;}£%A;£%A;</string></array>
<array><shape>3</shape><string>log</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>1</shape><string>d</string></array>
<array><shape>67</shape><string>$ZTYPE $FNAME ($YTYPE y)£%A;{ return(3.1415926535897632*$YTtod(y));£%A;}£%A;</string></array>
<array><shape>4</shape><string>circ</string></array>
<array><shape>3</shape><string>x00</string></array>
<array><shape>1</shape><string>x</string></array>
<array><shape>3</shape><string>bid</string></array>
<array><shape>1</shape><string>d</string></array></array>
