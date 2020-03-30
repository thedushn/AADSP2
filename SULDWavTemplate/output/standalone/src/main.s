	.public _K1
	.public _K2
	.public _coeffH
	.public _coeffL
	.public _enable
	.public _sampleBuffer
	.public _sb_ptr0
	.public _sb_ptr1
	.public _sb_ptr2
	.public _sb_ptr3
	.public _sb_ptr4
	.public _sb_ptr5
	.public _sb_ptr6
	.public _sb_ptr7
	.public _z_xH
	.public _z_xL
	.public _z_yH
	.public _z_yL
	.public _calculateShelvingCoeff
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.public _clip
	.public _first_order_IIR
	.public _main
	.extern _printf
	.public _processing
	.public _shelvingHP
	.public _shelvingLP
	.extern _strcmp
	.extern _strcpy
	.extern __div
	.xdata_ovly
_Fch
	.bss (0x1)
	.xdata_ovly
_Fcl
	.bss (0x1)
	.xdata_ovly
_K1
	.dw  (0x0)
	.xdata_ovly
_K2
	.dw  (0x0)
	.xdata_ovly
_alpha1
	.dw  (0x0)
	.xdata_ovly
_alpha2
	.dw  (0x0)
	.xdata_ovly align 4
_coeffH
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.xdata_ovly align 4
_coeffL
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.dw  (0x0)
	.xdata_ovly
_enable
	.dw  (0x1)
	.xdata_ovly
_main_h
	.bss (0x1)
	.xdata_ovly
_main_nChannels
	.bss (0x1)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_sb_ptr0
	.bss (0x1)
	.xdata_ovly
_sb_ptr1
	.dw _sampleBuffer+16
	.xdata_ovly
_sb_ptr2
	.dw _sampleBuffer+32
	.xdata_ovly
_sb_ptr3
	.dw _sampleBuffer+48
	.xdata_ovly
_sb_ptr4
	.dw _sampleBuffer+64
	.xdata_ovly
_sb_ptr5
	.dw _sampleBuffer+80
	.xdata_ovly
_sb_ptr6
	.dw _sampleBuffer+96
	.xdata_ovly
_sb_ptr7
	.dw _sampleBuffer+112
	.xdata_ovly
_string_const_0
	.dw  (0x30)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_2
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_test_n
	.dw  (0x80000000)
	.xdata_ovly
_test_p
	.dw  (0x7fffffff)
	.xdata_ovly
_z_xH
	.bss (0x10)
	.xdata_ovly
_z_xL
	.bss (0x10)
	.xdata_ovly
_z_yH
	.bss (0x10)
	.xdata_ovly
_z_yL
	.bss (0x10)
	.code_ovly



_calculateShelvingCoeff:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 117 | 
	i7 += 1			# LN: 117 | 
	i7 = i7 + (0x4)			# LN: 117 | 
	i1 = i7 - (0x1)			# LN: 117 | 
	xmem[i1] = a0h			# LN: 117 | 
	i1 = i7 - (0x2)			# LN: 117 | 
	xmem[i1] = i0			# LN: 117 | 
cline_117_0:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 121 | 
	a0 = xmem[i0]			# LN: 121 | 
	i0 = i7 - (0x3)			# LN: 121 | 
	xmem[i0] = a0h			# LN: 121 | 
cline_121_0:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 122 | 
	call (_clip)			# LN: 122 | 
cline_122_0:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 124 | 
	a0 = xmem[i0]			# LN: 124 | 
	a0 =- a0			# LN: 124 | 
	i0 = i7 - (0x4)			# LN: 124 | 
	xmem[i0] = a0h			# LN: 124 | 
