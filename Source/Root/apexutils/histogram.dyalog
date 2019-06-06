 r←histogram i;b;j;k
 ⍝ Make histogram of unique elements of i & their counts
 b←i⍳i
 r←+/(nub b)∘.=b
 r←(E nub i),E r
