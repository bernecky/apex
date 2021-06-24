	.globl	zeit_
	.section	.data
.LS1:
	.long	0x7d47f854, 0x40005397
	.long	0xa0000000, 0x3e6ad7f2
	.long	0xa0000000, 0x3fb99999
	.long	0xc0000000, 0x3feccccc
	.long	0x00000000, 0x3fc00000
	.long	0x00000000, 0x3fd00000
	.long	0x00000000, 0x40000000
	.long	0x00000000, 0x3ff00000
	.long	0x00000000, 0x3fef5c29
	.long	0x00000000, 0x00000000
	.long	0x3b800000
	.long	0x43800000
	.long	0x00000000
	.space	4
	.long	0x3f800000
	.long	0x00010006
	.long	0x00000505
	.long	0x00000009
	.long	0x00000032
	.long	0x00000054
	.long	0x00000033
	.long	0x00000055
	.long	0x00000404
	.long	0x00000005
	.long	0x00010002
	.long	0x00000202
	.long	0x00010302
	.long	0x00000102
	.long	0x00010100
	.long	0x00010001
	.long	0x0000ffff
	.long	0x00000003
	.long	0x00000002
	.long	0x00000000
	.long	0x00000001
	.long	0x00000002
	.long	0x00000004
	.long	0x00000008
	.long	0x00000020
	.long	0x00000101
	.long	0x00000064
	.long	0x00000006
	.long	0x00000040
	.long	0x00000100
	.long	0x00000808
	.long	0x00000007
	.long	0x000000fe
	.long	0x000000ff
	.long	0xffffffff
	.byte	0x01
	.byte	0x00
	.byte	0x00
	.byte	0x00
	.long	0x000000c2
	.byte	0x09
	.byte	0x02
	.byte	0x00
	.byte	0x00
	.long	0x000000ac
	.long	.LS1+204
	.long	0x00000000
	.long	0x00000000
	.long	0x00000000
	.long	0x00000000
	.long	.LS1+627
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	0x00000000
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	.LS1+172
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	.LS1+172
	.byte	0x01
	.byte	0x0a
	.word	0x0000
	.long	0x00000008
	.long	.LS1+72
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	.LS1+172
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	.LS1+172
	.byte	0x01
	.byte	0x0a
	.word	0x0000
	.long	0x00000008
	.long	.LS1+72
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	0x00000000
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	0x00000000
	.byte	0x01
	.byte	0x0a
	.word	0x0000
	.long	0x00000008
	.long	0x00000000
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	0x00000000
	.byte	0x01
	.byte	0x03
	.word	0x0000
	.long	0x00000004
	.long	0x00000000
	.byte	0x61
	.byte	0x0a
	.word	0x0000
	.long	0x00000008
	.long	0x00000000
	.byte	0x69
	.byte	0x02
	.byte	0x00
	.byte	0x00
	.long	0x00000032
	.long	.LS1+204
	.long	0x00000000
	.long	0x00000000
	.long	0x00000000
	.long	0x00000000
	.long	.LS1+539
	.byte	0x69
	.byte	0x02
	.byte	0x00
	.byte	0x00
	.long	0x00000031
	.long	.LS1+204
	.long	0x00000000
	.long	0x00000000
	.long	0x00000000
	.long	0x00000000
	.long	.LS1+496
	.long	0x1001f01,0x2002931,0x2a1e001f,0x32202a2a,0x4920442d,0x41524554,0x4e4f4954,0x48454220
	.long	0x4f495641, 0x2a2a2052
	.word	0x2a2a
	.byte	0x04
	.byte	0x01
	.long	0x100292a,0x4932001f,0x20202054,0x20202049,0x2020204a,0x4f432d58,0x20202052,0x49202020
	.long	0x4a202020,0x59202020,0x524f432d,0x20202020,0x20492020,0x204a2020,0x19001f20,0x522d5820
	.long	0x20205345, 0x20202020, 0x20202049, 0x2020204a
	.long	0x45522d59
	.word	0x2a53
	.byte	0x04
	.byte	0x01
	.long	0x04060306, 0x0b090406, 0x06040604, 0x040b0904
	.long	0x04060406, 0x06040b09
	.long	0x09040604
	.word	0x040b
	.byte	0x04
	.byte	0x01
	.long	0x3d020029, 0x05080b00
	.word	0x0402
	.space	2
	.section	.text
#	.version	"jwd_fort: Fujitsu Fortran Compiler Version 1.0 (Jun 12 1999 00:06:13)"
	.align	16
.globl MAIN__
MAIN__:
.LL101:
.SSN1:
# 13
	pushl	%ebp
	movl	%esp,%ebp
	subl	$3699116,%esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	$2,%eax
	movl	$0,%ecx
	pushl	%ecx
	pushl	%eax
	call	jwe_xcop
	addl	$8,%esp
.LL102:
.SSN2:
# 18
.SSN3:
# 29
	movl	$1,%ecx
	fldz
.LL103:
.SSN4:
# 30
	fldl	%st
	fmuls	.LS1+80