cline_124_0:			/* LN: 125 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 125 | 
	call (_clip)			# LN: 125 | 
cline_125_0:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 127 | 
	i1 = i7 - (0x2)			# LN: 127 | 
	i1 = xmem[i1]			# LN: 127 | 
	a0 = xmem[i0]			# LN: 127 | 
	xmem[i1] = a0h			# LN: 127 | 
cline_127_0:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 129 | 
	i0 = xmem[i0]			# LN: 129 | 
	a0 = xmem[_test_n + 0]			# LN: 129 | 
	i0 += 1			# LN: 129 | 
	xmem[i0] = a0h			# LN: 129 | 
cline_129_0:			/* LN: 130 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 130 | 
	i0 = xmem[i0]			# LN: 130 | 
	a0 = xmem[_test_p + 0]			# LN: 130 | 
	i0 += 2			# LN: 130 | 
	xmem[i0] = a0h			# LN: 130 | 
cline_130_0:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 131 | 
	i0 = xmem[i0]			# LN: 131 | 
	i1 = i7 - (0x4)			# LN: 131 | 
	i0 = i0 + (0x3)			# LN: 131 | 
	a0 = xmem[i1]			# LN: 131 | 
	xmem[i0] = a0h			# LN: 131 | 
cline_131_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_246)			# LN: 133 | 
__epilogue_246:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x4)			# LN: 133 | 
	i7 -= 1			# LN: 133 | 
	ret			# LN: 133 | 



_clip:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 45 | 
	i7 += 1			# LN: 45 | 
	i7 = i7 + (0x1)			# LN: 45 | 
	i1 = i7 - (0x1)			# LN: 45 | 
	xmem[i1] = i0			# LN: 45 | 
cline_45_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 47 | 
	i0 = xmem[i0]			# LN: 47 | 
	a0 = xmem[_test_p + 0]			# LN: 47 | 
	a1 = xmem[i0]; i0 += 1			# LN: 47, 47 | 
	a1l = xmem[i0]			# LN: 47 | 
	a0 = a1 - a0			# LN: 47 | 
	if (a <= 0) jmp (else_0)			# LN: 47 | 
cline_47_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 49 | 
	i0 = xmem[i0]			# LN: 49 | 
	a0 = xmem[_test_p + 0]			# LN: 49 | 
	xmem[i0] = a0h; i0 += 1			# LN: 49, 49 | 
	xmem[i0] = a0l			# LN: 49 | 
	jmp (endif_0)			# LN: 49 | 
cline_49_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 52 | 
	i0 = xmem[i0]			# LN: 52 | 
	a0 = xmem[_test_n + 0]			# LN: 52 | 
	a1 = xmem[i0]; i0 += 1			# LN: 52, 52 | 
	a1l = xmem[i0]			# LN: 52 | 
	a0 = a1 - a0			# LN: 52 | 
	if (a >= 0) jmp (else_1)			# LN: 52 | 
cline_52_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 53 | 
	i0 = xmem[i0]			# LN: 53 | 
	a0 = xmem[_test_n + 0]			# LN: 53 | 
	xmem[i0] = a0h; i0 += 1			# LN: 53, 53 | 
	xmem[i0] = a0l			# LN: 53 | 
	jmp (endif_1)			# LN: 53 | 
cline_53_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_238)			# LN: 56 | 
__epilogue_238:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 56 | 
	i7 -= 1			# LN: 56 | 
	ret			# LN: 56 | 



_first_order_IIR:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 57 | 
	i7 += 1			# LN: 57 | 
	i7 = i7 + (0x6)			# LN: 57 | 
	i5 = i7 - (0x1)			# LN: 57 | 
	xmem[i5] = a0h			# LN: 57 | 
	i5 = i7 - (0x2)			# LN: 57 | 
	xmem[i5] = i0			# LN: 57 | 
	i0 = i7 - (0x3)			# LN: 57 | 
	xmem[i0] = i1			# LN: 57 | 
	i0 = i7 - (0x4)			# LN: 57 | 
	xmem[i0] = i4			# LN: 57 | 
cline_57_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 61 | 
	i1 = i7 - (0x3)			# LN: 61 | 
	i1 = xmem[i1]			# LN: 61 | 
	a0 = xmem[i0]			# LN: 61 | 
	xmem[i1] = a0h			# LN: 61 | 
cline_61_0:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 62 | 
	i0 = xmem[i0]			# LN: 62 | 
	i1 = i7 - (0x3)			# LN: 62 | 
	i1 = xmem[i1]			# LN: 62 | 
	x0 = xmem[i0]			# LN: 62 | 
	x1 = xmem[i1]			# LN: 62 | 
	a0 = x0 * x1			# LN: 62 | 
	a0 = long(a0)			# LN: 62 | 
	i0 = i7 - (0x6)			# LN: 62 | 
	xmem[i0] = a0h; i0 += 1			# LN: 62, 62 | 
	xmem[i0] = a0l			# LN: 62 | 
cline_62_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 65 | 
	i0 = xmem[i0]			# LN: 65 | 
	i1 = i7 - (0x3)			# LN: 65 | 
	i0 += 1			# LN: 65 | 
	i1 = xmem[i1]			# LN: 65 | 
	x0 = xmem[i0]			# LN: 65 | 
	i1 += 1			# LN: 65 | 
	i0 = i7 - (0x6)			# LN: 65 | 
	a0 = xmem[i0]; i0 += 1			# LN: 65, 65 | 
	a0l = xmem[i0]			# LN: 65 | 
	x1 = xmem[i1]			# LN: 65 | 
	a0 += x0 * x1			# LN: 65 | 
	i0 = i7 - (0x6)			# LN: 65 | 
	xmem[i0] = a0h; i0 += 1			# LN: 65, 65 | 
	xmem[i0] = a0l			# LN: 65 | 
cline_65_0:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 68 | 
	i0 = xmem[i0]			# LN: 68 | 
	i1 = i7 - (0x4)			# LN: 68 | 
	i0 = i0 + (0x3)			# LN: 68 | 
	i1 = xmem[i1]			# LN: 68 | 
	x0 = xmem[i0]			# LN: 68 | 
	i1 += 1			# LN: 68 | 
	i0 = i7 - (0x6)			# LN: 68 | 
	a0 = xmem[i0]; i0 += 1			# LN: 68, 68 | 
	a0l = xmem[i0]			# LN: 68 | 
	x1 = xmem[i1]			# LN: 68 | 
	a0 -= x0 * x1			# LN: 68 | 
	i0 = i7 - (0x6)			# LN: 68 | 
	xmem[i0] = a0h; i0 += 1			# LN: 68, 68 | 
	xmem[i0] = a0l			# LN: 68 | 
cline_68_0:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 70 | 
	a0 = xmem[i0]; i0 += 1			# LN: 70, 70 | 
	i1 = i7 - (0x4)			# LN: 70 | 
	i1 = xmem[i1]			# LN: 70 | 
	a0l = xmem[i0]			# LN: 70 | 
	xmem[i1] = a0			# LN: 70 | 
cline_70_0:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 74 | 
	i0 = xmem[i0]			# LN: 74 | 
	i1 = i7 - (0x4)			# LN: 74 | 
	i1 = xmem[i1]			# LN: 74 | 
	i0 += 1			# LN: 74 | 
	a0 = xmem[i1]			# LN: 74 | 
	xmem[i0] = a0h			# LN: 74 | 
cline_74_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 75 | 
	i0 = xmem[i0]			# LN: 75 | 
	i1 = i7 - (0x3)			# LN: 75 | 
	i1 = xmem[i1]			# LN: 75 | 
	i0 += 1			# LN: 75 | 
	a0 = xmem[i1]			# LN: 75 | 
	xmem[i0] = a0h			# LN: 75 | 
cline_75_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 77 | 
	a0 = xmem[i0]; i0 += 1			# LN: 77, 77 | 
	a0l = xmem[i0]			# LN: 77 | 
	a0 = a0			# LN: 77 | 
	jmp (__epilogue_240)			# LN: 77 | 
cline_77_0:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
__epilogue_240:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x6)			# LN: 78 | 
	i7 -= 1			# LN: 78 | 
	ret			# LN: 78 | 



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 183 | 
	i7 += 1			# LN: 183 | 
	i7 = i7 + (0x20b)			# LN: 183 | 
	i1 = i7 - (0x1)			# LN: 183 | 
	xmem[i1] = a0h			# LN: 183 | 
	i1 = i7 - (0x2)			# LN: 183 | 
	xmem[i1] = i0			# LN: 183 | 
cline_183_0:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 198 | 
	a0 = 0			# LN: 198 | 
	xmem[i0] = a0h			# LN: 198 | 
	do (0x8), label_end_94			# LN: 198 | 
cline_198_0:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 199 | 
	a0 = xmem[i0]; a1 = 0			# LN: 199, 199 | 
	a0 = a0 << 1			# LN: 199 | 
	i0 = a0			# LN: 199 | 
	nop #empty cycle
	i0 = i0 + (_z_xH + 0)			# LN: 199 | 
	xmem[i0] = a1h			# LN: 199 | 
cline_199_0:			/* LN: 200 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 200 | 
	a0 = xmem[i0]; a1 = 0			# LN: 200, 200 | 
	a0 = a0 << 1			# LN: 200 | 
	i0 = a0			# LN: 200 | 
	nop #empty cycle
	i0 = i0 + (_z_xH + 0)			# LN: 200 | 
	i0 += 1			# LN: 200 | 
	xmem[i0] = a1h			# LN: 200 | 
cline_200_0:			/* LN: 202 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 202 | 
	a0 = xmem[i0]; a1 = 0			# LN: 202, 202 | 
	a0 = a0 << 1			# LN: 202 | 
	i0 = a0			# LN: 202 | 
	nop #empty cycle
	i0 = i0 + (_z_yH + 0)			# LN: 202 | 
	xmem[i0] = a1h			# LN: 202 | 
cline_202_0:			/* LN: 203 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 203 | 
	a0 = xmem[i0]; a1 = 0			# LN: 203, 203 | 
	a0 = a0 << 1			# LN: 203 | 
	i0 = a0			# LN: 203 | 
	nop #empty cycle
	i0 = i0 + (_z_yH + 0)			# LN: 203 | 
	i0 += 1			# LN: 203 | 
	xmem[i0] = a1h			# LN: 203 | 
cline_203_0:			/* LN: 206 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 206 | 
	a0 = xmem[i0]; a1 = 0			# LN: 206, 206 | 
	a0 = a0 << 1			# LN: 206 | 
	i0 = a0			# LN: 206 | 
	nop #empty cycle
	i0 = i0 + (_z_xL + 0)			# LN: 206 | 
	xmem[i0] = a1h			# LN: 206 | 
cline_206_0:			/* LN: 207 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 207 | 
	a0 = xmem[i0]; a1 = 0			# LN: 207, 207 | 
	a0 = a0 << 1			# LN: 207 | 
	i0 = a0			# LN: 207 | 
	nop #empty cycle
	i0 = i0 + (_z_xL + 0)			# LN: 207 | 
	i0 += 1			# LN: 207 | 
	xmem[i0] = a1h			# LN: 207 | 
cline_207_0:			/* LN: 209 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 209 | 
	a0 = xmem[i0]; a1 = 0			# LN: 209, 209 | 
	a0 = a0 << 1			# LN: 209 | 
	i0 = a0			# LN: 209 | 
	nop #empty cycle
	i0 = i0 + (_z_yL + 0)			# LN: 209 | 
	xmem[i0] = a1h			# LN: 209 | 
cline_209_0:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 210 | 
	a0 = xmem[i0]; a1 = 0			# LN: 210, 210 | 
	a0 = a0 << 1			# LN: 210 | 
	i0 = a0			# LN: 210 | 
	nop #empty cycle
	i0 = i0 + (_z_yL + 0)			# LN: 210 | 
	i0 += 1			# LN: 210 | 
	xmem[i0] = a1h			# LN: 210 | 
cline_210_0:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 215 | 
	a0 = 0			# LN: 215 | 
	xmem[i0] = a0h			# LN: 215 | 
	do (0x10), label_end_93			# LN: 215 | 
cline_215_0:			/* LN: 217 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 217 | 
	a0 = xmem[i0]; a1 = 0			# LN: 217, 217 | 
	a0 = a0 << 4			# LN: 217 | 
	i0 = a0			# LN: 217 | 
	i1 = i7 - (0x4)			# LN: 217 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 217 | 
	a0 = xmem[i1]			# LN: 217 | 
	b0 = i0			# LN: 217 | 
	a0 = a0 + b0			# LN: 217 | 
	AnyReg(i0, a0h)			# LN: 217 | 
	nop #empty cycle
	ymem[i0] = a1h			# LN: 217 | 
cline_217_0:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 219 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 215 | 
	a0 = xmem[i0]			# LN: 215 | 
	uhalfword(a1) = (0x1)			# LN: 215 | 
	a0 = a0 + a1			# LN: 215 | 
	i0 = i7 - (0x4)			# LN: 215 | 
label_end_93:			# LN: 215 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 215 | 
cline_215_1:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 221 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 198 | 
	a0 = xmem[i0]			# LN: 198 | 
	uhalfword(a1) = (0x1)			# LN: 198 | 
	a0 = a0 + a1			# LN: 198 | 
	i0 = i7 - (0x3)			# LN: 198 | 
label_end_94:			# LN: 198 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 198 | 
cline_198_1:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 223 | 
	i0 = xmem[i0]			# LN: 223 | 
	i1 = (0) + (_string_const_0)			# LN: 223 | 
	i0 += 2			# LN: 223 | 
	i0 = xmem[i0]			# LN: 223 | 
	call (_strcmp)			# LN: 223 | 
	a0 & a0			# LN: 223 | 
	if (a == 0) jmp (else_2)			# LN: 223 | 
cline_223_0:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 224 | 
	xmem[_enable + 0] = a0h			# LN: 224 | 
	jmp (endif_2)			# LN: 224 | 
cline_224_0:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 227 | 
	xmem[_enable + 0] = a0h			# LN: 227 | 
cline_227_0:			/* LN: 233 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 233 | 
	i0 = xmem[i0]			# LN: 233 | 
	i1 = i7 - (260 - 0)			# LN: 233 | 
	i4 = xmem[i0]			# LN: 233 | 
	i0 = i1			# LN: 233 | 
	i1 = i4			# LN: 233 | 
	call (_strcpy)			# LN: 233 | 
cline_233_0:			/* LN: 234 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (260 - 0)			# LN: 234 | 
	call (_cl_wavread_open)			# LN: 234 | 
	AnyReg(i0, a0h)			# LN: 234 | 
	i1 = i7 - (0x105)			# LN: 234 | 
	xmem[i1] = i0			# LN: 234 | 
cline_234_0:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 235 | 
	a0 = xmem[i0]			# LN: 235 | 
	a0 & a0			# LN: 235 | 
	if (a != 0) jmp (else_3)			# LN: 235 | 
cline_235_0:			/* LN: 237 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 237 | 
	call (_printf)			# LN: 237 | 
cline_237_0:			/* LN: 238 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 238 | 
	jmp (__epilogue_250)			# LN: 238 | 
cline_238_0:			/* LN: 244 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 244 | 
	i0 = xmem[i0]			# LN: 244 | 
	call (_cl_wavread_getnchannels)			# LN: 244 | 
	xmem[_main_nChannels + 0] = a0h			# LN: 244 | 
cline_244_0:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 245 | 
	i0 = xmem[i0]			# LN: 245 | 
	call (_cl_wavread_bits_per_sample)			# LN: 245 | 
	i0 = i7 - (0x106)			# LN: 245 | 
	xmem[i0] = a0h			# LN: 245 | 
cline_245_0:			/* LN: 246 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 246 | 
	i0 = xmem[i0]			# LN: 246 | 
	call (_cl_wavread_frame_rate)			# LN: 246 | 
	i0 = i7 - (0x107)			# LN: 246 | 
	xmem[i0] = a0h			# LN: 246 | 
cline_246_0:			/* LN: 247 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 247 | 
	i0 = xmem[i0]			# LN: 247 | 
	call (_cl_wavread_number_of_frames)			# LN: 247 | 
	i0 = i7 - (0x108)			# LN: 247 | 
	xmem[i0] = a0h			# LN: 247 | 
cline_247_0:			/* LN: 252 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 252 | 
	i0 = xmem[i0]			# LN: 252 | 
	i1 = i7 - (520 - 0)			# LN: 252 | 
	i0 += 1			# LN: 252 | 
	i4 = xmem[i0]			# LN: 252 | 
	i0 = i1			# LN: 252 | 
	i1 = i4			# LN: 252 | 
	call (_strcpy)			# LN: 252 | 
cline_252_0:			/* LN: 253 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (520 - 0)			# LN: 253 | 
	i1 = i7 - (0x106)			# LN: 253 | 
	a0 = xmem[i1]			# LN: 253 | 
	a1 = xmem[_main_nChannels + 0]			# LN: 253 | 
	i1 = i7 - (0x107)			# LN: 253 | 
	b0 = xmem[i1]			# LN: 253 | 
	call (_cl_wavwrite_open)			# LN: 253 | 
	AnyReg(i0, a0h)			# LN: 253 | 
	i1 = i7 - (0x209)			# LN: 253 | 
	xmem[i1] = i0			# LN: 253 | 
cline_253_0:			/* LN: 254 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 254 | 
	a0 = xmem[i0]			# LN: 254 | 
	a0 & a0			# LN: 254 | 
	if (a != 0) jmp (else_4)			# LN: 254 | 
cline_254_0:			/* LN: 256 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_2)			# LN: 256 | 
	call (_printf)			# LN: 256 | 
cline_256_0:			/* LN: 257 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 257 | 
	jmp (__epilogue_250)			# LN: 257 | 
cline_257_0:			/* LN: 260 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 254 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 254 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 260 | 
	xmem[_K1 + 0] = a0h			# LN: 260 | 
cline_260_0:			/* LN: 261 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 261 | 
	xmem[_K2 + 0] = a0h			# LN: 261 | 
cline_261_0:			/* LN: 262 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_K1 + 0]			# LN: 262 | 
	a0 = a0 >> 1			# LN: 262 | 
	xmem[_K1 + 0] = a0h			# LN: 262 | 
cline_262_0:			/* LN: 263 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_K2 + 0]			# LN: 263 | 
	a0 = a0 >> 1			# LN: 263 | 
	xmem[_K2 + 0] = a0h			# LN: 263 | 
cline_263_0:			/* LN: 266 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 266 | 
	xmem[_alpha1 + 0] = a0h			# LN: 266 | 
cline_266_0:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
	a0 = (0xc000)			# LN: 267 | 
	xmem[_alpha2 + 0] = a0h			# LN: 267 | 
cline_267_0:			/* LN: 268 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_alpha1 + 0]			# LN: 268 | 
	i0 = (0) + (_coeffL)			# LN: 268 | 
	call (_calculateShelvingCoeff)			# LN: 268 | 
cline_268_0:			/* LN: 269 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_alpha2 + 0]			# LN: 269 | 
	i0 = (0) + (_coeffH)			# LN: 269 | 
	call (_calculateShelvingCoeff)			# LN: 269 | 
cline_269_0:			/* LN: 278 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x108)			# LN: 278 | 
	a0 = xmem[i0]			# LN: 278 | 
	uhalfword(a1) = (0x10)			# LN: 278 | 
	call (__div)			# LN: 278 | 
	xmem[_main_h + 0] = a0h			# LN: 278 | 
cline_278_0:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 280 | 
	a0 = 0			# LN: 280 | 
	xmem[i0] = a0h			# LN: 280 | 
for_3:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 280 | 
	a0 = xmem[i0]			# LN: 280 | 
	a1 = xmem[_main_h + 0]			# LN: 280 | 
	a0 - a1			# LN: 280 | 
	if (a >= 0) jmp (for_end_3)			# LN: 280 | 
cline_280_0:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 282 | 
	a0 = 0			# LN: 282 | 
	xmem[i0] = a0h			# LN: 282 | 
	do (0x10), label_end_95			# LN: 282 | 
cline_282_0:			/* LN: 284 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 284 | 
	a0 = 0			# LN: 284 | 
	xmem[i0] = a0h			# LN: 284 | 
for_5:			/* LN: 284 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 284 | 
	a0 = xmem[i0]			# LN: 284 | 
	a1 = xmem[_main_nChannels + 0]			# LN: 284 | 
	a0 - a1			# LN: 284 | 
	if (a >= 0) jmp (for_end_5)			# LN: 284 | 
cline_284_0:			/* LN: 286 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 286 | 
	i0 = xmem[i0]			# LN: 286 | 
	call (_cl_wavread_recvsample)			# LN: 286 | 
	i0 = i7 - (0x20b)			# LN: 286 | 
	xmem[i0] = a0h			# LN: 286 | 
cline_286_0:			/* LN: 287 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 287 | 
	a0 = xmem[i0]			# LN: 287 | 
	a0 = a0 << 4			# LN: 287 | 
	i0 = a0			# LN: 287 | 
	i1 = i7 - (0x4)			# LN: 287 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 287 | 
	a0 = xmem[i1]			# LN: 287 | 
	a1 = i0			# LN: 287 | 
	a0 = a1 + a0			# LN: 287 | 
	AnyReg(i0, a0h)			# LN: 287 | 
	i1 = i7 - (0x20b)			# LN: 287 | 
	a0 = xmem[i1]			# LN: 287 | 
	ymem[i0] = a0h			# LN: 287 | 
cline_287_0:			/* LN: 284 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 288 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 284 | 
	a0 = xmem[i0]			# LN: 284 | 
	uhalfword(a1) = (0x1)			# LN: 284 | 
	a0 = a0 + a1			# LN: 284 | 
	i0 = i7 - (0x20a)			# LN: 284 | 
	xmem[i0] = a0h			# LN: 284 | 
	jmp (for_5)			# LN: 284 | 
cline_284_1:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 289 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 284 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 282 | 
	a0 = xmem[i0]			# LN: 282 | 
	uhalfword(a1) = (0x1)			# LN: 282 | 
	a0 = a0 + a1			# LN: 282 | 
	i0 = i7 - (0x4)			# LN: 282 | 
label_end_95:			# LN: 282 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 282 | 
cline_282_1:			/* LN: 290 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_enable + 0]			# LN: 290 | 
	a0 & a0			# LN: 290 | 
	if (a == 0) jmp (else_5)			# LN: 290 | 
cline_290_0:			/* LN: 291 | CYCLE: 0 | RULES: () */ 
	call (_processing)			# LN: 291 | 
	jmp (endif_5)			# LN: 291 | 
