﻿ r←ast MarkSpecialCases fns
 r←MarkSpecialCasesReduce fns
 r←ast MarkSpecialCasesWindowReduce r
 r←MarkSpecialCasesInnerProduct r
 r←ast MarkSpecialCasesRank r
 r←ast MarkSpecialCasesEpio r
 r←MarkSpecialCasesCatlam r
 r←ast MarkSpecialCasesMonadicGrade r