# 30
# 30
	fxch	%st(1)
	fadds	.LS1+96
	fldl	%st
	fmuls	.LS1+80
	fxch	%st(2)
	fstpl	-1585272(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-1585264(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
# 30
	fldl	%st
	fmuls	.LS1+80
	fstpl	-1585256(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
# 30
	fldl	%st
	fmuls	.LS1+80
	fstpl	-1585248(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
# 30
	fldl	%st
	fmuls	.LS1+80
	fstpl	-1585240(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
# 30
	fldl	%st
	fmuls	.LS1+80
	fstpl	-1585232(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
# 30
	fldl	%st
	fmuls	.LS1+80
	fstpl	-1585224(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
# 30
	fldl	%st
	fmuls	.LS1+80
	fstpl	-1585216(%ebp,%ecx,8)
# 30
	fadds	.LS1+96
	addl	$8,%ecx
	cmpl	$257,%ecx
	jl	.LL103
.LL192:
# 30
	fmuls	.LS1+80
	fstpl	-1585272(%ebp,%ecx,8)
.LL105:
.SSN5:
# 32
	movl	$1,%ecx
	movl	$257,%edx
.LL106:
.SSN6:
# 33
	movl	-1585272(%ebp,%ecx,8),%eax
	movl	-1585268(%ebp,%ecx,8),%ebx
	movl	%eax,-1058936(%ebp,%ecx,8)
	movl	%ebx,-1058932(%ebp,%ecx,8)
.SSN7:
# 34
	movl	$0,-1587320(%ebp,%edx,8)
	movl	$0,-1587316(%ebp,%edx,8)
.SSN8:
# 36
	movl	$0,-2113688(%ebp,%ecx,8)
	movl	$0,-2113684(%ebp,%ecx,8)
.SSN9:
# 35
	movl	$0,-1585272(%ebp,%edx,8)
	movl	$1072693248,-1585268(%ebp,%edx,8)
.SSN10:
# 37
	fldl	-1585272(%ebp,%ecx,8)
.SSN11:
# 38
	fldl	%st
	fmull	.LS1+16
	fxch	%st(1)
	fstpl	-2115736(%ebp,%edx,8)
	fstpl	-2113688(%ebp,%edx,8)
.SSN12:
# 33
	movl	-1585264(%ebp,%ecx,8),%eax
	movl	-1585260(%ebp,%ecx,8),%ebx
	movl	%eax,-1058928(%ebp,%ecx,8)
	movl	%ebx,-1058924(%ebp,%ecx,8)
.SSN13:
# 34
	movl	$0,-1585264(%ebp,%edx,8)
	movl	$0,-1585260(%ebp,%edx,8)
.SSN14:
# 36
	movl	$0,-2113680(%ebp,%ecx,8)
	movl	$0,-2113676(%ebp,%ecx,8)
.SSN15:
# 35
	movl	$0,-1583216(%ebp,%edx,8)
	movl	$1072693248,-1583212(%ebp,%edx,8)
.SSN16:
# 37
	fldl	-1585264(%ebp,%ecx,8)
.SSN17:
# 38
	fldl	%st
	fmull	.LS1+16
	fxch	%st(1)
	fstpl	-2113680(%ebp,%edx,8)
	fstpl	-2111632(%ebp,%edx,8)
.SSN18:
# 33
	movl	-1585256(%ebp,%ecx,8),%eax
	movl	-1585252(%ebp,%ecx,8),%ebx
	movl	%eax,-1058920(%ebp,%ecx,8)
	movl	%ebx,-1058916(%ebp,%ecx,8)
.SSN19:
# 34
	movl	$0,-1583208(%ebp,%edx,8)
	movl	$0,-1583204(%ebp,%edx,8)
.SSN20:
# 36
	movl	$0,-2113672(%ebp,%ecx,8)
	movl	$0,-2113668(%ebp,%ecx,8)
.SSN21:
# 35
	movl	$0,-1581160(%ebp,%edx,8)
	movl	$1072693248,-1581156(%ebp,%edx,8)
.SSN22:
# 37
	fldl	-1585256(%ebp,%ecx,8)
.SSN23:
# 38
	fldl	%st
	fmull	.LS1+16
	fxch	%st(1)
	fstpl	-2111624(%ebp,%edx,8)
	fstpl	-2109576(%ebp,%edx,8)
.SSN24:
# 33
	movl	-1585248(%ebp,%ecx,8),%eax
	movl	-1585244(%ebp,%ecx,8),%ebx
	movl	%eax,-1058912(%ebp,%ecx,8)
	movl	%ebx,-1058908(%ebp,%ecx,8)
.SSN25:
# 34
	movl	$0,-1581152(%ebp,%edx,8)
	movl	$0,-1581148(%ebp,%edx,8)
.SSN26:
# 36
	movl	$0,-2113664(%ebp,%ecx,8)
	movl	$0,-2113660(%ebp,%ecx,8)
.SSN27:
# 35
	movl	$0,-1579104(%ebp,%edx,8)
	movl	$1072693248,-1579100(%ebp,%edx,8)
.SSN28:
# 37
	fldl	-1585248(%ebp,%ecx,8)
.SSN29:
# 38
	fldl	%st
	fmull	.LS1+16
	fxch	%st(1)
	fstpl	-2109568(%ebp,%edx,8)
.SSN30:
# 39
	addl	$1028,%edx
	addl	$4,%ecx
	cmpl	$257,%ecx
	fstpl	-2115744(%ebp,%edx,8)
	jl	.LL106
.LL196:
.SSN31:
# 33
	movl	-1585272(%ebp,%ecx,8),%eax
	movl	-1585268(%ebp,%ecx,8),%ebx
	movl	%eax,-1058936(%ebp,%ecx,8)
	movl	%ebx,-1058932(%ebp,%ecx,8)
.SSN32:
# 34
	movl	$0,-1587320(%ebp,%edx,8)
	movl	$0,-1587316(%ebp,%edx,8)
.SSN33:
# 35
	movl	$0,-1585272(%ebp,%edx,8)
	movl	$1072693248,-1585268(%ebp,%edx,8)
.SSN34:
# 37
	fldl	-1585272(%ebp,%ecx,8)
.SSN35:
# 38
	fldl	%st
	fmull	.LS1+16
.SSN36:
# 36
	movl	$0,-2113688(%ebp,%ecx,8)
	movl	$0,-2113684(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2115736(%ebp,%edx,8)
	fstpl	-2113688(%ebp,%edx,8)
.LL108:
.SSN37:
# 40
	movl	$1,%ecx
.LL109:
.SSN38:
# 41
	fldl	-1585272(%ebp,%ecx,8)
	fldl	%st
	fmull	-1585296(%ebp)
	fxch	%st(1)
	fsubrl	.LS1+56
	fmull	-1587344(%ebp)
	faddp	%st,%st(1)
	fstpl	-1587352(%ebp,%ecx,8)
# 41
	fldl	-1585264(%ebp,%ecx,8)
	fldl	%st
	fsubrl	.LS1+56
	fxch	%st(1)
	fmull	-1585296(%ebp)
	fxch	%st(1)
	fmull	-1587344(%ebp)
	faddp	%st,%st(1)
	fstpl	-1587344(%ebp,%ecx,8)
# 41
	fldl	-1585256(%ebp,%ecx,8)
	fldl	%st
	fsubrl	.LS1+56
	fxch	%st(1)
	fmull	-1585296(%ebp)
	fxch	%st(1)
	fmull	-1587344(%ebp)
	faddp	%st,%st(1)
	fstpl	-1587336(%ebp,%ecx,8)
# 41
	fldl	-1585248(%ebp,%ecx,8)
	fldl	%st
	fsubrl	.LS1+56
	fxch	%st(1)
	fmull	-1585296(%ebp)
	fxch	%st(1)
	fmull	-1587344(%ebp)
	faddp	%st,%st(1)
# 41
	addl	$4,%ecx
	cmpl	$257,%ecx
	fstpl	-1587360(%ebp,%ecx,8)
	jl	.LL109
.LL200:
# 41
	fldl	-1585272(%ebp,%ecx,8)
	fldl	%st
	fmull	-1585296(%ebp)
	fxch	%st(1)
	fsubrl	.LS1+56
	fmull	-1587344(%ebp)
	faddp	%st,%st(1)
	fstpl	-1587352(%ebp,%ecx,8)
.LL111:
.SSN39:
# 42
	fldl	.LS1+24
	movl	$2,%ebx
.LL112:
.SSN40:
# 43
	movl	$2,%ecx
	movl	%ebx,%eax
	shll	$8,%eax
	addl	%ebx,%eax
	leal	2(%eax),%edx
	movl	%eax,-3699044(%ebp)
.LL113:
.SSN41:
# 44
	fldl	%st
	fmull	-1585272(%ebp,%ecx,8)
	fstpl	-1587328(%ebp,%edx,8)
.SSN42:
# 45
	fldl	-1585272(%ebp,%ecx,8)
	movl	-3699044(%ebp),%eax
	fldl	%st
	fmull	-2113688(%ebp,%eax,8)
	fxch	%st(1)
	fsubrl	.LS1+56
	fmull	-2115736(%ebp,%eax,8)
	faddp	%st,%st(1)
	fmul	%st(1),%st
	fstpl	-2115744(%ebp,%edx,8)
.SSN43:
# 44
	fldl	%st
	fmull	-1585264(%ebp,%ecx,8)
	fstpl	-1587320(%ebp,%edx,8)
.SSN44:
# 45
	fldl	-1585264(%ebp,%ecx,8)
	fldl	%st
	fsubrl	.LS1+56
	fxch	%st(1)
	fmull	-2113688(%ebp,%eax,8)
	fxch	%st(1)
	fmull	-2115736(%ebp,%eax,8)
	faddp	%st,%st(1)
	fmul	%st(1),%st
	fstpl	-2115736(%ebp,%edx,8)
.SSN45:
# 44
	fldl	%st
	fmull	-1585256(%ebp,%ecx,8)
	fstpl	-1587312(%ebp,%edx,8)
.SSN46:
# 45
	fldl	-1585256(%ebp,%ecx,8)
	fldl	%st
	fsubrl	.LS1+56
	fxch	%st(1)
	fmull	-2113688(%ebp,%eax,8)
	fxch	%st(1)
	fmull	-2115736(%ebp,%eax,8)
	faddp	%st,%st(1)
	fmul	%st(1),%st
.SSN47:
# 46
	addl	$3,%edx
	addl	$3,%ecx
	cmpl	$257,%ecx
	fstpl	-2115752(%ebp,%edx,8)
	jl	.LL113
.LL114:
# 46
# 46
	incl	%ebx
	cmpl	$257,%ebx
	jl	.LL112
.LL115:
# 46
	fstpl	%st
.LL116:
.SSN48:
# 49
	push	$.LS1+464
	call	jwe_isfm
	addl	$4,%esp
.SSN49:
# 50
	push	$.LS1+432
	call	jwe_isfm
	addl	$4,%esp
.SSN50:
# 61
	movl	$0,-20(%ebp)
.LL117:
.SSN51:
# 62
.SSN52:
# 68
	movl	$0,-24(%ebp)
.SSN53:
# 70
	movl	$0,-8(%ebp)
	movl	$0,-4(%ebp)
.SSN54:
# 69
	movl	$0,-28(%ebp)
.SSN55:
# 71
	movl	$0,-32(%ebp)
.SSN56:
# 72
	movl	$0,-36(%ebp)
.SSN57:
# 73
	movl	$0,-16(%ebp)
	movl	$0,-12(%ebp)
.SSN58:
# 77
	movl	$0,%eax
	movl	%eax,-3699048(%ebp)
.LL118:
.SSN59:
# 78
.LL119:
# 78
	fldl	.LS1+40
	fldl	.LS1+32
	movl	$2,%ebx
	fxch	%st(1)
.LL120:
.SSN60:
# 79
	leal	1(%ebx),%eax
.SSN61:
# 80
	leal	-1(%ebx),%ecx
.SSN62:
# 81
	incl	-3699048(%ebp)
	movl	%eax,-3699052(%ebp)
	movl	%ecx,-3699056(%ebp)
.LL121:
.SSN63:
# 85
	movl	$255,%eax
	movl	%eax,-3699060(%ebp)
.LL122:
# 85
	movl	%ebx,%eax
	shll	$8,%eax
	addl	%ebx,%eax
	movl	-3699052(%ebp),%esi
	movl	%esi,%edi
	shll	$8,%edi
	addl	%esi,%edi
	movl	-3699056(%ebp),%esi
	movl	%eax,-3699064(%ebp)
	movl	%esi,%eax
	shll	$8,%eax
	addl	%esi,%eax
	movl	-3699048(%ebp),%esi
	movl	%edi,-3699068(%ebp)
	movl	%esi,%edi
	shll	$8,%edi
	addl	%esi,%edi
	movl	%edi,%ecx
	movl	-3699064(%ebp),%edi
	leal	3(%edi),%edx
	movl	%eax,-3699072(%ebp)
	leal	1(%edi),%eax
	movl	-3699068(%ebp),%esi
	movl	%eax,-3699076(%ebp)
	leal	2(%esi),%eax
	movl	-3699072(%ebp),%edi
	movl	%eax,-3699080(%ebp)
	leal	2(%edi),%eax
	addl	$2,%ecx
	movl	-3699064(%ebp),%esi
	addl	$2,%esi
	movl	%esi,-3699084(%ebp)
	movl	-3699068(%ebp),%esi
	movl	%eax,-3699088(%ebp)
	leal	3(%esi),%eax
	movl	%eax,-3699092(%ebp)
	leal	3(%edi),%eax
	incl	%esi
	movl	%esi,-3699096(%ebp)
	incl	%edi
	movl	%edi,-3699100(%ebp)
	movl	%eax,-3699104(%ebp)
.LL123:
.SSN64:
# 86
	fstpl	-3699008(%ebp)
	fstpl	-3699016(%ebp)
.SSN65:
# 88
	fldl	-1587328(%ebp,%edx,8)
	fstpl	-3699000(%ebp)
	movl	-3699076(%ebp),%eax
	fldl	-1587328(%ebp,%eax,8)
	fstl	-3698992(%ebp)
	fsubrl	-1587328(%ebp,%edx,8)
	fstpl	-3698984(%ebp)
.SSN66:
# 89
	fldl	-2115744(%ebp,%edx,8)
	fstpl	-3698976(%ebp)
	fldl	-2115744(%ebp,%eax,8)
	fstl	-3698968(%ebp)
	fsubrl	-2115744(%ebp,%edx,8)
	fstpl	-3698960(%ebp)
.SSN67:
# 93
	fldl	-3698984(%ebp)
	fmul	%st,%st
	fldl	-3698960(%ebp)
	fmul	%st,%st
	faddp	%st,%st(1)
	fmull	-3699008(%ebp)
	fstl	-3698952(%ebp)
.SSN68:
# 99
	fchs
	movl	-3699080(%ebp),%esi
	fstpl	-530496(%ebp,%ecx,8)
.SSN69:
# 90
	fldl	-1587328(%ebp,%esi,8)
	movl	-3699088(%ebp),%edi
	fstpl	-3698944(%ebp)
	fldl	-1587328(%ebp,%edi,8)
	fstl	-3698936(%ebp)
	fsubrl	-1587328(%ebp,%esi,8)
.SSN70:
# 91
	fldl	-2115744(%ebp,%esi,8)
	fstpl	-3699024(%ebp)
	fldl	-2115744(%ebp,%edi,8)
	fldl	%st
	fsubrl	-2115744(%ebp,%esi,8)
.SSN71:
# 92
	fldl	%st(2)
	fmul	%st,%st
.SSN72:
# 100
	fldl	-3698952(%ebp)
	fadd	%st,%st
	fldl	%st(2)
	fmul	%st,%st
	faddp	%st,%st(2)
	fxch	%st(1)
	fmull	-3699008(%ebp)
	fldl	%st
	fmull	.LS1
	faddp	%st,%st(2)
	fxch	%st(1)
	movl	-3699084(%ebp),%eax
	fstpl	-1058912(%ebp,%ecx,8)
.SSN73:
# 101
	fldl	-1587328(%ebp,%eax,8)
	movl	-3699104(%ebp),%edi
	faddl	-1587328(%ebp,%eax,8)
.SSN74:
# 105
	movl	-3699092(%ebp),%esi
	fldl	-1587328(%ebp,%edi,8)
	fsubrl	-1587328(%ebp,%esi,8)
.SSN75:
# 94
	fxch	%st(5)
	fmull	-3698984(%ebp)
	fxch	%st(3)
	fmull	-3698960(%ebp)
	fldl	-3699000(%ebp)
	faddl	-3698992(%ebp)
	fstpl	-3699032(%ebp)
	movl	-3699096(%ebp),%eax
	fxch	%st(5)
	fsubl	-1587328(%ebp,%eax,8)
.SSN76:
# 103
	fldl	%st(1)
	fsubrl	-3698944(%ebp)
	fxch	%st(6)
	faddp	%st,%st(4)
	fxch	%st(1)
	fsubrl	-3699032(%ebp)
	fxch	%st(5)
	faddl	-3698936(%ebp)
	movl	-3699100(%ebp),%edi
	fxch	%st(1)
	faddl	-1587328(%ebp,%edi,8)
	fxch	%st(3)
	fmull	-3699016(%ebp)
.SSN77:
# 110
	fxch	%st(5)
	fmul	%st(2),%st
	fxch	%st(1)
	fmull	-3698952(%ebp)
	fxch	%st(3)
	fmul	%st(5),%st
	fxch	%st(3)
	faddp	%st,%st(1)
	fsubp	%st,%st(2)
	fxch	%st(1)
	movl	-3699084(%ebp),%esi
	fstpl	-2644160(%ebp,%ecx,8)
.SSN78:
# 102
	fldl	-2115744(%ebp,%esi,8)
	movl	-3699104(%ebp),%eax
	faddl	-2115744(%ebp,%esi,8)
.SSN79:
# 106
	movl	-3699092(%ebp),%edi
	fldl	-2115744(%ebp,%eax,8)
	movl	-3699100(%ebp),%esi
	fsubrl	-2115744(%ebp,%edi,8)
	movl	-3699096(%ebp),%eax
	fldl	-2115744(%ebp,%esi,8)
	fsubl	-2115744(%ebp,%eax,8)
.SSN80:
# 111
	fxch	%st(4)
	faddl	-3699024(%ebp)
	fldl	-3698976(%ebp)
	faddl	-3698968(%ebp)
	fxch	%st(2)
	faddp	%st,%st(5)
	fsub	%st(2),%st
	fxch	%st(1)
	fsubp	%st,%st(2)
	fxch	%st(3)
	fmulp	%st,%st(4)
	fxch	%st(2)
	fmull	-3698952(%ebp)
	fxch	%st(2)
	fmulp	%st,%st(1)
	faddp	%st,%st(1)
	fsubp	%st,%st(1)
	fstpl	-3172576(%ebp,%ecx,8)
	fldl	-3699016(%ebp)
	fldl	-3699008(%ebp)
.SSN81:
# 112
	movl	-3699084(%ebp),%edi
	incl	%edi
	incl	%ecx
	movl	-3699088(%ebp),%esi
	incl	%esi
	movl	-3699080(%ebp),%eax
	incl	%eax
	movl	%edi,-3699084(%ebp)
	movl	-3699100(%ebp),%edi
	incl	%edi
	movl	%esi,-3699088(%ebp)
	movl	-3699096(%ebp),%esi
	incl	%esi
	movl	%eax,-3699080(%ebp)
	movl	-3699076(%ebp),%eax
	incl	%eax
	movl	%edi,-3699100(%ebp)
	movl	-3699104(%ebp),%edi
	incl	%edi
	movl	%esi,-3699096(%ebp)
	movl	-3699092(%ebp),%esi
	incl	%esi
	incl	%edx
	subl	$1,-3699060(%ebp)
	movl	%eax,-3699076(%ebp)
	movl	%esi,-3699092(%ebp)
	movl	%edi,-3699104(%ebp)
	jne	.LL123
.LL124:
# 112
.SSN82:
# 113
	incl	%ebx
	cmpl	$257,%ebx
	jl	.LL120
.LL126:
# 113
	fstpl	%st
	fstpl	%st
.LL127:
.SSN83:
# 117
.LL128:
# 117
	movl	$1,%ebx
.LL129:
.SSN84:
# 118
	movl	$51,%eax
	movl	%eax,-3699108(%ebp)
.LL130:
# 118
	movl	$2,%ecx
	movl	%ebx,%eax
	shll	$8,%eax
	addl	%ebx,%eax
	movl	%eax,%edx
	addl	$2,%edx
.LL131:
.SSN85:
# 119
	fldl	-2644160(%ebp,%edx,8)
	fldl	%st
	fabs
	fldl	-8(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL132
	ja	.LL245
.LL132:
.SSN86:
# 120
	fstpl	-8(%ebp)
.SSN87:
# 121
	movl	%ecx,-24(%ebp)
.SSN88:
# 122
	movl	%ebx,-28(%ebp)
	jmp	.LL133
.LL245:
.SSN89:
# 123
	fstpl	%st
.LL133:
# 123
	fldl	-3172576(%ebp,%edx,8)
	fldl	%st
	fabs
	fldl	-16(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL134
	ja	.LL246
.LL134:
.SSN90:
# 124
	fstpl	-16(%ebp)
.SSN91:
# 125
	movl	%ecx,-32(%ebp)
.SSN92:
# 126
	movl	%ebx,-36(%ebp)
	jmp	.LL135
.LL246:
.SSN93:
# 127
	fstpl	%st
.LL135:
# 127
.SSN94:
# 119
	fldl	-2644152(%ebp,%edx,8)
	fldl	%st
	fabs
	incl	%ecx
	fldl	-8(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL204
	ja	.LL247
.LL204:
.SSN95:
# 120
	fstpl	-8(%ebp)
.SSN96:
# 121
	movl	%ecx,-24(%ebp)
.SSN97:
# 122
	movl	%ebx,-28(%ebp)
	jmp	.LL205
.LL247:
.SSN98:
# 123
	fstpl	%st
.LL205:
# 123
	fldl	-3172568(%ebp,%edx,8)
	fldl	%st
	fabs
	fldl	-16(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL206
	ja	.LL248
.LL206:
.SSN99:
# 124
	fstpl	-16(%ebp)
.SSN100:
# 125
	movl	%ecx,-32(%ebp)
.SSN101:
# 126
	movl	%ebx,-36(%ebp)
	jmp	.LL207
.LL248:
.SSN102:
# 127
	fstpl	%st
.LL207:
# 127
.SSN103:
# 119
	fldl	-2644144(%ebp,%edx,8)
	fldl	%st
	fabs
	incl	%ecx
	fldl	-8(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL209
	ja	.LL249
.LL209:
.SSN104:
# 120
	fstpl	-8(%ebp)
.SSN105:
# 121
	movl	%ecx,-24(%ebp)
.SSN106:
# 122
	movl	%ebx,-28(%ebp)
	jmp	.LL210
.LL249:
.SSN107:
# 123
	fstpl	%st
.LL210:
# 123
	fldl	-3172560(%ebp,%edx,8)
	fldl	%st
	fabs
	fldl	-16(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL211
	ja	.LL250
.LL211:
.SSN108:
# 124
	fstpl	-16(%ebp)
.SSN109:
# 125
	movl	%ecx,-32(%ebp)
.SSN110:
# 126
	movl	%ebx,-36(%ebp)
	jmp	.LL212
.LL250:
.SSN111:
# 127
	fstpl	%st
.LL212:
# 127
.SSN112:
# 119
	fldl	-2644136(%ebp,%edx,8)
	fldl	%st
	fabs
	incl	%ecx
	fldl	-8(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL214
	ja	.LL251
.LL214:
.SSN113:
# 120
	fstpl	-8(%ebp)
.SSN114:
# 121
	movl	%ecx,-24(%ebp)
.SSN115:
# 122
	movl	%ebx,-28(%ebp)
	jmp	.LL215
.LL251:
.SSN116:
# 123
	fstpl	%st
.LL215:
# 123
	fldl	-3172552(%ebp,%edx,8)
	fldl	%st
	fabs
	fldl	-16(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL216
	ja	.LL252
.LL216:
.SSN117:
# 124
	fstpl	-16(%ebp)
.SSN118:
# 125
	movl	%ecx,-32(%ebp)
.SSN119:
# 126
	movl	%ebx,-36(%ebp)
	jmp	.LL217
.LL252:
.SSN120:
# 127
	fstpl	%st
.LL217:
# 127
.SSN121:
# 119
	fldl	-2644128(%ebp,%edx,8)
	fldl	%st
	fabs
	incl	%ecx
	fldl	-8(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL219
	ja	.LL253
.LL219:
.SSN122:
# 120
	fstpl	-8(%ebp)
.SSN123:
# 121
	movl	%ecx,-24(%ebp)
.SSN124:
# 122
	movl	%ebx,-28(%ebp)
	jmp	.LL220
.LL253:
.SSN125:
# 123
	fstpl	%st
.LL220:
# 123
	fldl	-3172544(%ebp,%edx,8)
	fldl	%st
	fabs
	fldl	-16(%ebp)
	fabs
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL221
	ja	.LL254
.LL221:
.SSN126:
# 124
	fstpl	-16(%ebp)
.SSN127:
# 125
	movl	%ecx,-32(%ebp)
.SSN128:
# 126
	movl	%ebx,-36(%ebp)
	jmp	.LL222
.LL254:
.SSN129:
# 127
	fstpl	%st
.LL222:
# 127
	incl	%ecx
	movl	-3699108(%ebp),%eax
	decl	%eax
	addl	$5,%edx
	cmpl	$1,%eax
	movl	%eax,-3699108(%ebp)
	jge	.LL131
.LL136:
# 127
# 127
	incl	%ebx
	cmpl	$256,%ebx
	jl	.LL129
.LL138:
# 127
.LL146:
.SSN130:
# 138
.LL147:
# 138
	movl	$2,%ecx
.LL148:
.SSN131:
# 139
	fld1
	fldl	%st
	fdivl	-1056856(%ebp,%ecx,8)
	fstpl	-3698936(%ebp,%ecx,8)
# 139
	fldl	%st
	fdivl	-1056848(%ebp,%ecx,8)
	fstpl	-3698928(%ebp,%ecx,8)
# 139
	fldl	%st
	fdivl	-1056840(%ebp,%ecx,8)
	fstpl	-3698920(%ebp,%ecx,8)
# 139
	fldl	%st
	fdivl	-1056832(%ebp,%ecx,8)
	fstpl	-3698912(%ebp,%ecx,8)
# 139
	fdivl	-1056824(%ebp,%ecx,8)
.SSN132:
# 140
	addl	$5,%ecx
	cmpl	$257,%ecx
	fstpl	-3698944(%ebp,%ecx,8)
	jl	.LL148
.LL149:
# 140
.LL150:
.SSN133:
# 141
.LL151:
# 141
	movl	$2,%ebx
.LL152:
.SSN134:
# 142
	movl	$85,%edx
.LL153:
# 142
	movl	%ebx,%eax
	shll	$8,%eax
	addl	%ebx,%eax
	movl	%eax,%ecx
	addl	$2,%ecx
.LL154:
.SSN135:
# 143
	fldl	-3703048(%ebp,%ecx,8)
	fmull	-530496(%ebp,%ecx,8)
.SSN136:
# 144
	fldl	%st
	fmull	-532552(%ebp,%ecx,8)
	fsubrl	-1058912(%ebp,%ecx,8)
	fdivrl	.LS1+56
	fstpl	-3700992(%ebp,%ecx,8)
.SSN137:
# 145
	fldl	%st
	fmull	-2646216(%ebp,%ecx,8)
.SSN138:
# 146
	fxch	%st(1)
	fmull	-3174632(%ebp,%ecx,8)
	fxch	%st(1)
	fsubrl	-2644160(%ebp,%ecx,8)
	fxch	%st(1)
	fsubrl	-3172576(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2644160(%ebp,%ecx,8)
	fstpl	-3172576(%ebp,%ecx,8)
.SSN139:
# 143
	fldl	-3703040(%ebp,%ecx,8)
	fmull	-530488(%ebp,%ecx,8)
.SSN140:
# 144
	fldl	%st
	fmull	-532544(%ebp,%ecx,8)
	fsubrl	-1058904(%ebp,%ecx,8)
	fdivrl	.LS1+56
	fstpl	-3700984(%ebp,%ecx,8)
.SSN141:
# 145
	fldl	%st
	fmull	-2646208(%ebp,%ecx,8)
	fsubrl	-2644152(%ebp,%ecx,8)
	fstpl	-2644152(%ebp,%ecx,8)
.SSN142:
# 146
	fmull	-3174624(%ebp,%ecx,8)
	fsubrl	-3172568(%ebp,%ecx,8)
	fstpl	-3172568(%ebp,%ecx,8)
.SSN143:
# 143
	fldl	-3703032(%ebp,%ecx,8)
	fmull	-530480(%ebp,%ecx,8)
.SSN144:
# 144
	fldl	%st
	fmull	-532536(%ebp,%ecx,8)
	fsubrl	-1058896(%ebp,%ecx,8)
	fdivrl	.LS1+56
	fstpl	-3700976(%ebp,%ecx,8)
.SSN145:
# 145
	fldl	%st
	fmull	-2646200(%ebp,%ecx,8)
	fsubrl	-2644144(%ebp,%ecx,8)
	fstpl	-2644144(%ebp,%ecx,8)
.SSN146:
# 146
	fmull	-3174616(%ebp,%ecx,8)
	fsubrl	-3172560(%ebp,%ecx,8)
.SSN147:
# 147
	addl	$3,%ecx
	decl	%edx
	cmpl	$1,%edx
	fstpl	-3172584(%ebp,%ecx,8)
	jge	.LL154
.LL155:
# 147
# 147
	incl	%ebx
	cmpl	$256,%ebx
	jl	.LL152
.LL157:
# 147
.LL158:
.SSN148:
# 148
.LL159:
# 148
	movl	$65537,%ecx
.LL160:
.SSN149:
# 149
	fldl	-3700992(%ebp,%ecx,8)
	fldl	%st
	fmull	-2644160(%ebp,%ecx,8)
.SSN150:
# 150
	fxch	%st(1)
	fmull	-3172576(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2644160(%ebp,%ecx,8)
	fstpl	-3172576(%ebp,%ecx,8)
.SSN151:
# 149
	fldl	-3700984(%ebp,%ecx,8)
	fldl	%st
	fmull	-2644152(%ebp,%ecx,8)
.SSN152:
# 150
	fxch	%st(1)
	fmull	-3172568(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2644152(%ebp,%ecx,8)
	fstpl	-3172568(%ebp,%ecx,8)
.SSN153:
# 149
	fldl	-3700976(%ebp,%ecx,8)
	fldl	%st
	fmull	-2644144(%ebp,%ecx,8)
.SSN154:
# 150
	fxch	%st(1)
	fmull	-3172560(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2644144(%ebp,%ecx,8)
	fstpl	-3172560(%ebp,%ecx,8)
.SSN155:
# 149
	fldl	-3700968(%ebp,%ecx,8)
	fldl	%st
	fmull	-2644136(%ebp,%ecx,8)
.SSN156:
# 150
	fxch	%st(1)
	fmull	-3172552(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2644136(%ebp,%ecx,8)
	fstpl	-3172552(%ebp,%ecx,8)
.SSN157:
# 149
	fldl	-3700960(%ebp,%ecx,8)
	fldl	%st
	fmull	-2644128(%ebp,%ecx,8)
.SSN158:
# 150
	fxch	%st(1)
	fmull	-3172544(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-2644128(%ebp,%ecx,8)
.SSN159:
# 151
	addl	$5,%ecx
	cmpl	$65792,%ecx
	fstpl	-3172584(%ebp,%ecx,8)
	jl	.LL160
.LL161:
# 151
.LL162:
.SSN160:
# 152
.LL163:
# 152
	movl	$2,%ebx
.LL164:
.SSN161:
# 153
	movl	$256,%eax
	subl	%ebx,%eax
	movl	%eax,%ecx
.LL165:
.SSN162:
# 154
	movl	$85,%edx
.LL166:
# 154
	movl	%ecx,%eax
	shll	$8,%eax
	addl	%ecx,%eax
	movl	%eax,%ecx
	addl	$2,%ecx
.LL167:
.SSN163:
# 155
	fldl	-530496(%ebp,%ecx,8)
	fldl	%st
	fmull	-2642104(%ebp,%ecx,8)
	fldl	-3700992(%ebp,%ecx,8)
	fxch	%st(1)
	fsubrl	-2644160(%ebp,%ecx,8)
	fmull	-3700992(%ebp,%ecx,8)
	fstpl	-2644160(%ebp,%ecx,8)
.SSN164:
# 156
	fxch	%st(1)
	fmull	-3170520(%ebp,%ecx,8)
	fsubrl	-3172576(%ebp,%ecx,8)
	fmulp	%st,%st(1)
	fstpl	-3172576(%ebp,%ecx,8)
.SSN165:
# 155
	fldl	-530488(%ebp,%ecx,8)
	fldl	%st
	fmull	-2642096(%ebp,%ecx,8)
	fldl	-3700984(%ebp,%ecx,8)
	fxch	%st(1)
	fsubrl	-2644152(%ebp,%ecx,8)
	fmull	-3700984(%ebp,%ecx,8)
	fstpl	-2644152(%ebp,%ecx,8)
.SSN166:
# 156
	fxch	%st(1)
	fmull	-3170512(%ebp,%ecx,8)
	fsubrl	-3172568(%ebp,%ecx,8)
	fmulp	%st,%st(1)
	fstpl	-3172568(%ebp,%ecx,8)
.SSN167:
# 155
	fldl	-530480(%ebp,%ecx,8)
	fldl	%st
	fmull	-2642088(%ebp,%ecx,8)
	fldl	-3700976(%ebp,%ecx,8)
	fxch	%st(1)
	fsubrl	-2644144(%ebp,%ecx,8)
	fmull	-3700976(%ebp,%ecx,8)
	fstpl	-2644144(%ebp,%ecx,8)
.SSN168:
# 156
	fxch	%st(1)
	fmull	-3170504(%ebp,%ecx,8)
	fsubrl	-3172560(%ebp,%ecx,8)
	fmulp	%st,%st(1)
.SSN169:
# 157
	addl	$3,%ecx
	decl	%edx
	cmpl	$1,%edx
	fstpl	-3172584(%ebp,%ecx,8)
	jge	.LL167
.LL168:
# 157
# 157
	incl	%ebx
	cmpl	$256,%ebx
	jl	.LL164
.LL170:
# 157
.SSN170:
# 161
	movl	$0,%eax
	movl	%eax,-3699112(%ebp)
.LL172:
.SSN171:
# 162
.LL173:
# 162
	movl	$2,%ebx
.LL174:
.SSN172:
# 163
	incl	-3699112(%ebp)
.LL175:
.SSN173:
# 164
	movl	$51,%eax
	movl	%eax,-3699116(%ebp)
.LL176:
# 164
	movl	%ebx,%eax
	shll	$8,%eax
	addl	%ebx,%eax
	movl	%eax,%ecx
	addl	$2,%ecx
	movl	-3699112(%ebp),%eax
	movl	%eax,%esi
	shll	$8,%esi
	addl	%eax,%esi
	movl	%esi,%edx
	addl	$2,%edx
.LL177:
.SSN174:
# 165
	fldl	-2644160(%ebp,%edx,8)
	faddl	-1587328(%ebp,%ecx,8)
.SSN175:
# 166
	fldl	-3172576(%ebp,%edx,8)
	faddl	-2115744(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-1587328(%ebp,%ecx,8)
	fstpl	-2115744(%ebp,%ecx,8)
.SSN176:
# 165
	fldl	-2644152(%ebp,%edx,8)
	faddl	-1587320(%ebp,%ecx,8)
.SSN177:
# 166
	fldl	-3172568(%ebp,%edx,8)
	faddl	-2115736(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-1587320(%ebp,%ecx,8)
	fstpl	-2115736(%ebp,%ecx,8)
.SSN178:
# 165
	fldl	-2644144(%ebp,%edx,8)
	faddl	-1587312(%ebp,%ecx,8)
.SSN179:
# 166
	fldl	-3172560(%ebp,%edx,8)
	faddl	-2115728(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-1587312(%ebp,%ecx,8)
	fstpl	-2115728(%ebp,%ecx,8)
.SSN180:
# 165
	fldl	-2644136(%ebp,%edx,8)
	faddl	-1587304(%ebp,%ecx,8)
.SSN181:
# 166
	fldl	-3172552(%ebp,%edx,8)
	faddl	-2115720(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-1587304(%ebp,%ecx,8)
	fstpl	-2115720(%ebp,%ecx,8)
.SSN182:
# 165
	fldl	-2644128(%ebp,%edx,8)
	faddl	-1587296(%ebp,%ecx,8)
.SSN183:
# 166
	fldl	-3172544(%ebp,%edx,8)
	faddl	-2115712(%ebp,%ecx,8)
	fxch	%st(1)
	fstpl	-1587296(%ebp,%ecx,8)
	fstpl	-2115712(%ebp,%ecx,8)
.SSN184:
# 167
	addl	$5,%ecx
	addl	$5,%edx
	movl	-3699116(%ebp),%eax
	decl	%eax
	cmpl	$1,%eax
	movl	%eax,-3699116(%ebp)
	jge	.LL177
.LL178:
# 167
# 167
	incl	%ebx
	cmpl	$257,%ebx
	jl	.LL174
.LL180:
# 167
.SSN185:
# 171
	movl	-20(%ebp),%eax
	incl	%eax
	movl	%eax,-20(%ebp)
.SSN186:
# 172
	leal	.LS1+244,%eax
	leal	-20(%ebp),%ecx
	movl	%ecx,40(%eax)
	leal	-24(%ebp),%ecx
	movl	%ecx,124(%eax)
	leal	-28(%ebp),%ecx
	movl	%ecx,136(%eax)
	leal	-8(%ebp),%ecx
	movl	%ecx,148(%eax)
	leal	-32(%ebp),%ecx
	movl	%ecx,160(%eax)
	leal	-36(%ebp),%ecx
	movl	%ecx,172(%eax)
	leal	-16(%ebp),%ecx
	movl	%ecx,184(%eax)
	pushl	%eax
	call	jwe_isfm
	addl	$4,%esp
.SSN187:
# 177
	fldl	-16(%ebp)
	fabs
.SSN188:
# 176
	fldl	-8(%ebp)
	fabs
.SSN189:
# 178
	fxch	%st(1)
	fstl	-3699040(%ebp)
	fcomp	%st(1)
	fnstsw	%ax
	testw	$16640,%ax
	je	.LL255
.LL243:
# 178
	fstpl	-3699040(%ebp)
	jmp	.LL244
.LL255:
# 178
	fstpl	%st
.LL244:
# 178
.SSN190:
# 179
	cmpl	$100,-20(%ebp)
	jge	.LL183
.LL182:
# 179
	fldl	.LS1+8
	fldl	-3699040(%ebp)
	fcomip	%st(1),%st
	fstpl	%st
	jp	.LL183
	ja	.LL117
.LL183:
.SSN191:
# 194
	push	$.LS1+236
	call	jwe_xstp
	addl	$4,%esp
	popl	%edi
	popl	%esi
	popl	%ebx
	leave
.SSN192:
	.size	MAIN__,.-MAIN__
	.type	MAIN__,@function
	.section	.rodata
	.globl	.jwe_ssn_MAIN__
	.align	4
.jwe_ssn_MAIN__:
	.long	MAIN__+0
	.long	0x0
	.long	0x600
	.long	13,.SSN1-MAIN__
	.long	18,.SSN2-MAIN__
	.long	29,.SSN3-MAIN__
	.long	30,.SSN4-MAIN__
	.long	32,.SSN5-MAIN__
	.long	33,.SSN6-MAIN__
	.long	34,.SSN7-MAIN__
	.long	36,.SSN8-MAIN__
	.long	35,.SSN9-MAIN__
	.long	37,.SSN10-MAIN__
	.long	38,.SSN11-MAIN__
	.long	33,.SSN12-MAIN__
	.long	34,.SSN13-MAIN__
	.long	36,.SSN14-MAIN__
	.long	35,.SSN15-MAIN__
	.long	37,.SSN16-MAIN__
	.long	38,.SSN17-MAIN__
	.long	33,.SSN18-MAIN__
	.long	34,.SSN19-MAIN__
	.long	36,.SSN20-MAIN__
	.long	35,.SSN21-MAIN__
	.long	37,.SSN22-MAIN__
	.long	38,.SSN23-MAIN__
	.long	33,.SSN24-MAIN__
	.long	34,.SSN25-MAIN__
	.long	36,.SSN26-MAIN__
	.long	35,.SSN27-MAIN__
	.long	37,.SSN28-MAIN__
	.long	38,.SSN29-MAIN__
	.long	39,.SSN30-MAIN__
	.long	33,.SSN31-MAIN__
	.long	34,.SSN32-MAIN__
	.long	35,.SSN33-MAIN__
	.long	37,.SSN34-MAIN__
	.long	38,.SSN35-MAIN__
	.long	36,.SSN36-MAIN__
	.long	40,.SSN37-MAIN__
	.long	41,.SSN38-MAIN__
	.long	42,.SSN39-MAIN__
	.long	43,.SSN40-MAIN__
	.long	44,.SSN41-MAIN__
	.long	45,.SSN42-MAIN__
	.long	44,.SSN43-MAIN__
	.long	45,.SSN44-MAIN__
	.long	44,.SSN45-MAIN__
	.long	45,.SSN46-MAIN__
	.long	46,.SSN47-MAIN__
	.long	49,.SSN48-MAIN__
	.long	50,.SSN49-MAIN__
	.long	61,.SSN50-MAIN__
	.long	62,.SSN51-MAIN__
	.long	68,.SSN52-MAIN__
	.long	70,.SSN53-MAIN__
	.long	69,.SSN54-MAIN__
	.long	71,.SSN55-MAIN__
	.long	72,.SSN56-MAIN__
	.long	73,.SSN57-MAIN__
	.long	77,.SSN58-MAIN__
	.long	78,.SSN59-MAIN__
	.long	79,.SSN60-MAIN__
	.long	80,.SSN61-MAIN__
	.long	81,.SSN62-MAIN__
	.long	85,.SSN63-MAIN__
	.long	86,.SSN64-MAIN__
	.long	88,.SSN65-MAIN__
	.long	89,.SSN66-MAIN__
	.long	93,.SSN67-MAIN__
	.long	99,.SSN68-MAIN__
	.long	90,.SSN69-MAIN__
	.long	91,.SSN70-MAIN__
	.long	92,.SSN71-MAIN__
	.long	100,.SSN72-MAIN__
	.long	101,.SSN73-MAIN__
	.long	105,.SSN74-MAIN__
	.long	94,.SSN75-MAIN__
	.long	103,.SSN76-MAIN__
	.long	110,.SSN77-MAIN__
	.long	102,.SSN78-MAIN__
	.long	106,.SSN79-MAIN__
	.long	111,.SSN80-MAIN__
	.long	112,.SSN81-MAIN__
	.long	113,.SSN82-MAIN__
	.long	117,.SSN83-MAIN__
	.long	118,.SSN84-MAIN__
	.long	119,.SSN85-MAIN__
	.long	120,.SSN86-MAIN__
	.long	121,.SSN87-MAIN__
	.long	122,.SSN88-MAIN__
	.long	123,.SSN89-MAIN__
	.long	124,.SSN90-MAIN__
	.long	125,.SSN91-MAIN__
	.long	126,.SSN92-MAIN__
	.long	127,.SSN93-MAIN__
	.long	119,.SSN94-MAIN__
	.long	120,.SSN95-MAIN__
	.long	121,.SSN96-MAIN__
	.long	122,.SSN97-MAIN__
	.long	123,.SSN98-MAIN__
	.long	124,.SSN99-MAIN__
	.long	125,.SSN100-MAIN__
	.long	126,.SSN101-MAIN__
	.long	127,.SSN102-MAIN__
	.long	119,.SSN103-MAIN__
	.long	120,.SSN104-MAIN__
	.long	121,.SSN105-MAIN__
	.long	122,.SSN106-MAIN__
	.long	123,.SSN107-MAIN__
	.long	124,.SSN108-MAIN__
	.long	125,.SSN109-MAIN__
	.long	126,.SSN110-MAIN__
	.long	127,.SSN111-MAIN__
	.long	119,.SSN112-MAIN__
	.long	120,.SSN113-MAIN__
	.long	121,.SSN114-MAIN__
	.long	122,.SSN115-MAIN__
	.long	123,.SSN116-MAIN__
	.long	124,.SSN117-MAIN__
	.long	125,.SSN118-MAIN__
	.long	126,.SSN119-MAIN__
	.long	127,.SSN120-MAIN__
	.long	119,.SSN121-MAIN__
	.long	120,.SSN122-MAIN__
	.long	121,.SSN123-MAIN__
	.long	122,.SSN124-MAIN__
	.long	123,.SSN125-MAIN__
	.long	124,.SSN126-MAIN__
	.long	125,.SSN127-MAIN__
	.long	126,.SSN128-MAIN__
	.long	127,.SSN129-MAIN__
	.long	138,.SSN130-MAIN__
	.long	139,.SSN131-MAIN__
	.long	140,.SSN132-MAIN__
	.long	141,.SSN133-MAIN__
	.long	142,.SSN134-MAIN__
	.long	143,.SSN135-MAIN__
	.long	144,.SSN136-MAIN__
	.long	145,.SSN137-MAIN__
	.long	146,.SSN138-MAIN__
	.long	143,.SSN139-MAIN__
	.long	144,.SSN140-MAIN__
	.long	145,.SSN141-MAIN__
	.long	146,.SSN142-MAIN__
	.long	143,.SSN143-MAIN__
	.long	144,.SSN144-MAIN__
	.long	145,.SSN145-MAIN__
	.long	146,.SSN146-MAIN__
	.long	147,.SSN147-MAIN__
	.long	148,.SSN148-MAIN__
	.long	149,.SSN149-MAIN__
	.long	150,.SSN150-MAIN__
	.long	149,.SSN151-MAIN__
	.long	150,.SSN152-MAIN__
	.long	149,.SSN153-MAIN__
	.long	150,.SSN154-MAIN__
	.long	149,.SSN155-MAIN__
	.long	150,.SSN156-MAIN__
	.long	149,.SSN157-MAIN__
	.long	150,.SSN158-MAIN__
	.long	151,.SSN159-MAIN__
	.long	152,.SSN160-MAIN__
	.long	153,.SSN161-MAIN__
	.long	154,.SSN162-MAIN__
	.long	155,.SSN163-MAIN__
	.long	156,.SSN164-MAIN__
	.long	155,.SSN165-MAIN__
	.long	156,.SSN166-MAIN__
	.long	155,.SSN167-MAIN__
	.long	156,.SSN168-MAIN__
	.long	157,.SSN169-MAIN__
	.long	161,.SSN170-MAIN__
	.long	162,.SSN171-MAIN__
	.long	163,.SSN172-MAIN__
	.long	164,.SSN173-MAIN__
	.long	165,.SSN174-MAIN__
	.long	166,.SSN175-MAIN__
	.long	165,.SSN176-MAIN__
	.long	166,.SSN177-MAIN__
	.long	165,.SSN178-MAIN__
	.long	166,.SSN179-MAIN__
	.long	165,.SSN180-MAIN__
	.long	166,.SSN181-MAIN__
	.long	165,.SSN182-MAIN__
	.long	166,.SSN183-MAIN__
	.long	167,.SSN184-MAIN__
	.long	171,.SSN185-MAIN__
	.long	172,.SSN186-MAIN__
	.long	177,.SSN187-MAIN__
	.long	176,.SSN188-MAIN__
	.long	178,.SSN189-MAIN__
	.long	179,.SSN190-MAIN__
	.long	194,.SSN191-MAIN__
	.long	0,.SSN192-MAIN__
	.long	0x0
	.long	0x1
	.long	.jwe_ssn_MAIN__+1560
	.ascii	"tomcatv.f\0"

	.section	.data
	.comm	zeit_,8,8
	.section	.text