cline_291_0:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 290 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 290 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 293 | 
	a0 = 0			# LN: 293 | 
	xmem[i0] = a0h			# LN: 293 | 
	do (0x10), label_end_96			# LN: 293 | 
cline_293_0:			/* LN: 295 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 295 | 
	a0 = 0			# LN: 295 | 
	xmem[i0] = a0h			# LN: 295 | 
for_7:			/* LN: 295 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 295 | 
	a0 = xmem[i0]			# LN: 295 | 
	a1 = xmem[_main_nChannels + 0]			# LN: 295 | 
	a0 - a1			# LN: 295 | 
	if (a >= 0) jmp (for_end_7)			# LN: 295 | 
cline_295_0:			/* LN: 297 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 297 | 
	a0 = xmem[i0]			# LN: 297 | 
	a0 = a0 << 4			# LN: 297 | 
	i0 = a0			# LN: 297 | 
	i1 = i7 - (0x4)			# LN: 297 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 297 | 
	a0 = xmem[i1]			# LN: 297 | 
	a1 = i0			# LN: 297 | 
	a0 = a1 + a0			# LN: 297 | 
	AnyReg(i0, a0h)			# LN: 297 | 
	i1 = i7 - (0x20b)			# LN: 297 | 
	a0 = ymem[i0]			# LN: 297 | 
	xmem[i1] = a0h			# LN: 297 | 
cline_297_0:			/* LN: 298 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 298 | 
	i1 = i7 - (0x20b)			# LN: 298 | 
	a0 = xmem[i1]			# LN: 298 | 
	i0 = xmem[i0]			# LN: 298 | 
	call (_cl_wavwrite_sendsample)			# LN: 298 | 
cline_298_0:			/* LN: 295 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 299 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 295 | 
	a0 = xmem[i0]			# LN: 295 | 
	uhalfword(a1) = (0x1)			# LN: 295 | 
	a0 = a0 + a1			# LN: 295 | 
	i0 = i7 - (0x20a)			# LN: 295 | 
	xmem[i0] = a0h			# LN: 295 | 
	jmp (for_7)			# LN: 295 | 
cline_295_1:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 300 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 295 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 293 | 
	a0 = xmem[i0]			# LN: 293 | 
	uhalfword(a1) = (0x1)			# LN: 293 | 
	a0 = a0 + a1			# LN: 293 | 
	i0 = i7 - (0x4)			# LN: 293 | 
label_end_96:			# LN: 293 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 293 | 
cline_293_1:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
init_latch_label_7:			/* LN: 301 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 280 | 
	a0 = xmem[i0]			# LN: 280 | 
	uhalfword(a1) = (0x1)			# LN: 280 | 
	a0 = a0 + a1			# LN: 280 | 
	i0 = i7 - (0x3)			# LN: 280 | 
	xmem[i0] = a0h			# LN: 280 | 
	jmp (for_3)			# LN: 280 | 
cline_280_1:			/* LN: 306 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 306 | 
	i0 = xmem[i0]			# LN: 306 | 
	call (_cl_wavread_close)			# LN: 306 | 
cline_306_0:			/* LN: 307 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 307 | 
	i0 = xmem[i0]			# LN: 307 | 
	call (_cl_wavwrite_close)			# LN: 307 | 
cline_307_0:			/* LN: 310 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 310 | 
	jmp (__epilogue_250)			# LN: 310 | 
cline_310_0:			/* LN: 311 | CYCLE: 0 | RULES: () */ 
__epilogue_250:			/* LN: 311 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20b)			# LN: 311 | 
	i7 -= 1			# LN: 311 | 
	ret			# LN: 311 | 



_processing:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 135 | 
	i7 += 1			# LN: 135 | 
	i7 = i7 + (0x1)			# LN: 135 | 
cline_135_0:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 0)			# LN: 140 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 140 | 
cline_140_0:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 149 | 
	a0 = 0			# LN: 149 | 
	xmem[i0] = a0h			# LN: 149 | 
	do (0x10), label_end_92			# LN: 149 | 
cline_149_0:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 152 | 
	i1 = (0) + (_z_xH)			# LN: 152 | 
	a0 = ymem[i0]			# LN: 152 | 
	i4 = (0) + (_z_yH)			# LN: 152 | 
	i0 = i1			# LN: 152 | 
	i1 = i4			# LN: 152 | 
	call (_shelvingHP)			# LN: 152 | 
	i0 = (0) + (_sb_ptr0)			# LN: 152 | 
	i0 = xmem[i0]			# LN: 152 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 152 | 
cline_152_0:			/* LN: 153 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 153 | 
	i1 = (0) + (_z_xL)			# LN: 153 | 
	a0 = ymem[i0]			# LN: 153 | 
	i4 = (0) + (_z_yL)			# LN: 153 | 
	i0 = i1			# LN: 153 | 
	i1 = i4			# LN: 153 | 
	call (_shelvingLP)			# LN: 153 | 
	i0 = (0) + (_sb_ptr0)			# LN: 153 | 
	i0 = xmem[i0]			# LN: 153 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 153 | 
cline_153_0:			/* LN: 154 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 154 | 
	nop #empty cycle
	i0 += 1			# LN: 154 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 154 | 
cline_154_0:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 149 | 
	a0 = xmem[i0]			# LN: 149 | 
	uhalfword(a1) = (0x1)			# LN: 149 | 
	a0 = a0 + a1			# LN: 149 | 
	i0 = i7 - (0x1)			# LN: 149 | 
label_end_92:			# LN: 149 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 149 | 
cline_149_1:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_248)			# LN: 182 | 
__epilogue_248:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 182 | 
	i7 -= 1			# LN: 182 | 
	ret			# LN: 182 | 



_shelvingHP:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 94 | 
	i7 += 1			# LN: 94 | 
	i7 = i7 + (0x6)			# LN: 94 | 
	i4 = i7 - (0x1)			# LN: 94 | 
	xmem[i4] = a0h			# LN: 94 | 
	i4 = i7 - (0x2)			# LN: 94 | 
	xmem[i4] = i0			# LN: 94 | 
	i0 = i7 - (0x3)			# LN: 94 | 
	xmem[i0] = i1			# LN: 94 | 
cline_94_0:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x2)			# LN: 99 | 
	i1 = xmem[i1]			# LN: 99 | 
	i4 = i7 - (0x3)			# LN: 99 | 
	i4 = xmem[i4]			# LN: 99 | 
	i5 = i7 - (0x1)			# LN: 99 | 
	a0 = xmem[i5]			# LN: 99 | 
	i0 = (0) + (_coeffH)			# LN: 99 | 
	call (_first_order_IIR)			# LN: 99 | 
	i0 = i7 - (0x4)			# LN: 99 | 
	xmem[i0] = a0			# LN: 99 | 
cline_99_0:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 101 | 
	a0 = xmem[i0]			# LN: 101 | 
	i0 = i7 - (0x4)			# LN: 101 | 
	a1 = xmem[i0]			# LN: 101 | 
	a0 = a0 - a1			# LN: 101 | 
	a0 = a0 >> 1			# LN: 101 | 
	i0 = i7 - (0x6)			# LN: 101 | 
	xmem[i0] = a0h; i0 += 1			# LN: 101, 101 | 
	xmem[i0] = a0l			# LN: 101 | 
cline_101_0:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 103 | 
	a0 = xmem[i0]			# LN: 103 | 
	i0 = i7 - (0x4)			# LN: 103 | 
	a1 = xmem[i0]			# LN: 103 | 
	x0 = xmem[_K2 + 0]			# LN: 103 | 
	i0 = i7 - (0x6)			# LN: 103 | 
	b0 = xmem[i0]; i0 += 1			# LN: 103, 103 | 
	a0 = a0 + a1			# LN: 103 | 
	b0l = xmem[i0]			# LN: 103 | 
	x1 = a0h; a0 =+ b0			# LN: 103, 103 | 
	a0 += x1 * x0			# LN: 103 | 
	i0 = i7 - (0x6)			# LN: 103 | 
	xmem[i0] = a0h; i0 += 1			# LN: 103, 103 | 
	xmem[i0] = a0l			# LN: 103 | 
cline_103_0:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 106 | 
	call (_clip)			# LN: 106 | 
cline_106_0:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 110 | 
	a0 = xmem[i0]; i0 += 1			# LN: 110, 110 | 
	a0l = xmem[i0]			# LN: 110 | 
	a0 = a0			# LN: 110 | 
	jmp (__epilogue_244)			# LN: 110 | 
cline_110_0:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
__epilogue_244:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x6)			# LN: 112 | 
	i7 -= 1			# LN: 112 | 
	ret			# LN: 112 | 



_shelvingLP:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 79 | 
	i7 += 1			# LN: 79 | 
	i7 = i7 + (0x6)			# LN: 79 | 
	i4 = i7 - (0x1)			# LN: 79 | 
	xmem[i4] = a0h			# LN: 79 | 
	i4 = i7 - (0x2)			# LN: 79 | 
	xmem[i4] = i0			# LN: 79 | 
	i0 = i7 - (0x3)			# LN: 79 | 
	xmem[i0] = i1			# LN: 79 | 
cline_79_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x2)			# LN: 84 | 
	i1 = xmem[i1]			# LN: 84 | 
	i4 = i7 - (0x3)			# LN: 84 | 
	i4 = xmem[i4]			# LN: 84 | 
	i5 = i7 - (0x1)			# LN: 84 | 
	a0 = xmem[i5]			# LN: 84 | 
	i0 = (0) + (_coeffL)			# LN: 84 | 
	call (_first_order_IIR)			# LN: 84 | 
	i0 = i7 - (0x4)			# LN: 84 | 
	xmem[i0] = a0			# LN: 84 | 
cline_84_0:			/* LN: 85 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 85 | 
	a0 = xmem[i0]			# LN: 85 | 
	i0 = i7 - (0x4)			# LN: 85 | 
	a1 = xmem[i0]			# LN: 85 | 
	a0 = a0 + a1			# LN: 85 | 
	a0 = a0 >> 1			# LN: 85 | 
	i0 = i7 - (0x6)			# LN: 85 | 
	xmem[i0] = a0h; i0 += 1			# LN: 85, 85 | 
	xmem[i0] = a0l			# LN: 85 | 
cline_85_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 86 | 
	a0 = xmem[i0]			# LN: 86 | 
	i0 = i7 - (0x4)			# LN: 86 | 
	a1 = xmem[i0]			# LN: 86 | 
	x0 = xmem[_K1 + 0]			# LN: 86 | 
	i0 = i7 - (0x6)			# LN: 86 | 
	b0 = xmem[i0]; i0 += 1			# LN: 86, 86 | 
	a0 = a0 - a1			# LN: 86 | 
	b0l = xmem[i0]			# LN: 86 | 
	x1 = a0h; a0 =+ b0			# LN: 86, 86 | 
	a0 += x1 * x0			# LN: 86 | 
	i0 = i7 - (0x6)			# LN: 86 | 
	xmem[i0] = a0h; i0 += 1			# LN: 86, 86 | 
	xmem[i0] = a0l			# LN: 86 | 
cline_86_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 87 | 
	call (_clip)			# LN: 87 | 
cline_87_0:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 90 | 
	a0 = xmem[i0]; i0 += 1			# LN: 90, 90 | 
	a0l = xmem[i0]			# LN: 90 | 
	a0 = a0			# LN: 90 | 
	jmp (__epilogue_242)			# LN: 90 | 
cline_90_0:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
__epilogue_242:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x6)			# LN: 92 | 
	i7 -= 1			# LN: 92 | 
	ret			# LN: 92 | 
