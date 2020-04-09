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
	.extern _first_order_IIR
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
_nChannels
	.bss (0x1)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_sb_ptr0
	.bss (0x1)
	.xdata_ovly
_sb_ptr1
	.bss (0x1)
	.xdata_ovly
_sb_ptr2
	.bss (0x1)
	.xdata_ovly
_sb_ptr3
	.bss (0x1)
	.xdata_ovly
_sb_ptr4
	.bss (0x1)
	.xdata_ovly
_sb_ptr5
	.bss (0x1)
	.xdata_ovly
_sb_ptr6
	.bss (0x1)
	.xdata_ovly
_sb_ptr7
	.bss (0x1)
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
	.ydata_ovly
_z_yH
	.bss (0x10)
	.ydata_ovly
_z_yL
	.bss (0x10)
	.code_ovly



_calculateShelvingCoeff:			/* LN: 143 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 143 | 
	i7 += 1			# LN: 143 | 
	i7 = i7 + (0x4)			# LN: 143 | 
	i1 = i7 - (0x1)			# LN: 143 | 
	xmem[i1] = a0h			# LN: 143 | 
	i1 = i7 - (0x2)			# LN: 143 | 
	xmem[i1] = i0			# LN: 143 | 
cline_143_0:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 147 | 
	a0 = xmem[i0]			# LN: 147 | 
	i0 = i7 - (0x3)			# LN: 147 | 
	xmem[i0] = a0h			# LN: 147 | 
cline_147_0:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 148 | 
	call (_clip)			# LN: 148 | 
cline_148_0:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 150 | 
	a0 = xmem[i0]			# LN: 150 | 
	a0 =- a0			# LN: 150 | 
	i0 = i7 - (0x4)			# LN: 150 | 
	xmem[i0] = a0h			# LN: 150 | 
cline_150_0:			/* LN: 151 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 151 | 
	call (_clip)			# LN: 151 | 
cline_151_0:			/* LN: 153 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 153 | 
	i1 = i7 - (0x2)			# LN: 153 | 
	i1 = xmem[i1]			# LN: 153 | 
	a0 = xmem[i0]			# LN: 153 | 
	xmem[i1] = a0h			# LN: 153 | 
cline_153_0:			/* LN: 155 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 155 | 
	i0 = xmem[i0]			# LN: 155 | 
	a0 = xmem[_test_n + 0]			# LN: 155 | 
	i0 += 1			# LN: 155 | 
	xmem[i0] = a0h			# LN: 155 | 
cline_155_0:			/* LN: 156 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 156 | 
	i0 = xmem[i0]			# LN: 156 | 
	a0 = xmem[_test_p + 0]			# LN: 156 | 
	i0 += 2			# LN: 156 | 
	xmem[i0] = a0h			# LN: 156 | 
cline_156_0:			/* LN: 157 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 157 | 
	i0 = xmem[i0]			# LN: 157 | 
	i1 = i7 - (0x4)			# LN: 157 | 
	i0 = i0 + (0x3)			# LN: 157 | 
	a0 = xmem[i1]			# LN: 157 | 
	xmem[i0] = a0h			# LN: 157 | 
cline_157_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_246)			# LN: 159 | 
__epilogue_246:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x4)			# LN: 159 | 
	i7 -= 1			# LN: 159 | 
	ret			# LN: 159 | 



_clip:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 49 | 
	i7 += 1			# LN: 49 | 
	i7 = i7 + (0x1)			# LN: 49 | 
	i1 = i7 - (0x1)			# LN: 49 | 
	xmem[i1] = i0			# LN: 49 | 
cline_49_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 53 | 
	i0 = xmem[i0]			# LN: 53 | 
	a0 = xmem[_test_p + 0]			# LN: 53 | 
	a1 = xmem[i0]; i0 += 1			# LN: 53, 53 | 
	a1l = xmem[i0]			# LN: 53 | 
	a0 = a1 - a0			# LN: 53 | 
	if (a <= 0) jmp (else_0)			# LN: 53 | 
cline_53_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 56 | 
	i0 = xmem[i0]			# LN: 56 | 
	a0 = xmem[_test_p + 0]			# LN: 56 | 
#asm begin
	xmem[i0]=a0 
	
#asm end			# LN: 56 | 
	i1 = i7 - (0x1)			# LN: 56 | 
	xmem[i1] = i0			# LN: 56 | 
	xmem[_test_p + 0] = a0h			# LN: 56 | 
	jmp (endif_0)			# LN: 56 | 
cline_56_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 59 | 
	i0 = xmem[i0]			# LN: 59 | 
	a0 = xmem[_test_n + 0]			# LN: 59 | 
	a1 = xmem[i0]; i0 += 1			# LN: 59, 59 | 
	a1l = xmem[i0]			# LN: 59 | 
	a0 = a1 - a0			# LN: 59 | 
	if (a >= 0) jmp (else_1)			# LN: 59 | 
cline_59_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 61 | 
	i0 = xmem[i0]			# LN: 61 | 
	a0 = xmem[_test_n + 0]			# LN: 61 | 
#asm begin
	xmem[i0]=a0 
	
#asm end			# LN: 61 | 
	i1 = i7 - (0x1)			# LN: 61 | 
	xmem[i1] = i0			# LN: 61 | 
	xmem[_test_n + 0] = a0h			# LN: 61 | 
	jmp (endif_1)			# LN: 61 | 
cline_61_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_240)			# LN: 64 | 
__epilogue_240:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 64 | 
	i7 -= 1			# LN: 64 | 
	ret			# LN: 64 | 



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

_main:			/* LN: 349 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 349 | 
	i7 += 1			# LN: 349 | 
	i7 = i7 + (0x20b)			# LN: 349 | 
	i1 = i7 - (0x1)			# LN: 349 | 
	xmem[i1] = a0h			# LN: 349 | 
	i1 = i7 - (0x2)			# LN: 349 | 
	xmem[i1] = i0			# LN: 349 | 
cline_349_0:			/* LN: 364 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 364 | 
	a0 = 0			# LN: 364 | 
	xmem[i0] = a0h			# LN: 364 | 
	do (0x8), label_end_94			# LN: 364 | 
cline_364_0:			/* LN: 365 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 364 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 365 | 
	a0 = xmem[i0]; a1 = 0			# LN: 365, 365 | 
	a0 = a0 << 1			# LN: 365 | 
	i0 = a0			# LN: 365 | 
	nop #empty cycle
	i0 = i0 + (_z_xH + 0)			# LN: 365 | 
	xmem[i0] = a1h			# LN: 365 | 
cline_365_0:			/* LN: 366 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 366 | 
	a0 = xmem[i0]; a1 = 0			# LN: 366, 366 | 
	a0 = a0 << 1			# LN: 366 | 
	i0 = a0			# LN: 366 | 
	nop #empty cycle
	i0 = i0 + (_z_xH + 0)			# LN: 366 | 
	i0 += 1			# LN: 366 | 
	xmem[i0] = a1h			# LN: 366 | 
cline_366_0:			/* LN: 368 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 368 | 
	a0 = xmem[i0]; a1 = 0			# LN: 368, 368 | 
	a0 = a0 << 1			# LN: 368 | 
	i0 = a0			# LN: 368 | 
	nop #empty cycle
	i0 = i0 + (_z_yH + 0)			# LN: 368 | 
	ymem[i0] = a1h			# LN: 368 | 
cline_368_0:			/* LN: 369 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 369 | 
	a0 = xmem[i0]; a1 = 0			# LN: 369, 369 | 
	a0 = a0 << 1			# LN: 369 | 
	i0 = a0			# LN: 369 | 
	nop #empty cycle
	i0 = i0 + (_z_yH + 0)			# LN: 369 | 
	i0 += 1			# LN: 369 | 
	ymem[i0] = a1h			# LN: 369 | 
cline_369_0:			/* LN: 372 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 372 | 
	a0 = xmem[i0]; a1 = 0			# LN: 372, 372 | 
	a0 = a0 << 1			# LN: 372 | 
	i0 = a0			# LN: 372 | 
	nop #empty cycle
	i0 = i0 + (_z_xL + 0)			# LN: 372 | 
	xmem[i0] = a1h			# LN: 372 | 
cline_372_0:			/* LN: 373 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 373 | 
	a0 = xmem[i0]; a1 = 0			# LN: 373, 373 | 
	a0 = a0 << 1			# LN: 373 | 
	i0 = a0			# LN: 373 | 
	nop #empty cycle
	i0 = i0 + (_z_xL + 0)			# LN: 373 | 
	i0 += 1			# LN: 373 | 
	xmem[i0] = a1h			# LN: 373 | 
cline_373_0:			/* LN: 375 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 375 | 
	a0 = xmem[i0]; a1 = 0			# LN: 375, 375 | 
	a0 = a0 << 1			# LN: 375 | 
	i0 = a0			# LN: 375 | 
	nop #empty cycle
	i0 = i0 + (_z_yL + 0)			# LN: 375 | 
	ymem[i0] = a1h			# LN: 375 | 
cline_375_0:			/* LN: 376 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 376 | 
	a0 = xmem[i0]; a1 = 0			# LN: 376, 376 | 
	a0 = a0 << 1			# LN: 376 | 
	i0 = a0			# LN: 376 | 
	nop #empty cycle
	i0 = i0 + (_z_yL + 0)			# LN: 376 | 
	i0 += 1			# LN: 376 | 
	ymem[i0] = a1h			# LN: 376 | 
cline_376_0:			/* LN: 381 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 381 | 
	a0 = 0			# LN: 381 | 
	xmem[i0] = a0h			# LN: 381 | 
	do (0x10), label_end_93			# LN: 381 | 
cline_381_0:			/* LN: 383 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 381 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 383 | 
	a0 = xmem[i0]; a1 = 0			# LN: 383, 383 | 
	a0 = a0 << 4			# LN: 383 | 
	i0 = a0			# LN: 383 | 
	i1 = i7 - (0x4)			# LN: 383 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 383 | 
	a0 = xmem[i1]			# LN: 383 | 
	b0 = i0			# LN: 383 | 
	a0 = a0 + b0			# LN: 383 | 
	AnyReg(i0, a0h)			# LN: 383 | 
	nop #empty cycle
	ymem[i0] = a1h			# LN: 383 | 
cline_383_0:			/* LN: 381 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 385 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 381 | 
	a0 = xmem[i0]			# LN: 381 | 
	uhalfword(a1) = (0x1)			# LN: 381 | 
	a0 = a0 + a1			# LN: 381 | 
	i0 = i7 - (0x4)			# LN: 381 | 
label_end_93:			# LN: 381 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 381 | 
cline_381_1:			/* LN: 364 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 387 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 381 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 364 | 
	a0 = xmem[i0]			# LN: 364 | 
	uhalfword(a1) = (0x1)			# LN: 364 | 
	a0 = a0 + a1			# LN: 364 | 
	i0 = i7 - (0x3)			# LN: 364 | 
label_end_94:			# LN: 364 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 364 | 
cline_364_1:			/* LN: 389 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 364 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 389 | 
	i0 = xmem[i0]			# LN: 389 | 
	i1 = (0) + (_string_const_0)			# LN: 389 | 
	i0 += 2			# LN: 389 | 
	i0 = xmem[i0]			# LN: 389 | 
	call (_strcmp)			# LN: 389 | 
	a0 & a0			# LN: 389 | 
	if (a == 0) jmp (else_9)			# LN: 389 | 
cline_389_0:			/* LN: 390 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 390 | 
	xmem[_enable + 0] = a0h			# LN: 390 | 
	jmp (endif_9)			# LN: 390 | 
cline_390_0:			/* LN: 393 | CYCLE: 0 | RULES: () */ 
else_9:			/* LN: 389 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 393 | 
	xmem[_enable + 0] = a0h			# LN: 393 | 
cline_393_0:			/* LN: 399 | CYCLE: 0 | RULES: () */ 
endif_9:			/* LN: 389 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 399 | 
	i0 = xmem[i0]			# LN: 399 | 
	i1 = i7 - (260 - 0)			# LN: 399 | 
	i4 = xmem[i0]			# LN: 399 | 
	i0 = i1			# LN: 399 | 
	i1 = i4			# LN: 399 | 
	call (_strcpy)			# LN: 399 | 
cline_399_0:			/* LN: 400 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (260 - 0)			# LN: 400 | 
	call (_cl_wavread_open)			# LN: 400 | 
	AnyReg(i0, a0h)			# LN: 400 | 
	i1 = i7 - (0x105)			# LN: 400 | 
	xmem[i1] = i0			# LN: 400 | 
cline_400_0:			/* LN: 401 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 401 | 
	a0 = xmem[i0]			# LN: 401 | 
	a0 & a0			# LN: 401 | 
	if (a != 0) jmp (else_10)			# LN: 401 | 
cline_401_0:			/* LN: 403 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 403 | 
	call (_printf)			# LN: 403 | 
cline_403_0:			/* LN: 404 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 404 | 
	jmp (__epilogue_250)			# LN: 404 | 
cline_404_0:			/* LN: 410 | CYCLE: 0 | RULES: () */ 
endif_10:			/* LN: 401 | CYCLE: 0 | RULES: () */ 
else_10:			/* LN: 401 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 410 | 
	i0 = xmem[i0]			# LN: 410 | 
	call (_cl_wavread_getnchannels)			# LN: 410 | 
	xmem[_nChannels + 0] = a0h			# LN: 410 | 
cline_410_0:			/* LN: 411 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 411 | 
	i0 = xmem[i0]			# LN: 411 | 
	call (_cl_wavread_bits_per_sample)			# LN: 411 | 
	i0 = i7 - (0x106)			# LN: 411 | 
	xmem[i0] = a0h			# LN: 411 | 
cline_411_0:			/* LN: 412 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 412 | 
	i0 = xmem[i0]			# LN: 412 | 
	call (_cl_wavread_frame_rate)			# LN: 412 | 
	i0 = i7 - (0x107)			# LN: 412 | 
	xmem[i0] = a0h			# LN: 412 | 
cline_412_0:			/* LN: 413 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 413 | 
	i0 = xmem[i0]			# LN: 413 | 
	call (_cl_wavread_number_of_frames)			# LN: 413 | 
	i0 = i7 - (0x108)			# LN: 413 | 
	xmem[i0] = a0h			# LN: 413 | 
cline_413_0:			/* LN: 418 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 418 | 
	i0 = xmem[i0]			# LN: 418 | 
	i1 = i7 - (520 - 0)			# LN: 418 | 
	i0 += 1			# LN: 418 | 
	i4 = xmem[i0]			# LN: 418 | 
	i0 = i1			# LN: 418 | 
	i1 = i4			# LN: 418 | 
	call (_strcpy)			# LN: 418 | 
cline_418_0:			/* LN: 419 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (520 - 0)			# LN: 419 | 
	i1 = i7 - (0x106)			# LN: 419 | 
	a0 = xmem[i1]			# LN: 419 | 
	a1 = xmem[_nChannels + 0]			# LN: 419 | 
	i1 = i7 - (0x107)			# LN: 419 | 
	b0 = xmem[i1]			# LN: 419 | 
	call (_cl_wavwrite_open)			# LN: 419 | 
	AnyReg(i0, a0h)			# LN: 419 | 
	i1 = i7 - (0x209)			# LN: 419 | 
	xmem[i1] = i0			# LN: 419 | 
cline_419_0:			/* LN: 420 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 420 | 
	a0 = xmem[i0]			# LN: 420 | 
	a0 & a0			# LN: 420 | 
	if (a != 0) jmp (else_11)			# LN: 420 | 
cline_420_0:			/* LN: 422 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_2)			# LN: 422 | 
	call (_printf)			# LN: 422 | 
cline_422_0:			/* LN: 423 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 423 | 
	jmp (__epilogue_250)			# LN: 423 | 
cline_423_0:			/* LN: 426 | CYCLE: 0 | RULES: () */ 
endif_11:			/* LN: 420 | CYCLE: 0 | RULES: () */ 
else_11:			/* LN: 420 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 426 | 
	xmem[_K1 + 0] = a0h			# LN: 426 | 
cline_426_0:			/* LN: 427 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 427 | 
	xmem[_K2 + 0] = a0h			# LN: 427 | 
cline_427_0:			/* LN: 428 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_K1 + 0]			# LN: 428 | 
	a0 = a0 >> 1			# LN: 428 | 
	xmem[_K1 + 0] = a0h			# LN: 428 | 
cline_428_0:			/* LN: 429 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_K2 + 0]			# LN: 429 | 
	a0 = a0 >> 1			# LN: 429 | 
	xmem[_K2 + 0] = a0h			# LN: 429 | 
cline_429_0:			/* LN: 432 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 432 | 
	xmem[_alpha1 + 0] = a0h			# LN: 432 | 
cline_432_0:			/* LN: 433 | CYCLE: 0 | RULES: () */ 
	a0 = (0xc000)			# LN: 433 | 
	xmem[_alpha2 + 0] = a0h			# LN: 433 | 
cline_433_0:			/* LN: 434 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_alpha1 + 0]			# LN: 434 | 
	i0 = (0) + (_coeffL)			# LN: 434 | 
	call (_calculateShelvingCoeff)			# LN: 434 | 
cline_434_0:			/* LN: 435 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_alpha2 + 0]			# LN: 435 | 
	i0 = (0) + (_coeffH)			# LN: 435 | 
	call (_calculateShelvingCoeff)			# LN: 435 | 
cline_435_0:			/* LN: 444 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x108)			# LN: 444 | 
	a0 = xmem[i0]			# LN: 444 | 
	uhalfword(a1) = (0x10)			# LN: 444 | 
	call (__div)			# LN: 444 | 
	xmem[_main_h + 0] = a0h			# LN: 444 | 
cline_444_0:			/* LN: 446 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 446 | 
	a0 = 0			# LN: 446 | 
	xmem[i0] = a0h			# LN: 446 | 
for_3:			/* LN: 446 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 446 | 
	a0 = xmem[i0]			# LN: 446 | 
	a1 = xmem[_main_h + 0]			# LN: 446 | 
	a0 - a1			# LN: 446 | 
	if (a >= 0) jmp (for_end_3)			# LN: 446 | 
cline_446_0:			/* LN: 448 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 448 | 
	a0 = 0			# LN: 448 | 
	xmem[i0] = a0h			# LN: 448 | 
	do (0x10), label_end_95			# LN: 448 | 
cline_448_0:			/* LN: 450 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 448 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 450 | 
	a0 = 0			# LN: 450 | 
	xmem[i0] = a0h			# LN: 450 | 
for_5:			/* LN: 450 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 450 | 
	a0 = xmem[i0]			# LN: 450 | 
	a1 = xmem[_nChannels + 0]			# LN: 450 | 
	a0 - a1			# LN: 450 | 
	if (a >= 0) jmp (for_end_5)			# LN: 450 | 
cline_450_0:			/* LN: 452 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 452 | 
	i0 = xmem[i0]			# LN: 452 | 
	call (_cl_wavread_recvsample)			# LN: 452 | 
	i0 = i7 - (0x20b)			# LN: 452 | 
	xmem[i0] = a0h			# LN: 452 | 
cline_452_0:			/* LN: 453 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 453 | 
	a0 = xmem[i0]			# LN: 453 | 
	a0 = a0 << 4			# LN: 453 | 
	i0 = a0			# LN: 453 | 
	i1 = i7 - (0x4)			# LN: 453 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 453 | 
	a0 = xmem[i1]			# LN: 453 | 
	a1 = i0			# LN: 453 | 
	a0 = a1 + a0			# LN: 453 | 
	AnyReg(i0, a0h)			# LN: 453 | 
	i1 = i7 - (0x20b)			# LN: 453 | 
	a0 = xmem[i1]			# LN: 453 | 
	ymem[i0] = a0h			# LN: 453 | 
cline_453_0:			/* LN: 450 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 454 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 450 | 
	a0 = xmem[i0]			# LN: 450 | 
	uhalfword(a1) = (0x1)			# LN: 450 | 
	a0 = a0 + a1			# LN: 450 | 
	i0 = i7 - (0x20a)			# LN: 450 | 
	xmem[i0] = a0h			# LN: 450 | 
	jmp (for_5)			# LN: 450 | 
cline_450_1:			/* LN: 448 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 455 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 450 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 448 | 
	a0 = xmem[i0]			# LN: 448 | 
	uhalfword(a1) = (0x1)			# LN: 448 | 
	a0 = a0 + a1			# LN: 448 | 
	i0 = i7 - (0x4)			# LN: 448 | 
label_end_95:			# LN: 448 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 448 | 
cline_448_1:			/* LN: 456 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 448 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_enable + 0]			# LN: 456 | 
	a0 & a0			# LN: 456 | 
	if (a == 0) jmp (else_12)			# LN: 456 | 
cline_456_0:			/* LN: 457 | CYCLE: 0 | RULES: () */ 
	call (_processing)			# LN: 457 | 
	jmp (endif_12)			# LN: 457 | 
cline_457_0:			/* LN: 459 | CYCLE: 0 | RULES: () */ 
endif_12:			/* LN: 456 | CYCLE: 0 | RULES: () */ 
else_12:			/* LN: 456 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 459 | 
	a0 = 0			# LN: 459 | 
	xmem[i0] = a0h			# LN: 459 | 
	do (0x10), label_end_96			# LN: 459 | 
cline_459_0:			/* LN: 461 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 459 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 461 | 
	a0 = 0			# LN: 461 | 
	xmem[i0] = a0h			# LN: 461 | 
for_7:			/* LN: 461 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 461 | 
	a0 = xmem[i0]			# LN: 461 | 
	a1 = xmem[_nChannels + 0]			# LN: 461 | 
	a0 - a1			# LN: 461 | 
	if (a >= 0) jmp (for_end_7)			# LN: 461 | 
cline_461_0:			/* LN: 463 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 463 | 
	a0 = xmem[i0]			# LN: 463 | 
	a0 = a0 << 4			# LN: 463 | 
	i0 = a0			# LN: 463 | 
	i1 = i7 - (0x4)			# LN: 463 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 463 | 
	a0 = xmem[i1]			# LN: 463 | 
	a1 = i0			# LN: 463 | 
	a0 = a1 + a0			# LN: 463 | 
	AnyReg(i0, a0h)			# LN: 463 | 
	i1 = i7 - (0x20b)			# LN: 463 | 
	a0 = ymem[i0]			# LN: 463 | 
	xmem[i1] = a0h			# LN: 463 | 
cline_463_0:			/* LN: 464 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 464 | 
	i1 = i7 - (0x20b)			# LN: 464 | 
	a0 = xmem[i1]			# LN: 464 | 
	i0 = xmem[i0]			# LN: 464 | 
	call (_cl_wavwrite_sendsample)			# LN: 464 | 
cline_464_0:			/* LN: 461 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 465 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 461 | 
	a0 = xmem[i0]			# LN: 461 | 
	uhalfword(a1) = (0x1)			# LN: 461 | 
	a0 = a0 + a1			# LN: 461 | 
	i0 = i7 - (0x20a)			# LN: 461 | 
	xmem[i0] = a0h			# LN: 461 | 
	jmp (for_7)			# LN: 461 | 
cline_461_1:			/* LN: 459 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 466 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 461 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 459 | 
	a0 = xmem[i0]			# LN: 459 | 
	uhalfword(a1) = (0x1)			# LN: 459 | 
	a0 = a0 + a1			# LN: 459 | 
	i0 = i7 - (0x4)			# LN: 459 | 
label_end_96:			# LN: 459 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 459 | 
cline_459_1:			/* LN: 446 | CYCLE: 0 | RULES: () */ 
init_latch_label_7:			/* LN: 467 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 459 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 446 | 
	a0 = xmem[i0]			# LN: 446 | 
	uhalfword(a1) = (0x1)			# LN: 446 | 
	a0 = a0 + a1			# LN: 446 | 
	i0 = i7 - (0x3)			# LN: 446 | 
	xmem[i0] = a0h			# LN: 446 | 
	jmp (for_3)			# LN: 446 | 
cline_446_1:			/* LN: 472 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 446 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 472 | 
	i0 = xmem[i0]			# LN: 472 | 
	call (_cl_wavread_close)			# LN: 472 | 
cline_472_0:			/* LN: 473 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 473 | 
	i0 = xmem[i0]			# LN: 473 | 
	call (_cl_wavwrite_close)			# LN: 473 | 
cline_473_0:			/* LN: 476 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 476 | 
	jmp (__epilogue_250)			# LN: 476 | 
cline_476_0:			/* LN: 477 | CYCLE: 0 | RULES: () */ 
__epilogue_250:			/* LN: 477 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20b)			# LN: 477 | 
	i7 -= 1			# LN: 477 | 
	ret			# LN: 477 | 



_processing:			/* LN: 161 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 161 | 
	i7 += 1			# LN: 161 | 
	xmem[i7] = i2; i7 += 1			# LN: 161, 161 | 
	i7 = i7 + (0x1)			# LN: 161 | 
cline_161_0:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 0)			# LN: 165 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 165 | 
cline_165_0:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 16)			# LN: 166 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 166 | 
cline_166_0:			/* LN: 167 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 32)			# LN: 167 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 167 | 
cline_167_0:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 48)			# LN: 168 | 
	xmem[_sb_ptr3 + 0] = i0			# LN: 168 | 
cline_168_0:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 64)			# LN: 169 | 
	xmem[_sb_ptr4 + 0] = i0			# LN: 169 | 
cline_169_0:			/* LN: 170 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 80)			# LN: 170 | 
	xmem[_sb_ptr5 + 0] = i0			# LN: 170 | 
cline_170_0:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 96)			# LN: 171 | 
	xmem[_sb_ptr6 + 0] = i0			# LN: 171 | 
cline_171_0:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 112)			# LN: 172 | 
	xmem[_sb_ptr7 + 0] = i0			# LN: 172 | 
cline_172_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 174 | 
	a0 = 0			# LN: 174 | 
	xmem[i0] = a0h			# LN: 174 | 
	do (0x10), label_end_92			# LN: 174 | 
cline_174_0:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 176 | 
	uhalfword(a1) = (0x1)			# LN: 176 | 
	a0 - a1			# LN: 176 | 
	if (a != 0) jmp (else_2)			# LN: 176 | 
cline_176_0:			/* LN: 178 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 178 | 
	i1 = (0) + (_z_xH)			# LN: 178 | 
	a0 = ymem[i0]			# LN: 178 | 
	i4 = (0) + (_z_yH)			# LN: 178 | 
	i0 = i1			# LN: 178 | 
	i1 = i4			# LN: 178 | 
	call (_shelvingHP)			# LN: 178 | 
	i0 = (0) + (_sb_ptr0)			# LN: 178 | 
	i0 = xmem[i0]			# LN: 178 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 178 | 
cline_178_0:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 179 | 
	i1 = (0) + (_z_xL)			# LN: 179 | 
	a0 = ymem[i0]			# LN: 179 | 
	i4 = (0) + (_z_yL)			# LN: 179 | 
	i0 = i1			# LN: 179 | 
	i1 = i4			# LN: 179 | 
	call (_shelvingLP)			# LN: 179 | 
	i0 = (0) + (_sb_ptr0)			# LN: 179 | 
	i0 = xmem[i0]			# LN: 179 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 179 | 
cline_179_0:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 180 | 
	nop #empty cycle
	i0 += 1			# LN: 180 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 180 | 
	jmp (endif_2)			# LN: 180 | 
cline_180_0:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 182 | 
	uhalfword(a1) = (0x2)			# LN: 182 | 
	a0 - a1			# LN: 182 | 
	if (a != 0) jmp (else_3)			# LN: 182 | 
cline_182_0:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 184 | 
	i1 = (0) + (_z_xH)			# LN: 184 | 
	a0 = ymem[i0]			# LN: 184 | 
	i4 = (0) + (_z_yH)			# LN: 184 | 
	i0 = i1			# LN: 184 | 
	i1 = i4			# LN: 184 | 
	call (_shelvingHP)			# LN: 184 | 
	i0 = (0) + (_sb_ptr0)			# LN: 184 | 
	i0 = xmem[i0]			# LN: 184 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 184 | 
cline_184_0:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 185 | 
	i1 = (0) + (_z_xL)			# LN: 185 | 
	a0 = ymem[i0]			# LN: 185 | 
	i4 = (0) + (_z_yL)			# LN: 185 | 
	i0 = i1			# LN: 185 | 
	i1 = i4			# LN: 185 | 
	call (_shelvingLP)			# LN: 185 | 
	i0 = (0) + (_sb_ptr0)			# LN: 185 | 
	i0 = xmem[i0]			# LN: 185 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 185 | 
cline_185_0:			/* LN: 186 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 186 | 
	nop #empty cycle
	i0 += 1			# LN: 186 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 186 | 
cline_186_0:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 188 | 
	i1 = (0) + (_z_xH + 2)			# LN: 188 | 
	a0 = ymem[i0]			# LN: 188 | 
	i4 = (0) + (_z_yH + 2)			# LN: 188 | 
	i0 = i1			# LN: 188 | 
	i1 = i4			# LN: 188 | 
	call (_shelvingHP)			# LN: 188 | 
	i0 = (0) + (_sb_ptr1)			# LN: 188 | 
	i0 = xmem[i0]			# LN: 188 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 188 | 
cline_188_0:			/* LN: 189 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 189 | 
	i1 = (0) + (_z_xL + 2)			# LN: 189 | 
	a0 = ymem[i0]			# LN: 189 | 
	i4 = (0) + (_z_yL + 2)			# LN: 189 | 
	i0 = i1			# LN: 189 | 
	i1 = i4			# LN: 189 | 
	call (_shelvingLP)			# LN: 189 | 
	i0 = (0) + (_sb_ptr1)			# LN: 189 | 
	i0 = xmem[i0]			# LN: 189 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 189 | 
cline_189_0:			/* LN: 190 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 190 | 
	nop #empty cycle
	i0 += 1			# LN: 190 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 190 | 
	jmp (endif_3)			# LN: 190 | 
cline_190_0:			/* LN: 193 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 193 | 
	uhalfword(a1) = (0x3)			# LN: 193 | 
	a0 - a1			# LN: 193 | 
	if (a != 0) jmp (else_4)			# LN: 193 | 
cline_193_0:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 195 | 
	i1 = (0) + (_z_xH)			# LN: 195 | 
	a0 = ymem[i0]			# LN: 195 | 
	i4 = (0) + (_z_yH)			# LN: 195 | 
	i0 = i1			# LN: 195 | 
	i1 = i4			# LN: 195 | 
	call (_shelvingHP)			# LN: 195 | 
	i0 = (0) + (_sb_ptr0)			# LN: 195 | 
	i0 = xmem[i0]			# LN: 195 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 195 | 
cline_195_0:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 196 | 
	i1 = (0) + (_z_xL)			# LN: 196 | 
	a0 = ymem[i0]			# LN: 196 | 
	i4 = (0) + (_z_yL)			# LN: 196 | 
	i0 = i1			# LN: 196 | 
	i1 = i4			# LN: 196 | 
	call (_shelvingLP)			# LN: 196 | 
	i0 = (0) + (_sb_ptr0)			# LN: 196 | 
	i0 = xmem[i0]			# LN: 196 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 196 | 
cline_196_0:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 197 | 
	nop #empty cycle
	i0 += 1			# LN: 197 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 197 | 
cline_197_0:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 199 | 
	i1 = (0) + (_z_xH + 2)			# LN: 199 | 
	a0 = ymem[i0]			# LN: 199 | 
	i4 = (0) + (_z_yH + 2)			# LN: 199 | 
	i0 = i1			# LN: 199 | 
	i1 = i4			# LN: 199 | 
	call (_shelvingHP)			# LN: 199 | 
	i0 = (0) + (_sb_ptr1)			# LN: 199 | 
	i0 = xmem[i0]			# LN: 199 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 199 | 
cline_199_0:			/* LN: 200 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 200 | 
	i1 = (0) + (_z_xL + 2)			# LN: 200 | 
	a0 = ymem[i0]			# LN: 200 | 
	i4 = (0) + (_z_yL + 2)			# LN: 200 | 
	i0 = i1			# LN: 200 | 
	i1 = i4			# LN: 200 | 
	call (_shelvingLP)			# LN: 200 | 
	i0 = (0) + (_sb_ptr1)			# LN: 200 | 
	i0 = xmem[i0]			# LN: 200 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 200 | 
cline_200_0:			/* LN: 201 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 201 | 
	nop #empty cycle
	i0 += 1			# LN: 201 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 201 | 
cline_201_0:			/* LN: 203 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 203 | 
	i1 = (0) + (_z_xH + 4)			# LN: 203 | 
	a0 = ymem[i0]			# LN: 203 | 
	i4 = (0) + (_z_yH + 4)			# LN: 203 | 
	i0 = i1			# LN: 203 | 
	i1 = i4			# LN: 203 | 
	call (_shelvingHP)			# LN: 203 | 
	i0 = (0) + (_sb_ptr2)			# LN: 203 | 
	i0 = xmem[i0]			# LN: 203 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 203 | 
cline_203_0:			/* LN: 204 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 204 | 
	i1 = (0) + (_z_xL + 4)			# LN: 204 | 
	a0 = ymem[i0]			# LN: 204 | 
	i4 = (0) + (_z_yL + 4)			# LN: 204 | 
	i0 = i1			# LN: 204 | 
	i1 = i4			# LN: 204 | 
	call (_shelvingLP)			# LN: 204 | 
	i0 = (0) + (_sb_ptr2)			# LN: 204 | 
	i0 = xmem[i0]			# LN: 204 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 204 | 
cline_204_0:			/* LN: 205 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 205 | 
	nop #empty cycle
	i0 += 1			# LN: 205 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 205 | 
	jmp (endif_4)			# LN: 205 | 
cline_205_0:			/* LN: 207 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 193 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 207 | 
	uhalfword(a1) = (0x4)			# LN: 207 | 
	a0 - a1			# LN: 207 | 
	if (a != 0) jmp (else_5)			# LN: 207 | 
cline_207_0:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 210 | 
	i1 = (0) + (_z_xH)			# LN: 210 | 
	a0 = ymem[i0]			# LN: 210 | 
	i4 = (0) + (_z_yH)			# LN: 210 | 
	i0 = i1			# LN: 210 | 
	i1 = i4			# LN: 210 | 
	call (_shelvingHP)			# LN: 210 | 
	i0 = (0) + (_sb_ptr0)			# LN: 210 | 
	i0 = xmem[i0]			# LN: 210 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 210 | 
cline_210_0:			/* LN: 211 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 211 | 
	i1 = (0) + (_z_xL)			# LN: 211 | 
	a0 = ymem[i0]			# LN: 211 | 
	i4 = (0) + (_z_yL)			# LN: 211 | 
	i0 = i1			# LN: 211 | 
	i1 = i4			# LN: 211 | 
	call (_shelvingLP)			# LN: 211 | 
	i0 = (0) + (_sb_ptr0)			# LN: 211 | 
	i0 = xmem[i0]			# LN: 211 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 211 | 
cline_211_0:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 212 | 
	nop #empty cycle
	i0 += 1			# LN: 212 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 212 | 
cline_212_0:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 214 | 
	i1 = (0) + (_z_xH + 2)			# LN: 214 | 
	a0 = ymem[i0]			# LN: 214 | 
	i4 = (0) + (_z_yH + 2)			# LN: 214 | 
	i0 = i1			# LN: 214 | 
	i1 = i4			# LN: 214 | 
	call (_shelvingHP)			# LN: 214 | 
	i0 = (0) + (_sb_ptr1)			# LN: 214 | 
	i0 = xmem[i0]			# LN: 214 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 214 | 
cline_214_0:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 215 | 
	i1 = (0) + (_z_xL + 2)			# LN: 215 | 
	a0 = ymem[i0]			# LN: 215 | 
	i4 = (0) + (_z_yL + 2)			# LN: 215 | 
	i0 = i1			# LN: 215 | 
	i1 = i4			# LN: 215 | 
	call (_shelvingLP)			# LN: 215 | 
	i0 = (0) + (_sb_ptr1)			# LN: 215 | 
	i0 = xmem[i0]			# LN: 215 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 215 | 
cline_215_0:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 216 | 
	nop #empty cycle
	i0 += 1			# LN: 216 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 216 | 
cline_216_0:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 218 | 
	i1 = (0) + (_z_xH + 4)			# LN: 218 | 
	a0 = ymem[i0]			# LN: 218 | 
	i4 = (0) + (_z_yH + 4)			# LN: 218 | 
	i0 = i1			# LN: 218 | 
	i1 = i4			# LN: 218 | 
	call (_shelvingHP)			# LN: 218 | 
	i0 = (0) + (_sb_ptr2)			# LN: 218 | 
	i0 = xmem[i0]			# LN: 218 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 218 | 
cline_218_0:			/* LN: 219 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 219 | 
	i1 = (0) + (_z_xL + 4)			# LN: 219 | 
	a0 = ymem[i0]			# LN: 219 | 
	i4 = (0) + (_z_yL + 4)			# LN: 219 | 
	i0 = i1			# LN: 219 | 
	i1 = i4			# LN: 219 | 
	call (_shelvingLP)			# LN: 219 | 
	i0 = (0) + (_sb_ptr2)			# LN: 219 | 
	i0 = xmem[i0]			# LN: 219 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 219 | 
cline_219_0:			/* LN: 220 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 220 | 
	nop #empty cycle
	i0 += 1			# LN: 220 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 220 | 
cline_220_0:			/* LN: 222 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 222 | 
	i1 = (0) + (_z_xH + 6)			# LN: 222 | 
	a0 = ymem[i0]			# LN: 222 | 
	i4 = (0) + (_z_yH + 6)			# LN: 222 | 
	i0 = i1			# LN: 222 | 
	i1 = i4			# LN: 222 | 
	call (_shelvingHP)			# LN: 222 | 
	i0 = (0) + (_sb_ptr3)			# LN: 222 | 
	i0 = xmem[i0]			# LN: 222 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 222 | 
cline_222_0:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 223 | 
	i1 = (0) + (_z_xL + 6)			# LN: 223 | 
	a0 = ymem[i0]			# LN: 223 | 
	i4 = (0) + (_z_yL + 6)			# LN: 223 | 
	i0 = i1			# LN: 223 | 
	i1 = i4			# LN: 223 | 
	call (_shelvingLP)			# LN: 223 | 
	i0 = (0) + (_sb_ptr3)			# LN: 223 | 
	i0 = xmem[i0]			# LN: 223 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 223 | 
cline_223_0:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 224 | 
	nop #empty cycle
	i0 += 1			# LN: 224 | 
	xmem[_sb_ptr3 + 0] = i0			# LN: 224 | 
	jmp (endif_5)			# LN: 224 | 
cline_224_0:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 207 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 227 | 
	uhalfword(a1) = (0x5)			# LN: 227 | 
	a0 - a1			# LN: 227 | 
	if (a != 0) jmp (else_6)			# LN: 227 | 
cline_227_0:			/* LN: 229 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 229 | 
	i1 = (0) + (_z_xH)			# LN: 229 | 
	a0 = ymem[i0]			# LN: 229 | 
	i4 = (0) + (_z_yH)			# LN: 229 | 
	i0 = i1			# LN: 229 | 
	i1 = i4			# LN: 229 | 
	call (_shelvingHP)			# LN: 229 | 
	i0 = (0) + (_sb_ptr0)			# LN: 229 | 
	i0 = xmem[i0]			# LN: 229 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 229 | 
cline_229_0:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 230 | 
	i1 = (0) + (_z_xL)			# LN: 230 | 
	a0 = ymem[i0]			# LN: 230 | 
	i4 = (0) + (_z_yL)			# LN: 230 | 
	i0 = i1			# LN: 230 | 
	i1 = i4			# LN: 230 | 
	call (_shelvingLP)			# LN: 230 | 
	i0 = (0) + (_sb_ptr0)			# LN: 230 | 
	i0 = xmem[i0]			# LN: 230 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 230 | 
cline_230_0:			/* LN: 231 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 231 | 
	nop #empty cycle
	i0 += 1			# LN: 231 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 231 | 
cline_231_0:			/* LN: 233 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 233 | 
	i1 = (0) + (_z_xH + 2)			# LN: 233 | 
	a0 = ymem[i0]			# LN: 233 | 
	i4 = (0) + (_z_yH + 2)			# LN: 233 | 
	i0 = i1			# LN: 233 | 
	i1 = i4			# LN: 233 | 
	call (_shelvingHP)			# LN: 233 | 
	i0 = (0) + (_sb_ptr1)			# LN: 233 | 
	i0 = xmem[i0]			# LN: 233 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 233 | 
cline_233_0:			/* LN: 234 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 234 | 
	i1 = (0) + (_z_xL + 2)			# LN: 234 | 
	a0 = ymem[i0]			# LN: 234 | 
	i4 = (0) + (_z_yL + 2)			# LN: 234 | 
	i0 = i1			# LN: 234 | 
	i1 = i4			# LN: 234 | 
	call (_shelvingLP)			# LN: 234 | 
	i0 = (0) + (_sb_ptr1)			# LN: 234 | 
	i0 = xmem[i0]			# LN: 234 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 234 | 
cline_234_0:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 235 | 
	nop #empty cycle
	i0 += 1			# LN: 235 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 235 | 
cline_235_0:			/* LN: 237 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 237 | 
	i1 = (0) + (_z_xH + 4)			# LN: 237 | 
	a0 = ymem[i0]			# LN: 237 | 
	i4 = (0) + (_z_yH + 4)			# LN: 237 | 
	i0 = i1			# LN: 237 | 
	i1 = i4			# LN: 237 | 
	call (_shelvingHP)			# LN: 237 | 
	i0 = (0) + (_sb_ptr2)			# LN: 237 | 
	i0 = xmem[i0]			# LN: 237 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 237 | 
cline_237_0:			/* LN: 238 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 238 | 
	i1 = (0) + (_z_xL + 4)			# LN: 238 | 
	a0 = ymem[i0]			# LN: 238 | 
	i4 = (0) + (_z_yL + 4)			# LN: 238 | 
	i0 = i1			# LN: 238 | 
	i1 = i4			# LN: 238 | 
	call (_shelvingLP)			# LN: 238 | 
	i0 = (0) + (_sb_ptr2)			# LN: 238 | 
	i0 = xmem[i0]			# LN: 238 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 238 | 
cline_238_0:			/* LN: 239 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 239 | 
	nop #empty cycle
	i0 += 1			# LN: 239 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 239 | 
cline_239_0:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 241 | 
	i1 = (0) + (_z_xH + 6)			# LN: 241 | 
	a0 = ymem[i0]			# LN: 241 | 
	i4 = (0) + (_z_yH + 6)			# LN: 241 | 
	i0 = i1			# LN: 241 | 
	i1 = i4			# LN: 241 | 
	call (_shelvingHP)			# LN: 241 | 
	i0 = (0) + (_sb_ptr3)			# LN: 241 | 
	i0 = xmem[i0]			# LN: 241 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 241 | 
cline_241_0:			/* LN: 242 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 242 | 
	i1 = (0) + (_z_xL + 6)			# LN: 242 | 
	a0 = ymem[i0]			# LN: 242 | 
	i4 = (0) + (_z_yL + 6)			# LN: 242 | 
	i0 = i1			# LN: 242 | 
	i1 = i4			# LN: 242 | 
	call (_shelvingLP)			# LN: 242 | 
	i0 = (0) + (_sb_ptr3)			# LN: 242 | 
	i0 = xmem[i0]			# LN: 242 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 242 | 
cline_242_0:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 243 | 
	nop #empty cycle
	i0 += 1			# LN: 243 | 
	xmem[_sb_ptr3 + 0] = i0			# LN: 243 | 
cline_243_0:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 245 | 
	i1 = (0) + (_z_xH + 8)			# LN: 245 | 
	a0 = ymem[i0]			# LN: 245 | 
	i4 = (0) + (_z_yH + 8)			# LN: 245 | 
	i0 = i1			# LN: 245 | 
	i1 = i4			# LN: 245 | 
	call (_shelvingHP)			# LN: 245 | 
	i0 = (0) + (_sb_ptr4)			# LN: 245 | 
	i0 = xmem[i0]			# LN: 245 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 245 | 
cline_245_0:			/* LN: 246 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 246 | 
	i1 = (0) + (_z_xL + 8)			# LN: 246 | 
	a0 = ymem[i0]			# LN: 246 | 
	i4 = (0) + (_z_yL + 8)			# LN: 246 | 
	i0 = i1			# LN: 246 | 
	i1 = i4			# LN: 246 | 
	call (_shelvingLP)			# LN: 246 | 
	i0 = (0) + (_sb_ptr4)			# LN: 246 | 
	i0 = xmem[i0]			# LN: 246 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 246 | 
cline_246_0:			/* LN: 247 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 247 | 
	nop #empty cycle
	i0 += 1			# LN: 247 | 
	xmem[_sb_ptr4 + 0] = i0			# LN: 247 | 
	jmp (endif_6)			# LN: 247 | 
cline_247_0:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
else_6:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 250 | 
	uhalfword(a1) = (0x6)			# LN: 250 | 
	a0 - a1			# LN: 250 | 
	if (a != 0) jmp (else_7)			# LN: 250 | 
cline_250_0:			/* LN: 253 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 253 | 
	i1 = (0) + (_z_xH)			# LN: 253 | 
	a0 = ymem[i0]			# LN: 253 | 
	i4 = (0) + (_z_yH)			# LN: 253 | 
	i0 = i1			# LN: 253 | 
	i1 = i4			# LN: 253 | 
	call (_shelvingHP)			# LN: 253 | 
	i0 = (0) + (_sb_ptr0)			# LN: 253 | 
	i0 = xmem[i0]			# LN: 253 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 253 | 
cline_253_0:			/* LN: 254 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 254 | 
	i1 = (0) + (_z_xL)			# LN: 254 | 
	a0 = ymem[i0]			# LN: 254 | 
	i4 = (0) + (_z_yL)			# LN: 254 | 
	i0 = i1			# LN: 254 | 
	i1 = i4			# LN: 254 | 
	call (_shelvingLP)			# LN: 254 | 
	i0 = (0) + (_sb_ptr0)			# LN: 254 | 
	i0 = xmem[i0]			# LN: 254 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 254 | 
cline_254_0:			/* LN: 255 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 255 | 
	nop #empty cycle
	i0 += 1			# LN: 255 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 255 | 
cline_255_0:			/* LN: 257 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 257 | 
	i1 = (0) + (_z_xH + 2)			# LN: 257 | 
	a0 = ymem[i0]			# LN: 257 | 
	i4 = (0) + (_z_yH + 2)			# LN: 257 | 
	i0 = i1			# LN: 257 | 
	i1 = i4			# LN: 257 | 
	call (_shelvingHP)			# LN: 257 | 
	i0 = (0) + (_sb_ptr1)			# LN: 257 | 
	i0 = xmem[i0]			# LN: 257 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 257 | 
cline_257_0:			/* LN: 258 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 258 | 
	i1 = (0) + (_z_xL + 2)			# LN: 258 | 
	a0 = ymem[i0]			# LN: 258 | 
	i4 = (0) + (_z_yL + 2)			# LN: 258 | 
	i0 = i1			# LN: 258 | 
	i1 = i4			# LN: 258 | 
	call (_shelvingLP)			# LN: 258 | 
	i0 = (0) + (_sb_ptr1)			# LN: 258 | 
	i0 = xmem[i0]			# LN: 258 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 258 | 
cline_258_0:			/* LN: 259 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 259 | 
	nop #empty cycle
	i0 += 1			# LN: 259 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 259 | 
cline_259_0:			/* LN: 261 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 261 | 
	i1 = (0) + (_z_xH + 4)			# LN: 261 | 
	a0 = ymem[i0]			# LN: 261 | 
	i4 = (0) + (_z_yH + 4)			# LN: 261 | 
	i0 = i1			# LN: 261 | 
	i1 = i4			# LN: 261 | 
	call (_shelvingHP)			# LN: 261 | 
	i0 = (0) + (_sb_ptr2)			# LN: 261 | 
	i0 = xmem[i0]			# LN: 261 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 261 | 
cline_261_0:			/* LN: 262 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 262 | 
	i1 = (0) + (_z_xL + 4)			# LN: 262 | 
	a0 = ymem[i0]			# LN: 262 | 
	i4 = (0) + (_z_yL + 4)			# LN: 262 | 
	i0 = i1			# LN: 262 | 
	i1 = i4			# LN: 262 | 
	call (_shelvingLP)			# LN: 262 | 
	i0 = (0) + (_sb_ptr2)			# LN: 262 | 
	i0 = xmem[i0]			# LN: 262 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 262 | 
cline_262_0:			/* LN: 263 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 263 | 
	nop #empty cycle
	i0 += 1			# LN: 263 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 263 | 
cline_263_0:			/* LN: 265 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 265 | 
	i1 = (0) + (_z_xH + 6)			# LN: 265 | 
	a0 = ymem[i0]			# LN: 265 | 
	i4 = (0) + (_z_yH + 6)			# LN: 265 | 
	i0 = i1			# LN: 265 | 
	i1 = i4			# LN: 265 | 
	call (_shelvingHP)			# LN: 265 | 
	i0 = (0) + (_sb_ptr3)			# LN: 265 | 
	i0 = xmem[i0]			# LN: 265 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 265 | 
cline_265_0:			/* LN: 266 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 266 | 
	i1 = (0) + (_z_xL + 6)			# LN: 266 | 
	a0 = ymem[i0]			# LN: 266 | 
	i4 = (0) + (_z_yL + 6)			# LN: 266 | 
	i0 = i1			# LN: 266 | 
	i1 = i4			# LN: 266 | 
	call (_shelvingLP)			# LN: 266 | 
	i0 = (0) + (_sb_ptr3)			# LN: 266 | 
	i0 = xmem[i0]			# LN: 266 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 266 | 
cline_266_0:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 267 | 
	nop #empty cycle
	i0 += 1			# LN: 267 | 
	xmem[_sb_ptr3 + 0] = i0			# LN: 267 | 
cline_267_0:			/* LN: 269 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 269 | 
	i1 = (0) + (_z_xH + 8)			# LN: 269 | 
	a0 = ymem[i0]			# LN: 269 | 
	i4 = (0) + (_z_yH + 8)			# LN: 269 | 
	i0 = i1			# LN: 269 | 
	i1 = i4			# LN: 269 | 
	call (_shelvingHP)			# LN: 269 | 
	i0 = (0) + (_sb_ptr4)			# LN: 269 | 
	i0 = xmem[i0]			# LN: 269 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 269 | 
cline_269_0:			/* LN: 270 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 270 | 
	i1 = (0) + (_z_xL + 8)			# LN: 270 | 
	a0 = ymem[i0]			# LN: 270 | 
	i4 = (0) + (_z_yL + 8)			# LN: 270 | 
	i0 = i1			# LN: 270 | 
	i1 = i4			# LN: 270 | 
	call (_shelvingLP)			# LN: 270 | 
	i0 = (0) + (_sb_ptr4)			# LN: 270 | 
	i0 = xmem[i0]			# LN: 270 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 270 | 
cline_270_0:			/* LN: 271 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 271 | 
	nop #empty cycle
	i0 += 1			# LN: 271 | 
	xmem[_sb_ptr4 + 0] = i0			# LN: 271 | 
cline_271_0:			/* LN: 273 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 273 | 
	i1 = (0) + (_z_xH + 10)			# LN: 273 | 
	a0 = ymem[i0]			# LN: 273 | 
	i4 = (0) + (_z_yH + 10)			# LN: 273 | 
	i0 = i1			# LN: 273 | 
	i1 = i4			# LN: 273 | 
	call (_shelvingHP)			# LN: 273 | 
	i0 = (0) + (_sb_ptr5)			# LN: 273 | 
	i0 = xmem[i0]			# LN: 273 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 273 | 
cline_273_0:			/* LN: 274 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 274 | 
	i1 = (0) + (_z_xL + 10)			# LN: 274 | 
	a0 = ymem[i0]			# LN: 274 | 
	i4 = (0) + (_z_yL + 10)			# LN: 274 | 
	i0 = i1			# LN: 274 | 
	i1 = i4			# LN: 274 | 
	call (_shelvingLP)			# LN: 274 | 
	i0 = (0) + (_sb_ptr5)			# LN: 274 | 
	i0 = xmem[i0]			# LN: 274 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 274 | 
cline_274_0:			/* LN: 275 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 275 | 
	nop #empty cycle
	i0 += 1			# LN: 275 | 
	xmem[_sb_ptr5 + 0] = i0			# LN: 275 | 
	jmp (endif_7)			# LN: 275 | 
cline_275_0:			/* LN: 277 | CYCLE: 0 | RULES: () */ 
else_7:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_nChannels + 0]			# LN: 277 | 
	uhalfword(a1) = (0x7)			# LN: 277 | 
	a0 - a1			# LN: 277 | 
	if (a != 0) jmp (else_8)			# LN: 277 | 
cline_277_0:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 280 | 
	i1 = (0) + (_z_xH)			# LN: 280 | 
	a0 = ymem[i0]			# LN: 280 | 
	i4 = (0) + (_z_yH)			# LN: 280 | 
	i0 = i1			# LN: 280 | 
	i1 = i4			# LN: 280 | 
	call (_shelvingHP)			# LN: 280 | 
	i0 = (0) + (_sb_ptr0)			# LN: 280 | 
	i0 = xmem[i0]			# LN: 280 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 280 | 
cline_280_0:			/* LN: 281 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 281 | 
	i1 = (0) + (_z_xL)			# LN: 281 | 
	a0 = ymem[i0]			# LN: 281 | 
	i4 = (0) + (_z_yL)			# LN: 281 | 
	i0 = i1			# LN: 281 | 
	i1 = i4			# LN: 281 | 
	call (_shelvingLP)			# LN: 281 | 
	i0 = (0) + (_sb_ptr0)			# LN: 281 | 
	i0 = xmem[i0]			# LN: 281 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 281 | 
cline_281_0:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 282 | 
	nop #empty cycle
	i0 += 1			# LN: 282 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 282 | 
cline_282_0:			/* LN: 284 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 284 | 
	i1 = (0) + (_z_xH + 2)			# LN: 284 | 
	a0 = ymem[i0]			# LN: 284 | 
	i4 = (0) + (_z_yH + 2)			# LN: 284 | 
	i0 = i1			# LN: 284 | 
	i1 = i4			# LN: 284 | 
	call (_shelvingHP)			# LN: 284 | 
	i0 = (0) + (_sb_ptr1)			# LN: 284 | 
	i0 = xmem[i0]			# LN: 284 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 284 | 
cline_284_0:			/* LN: 285 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 285 | 
	i1 = (0) + (_z_xL + 2)			# LN: 285 | 
	a0 = ymem[i0]			# LN: 285 | 
	i4 = (0) + (_z_yL + 2)			# LN: 285 | 
	i0 = i1			# LN: 285 | 
	i1 = i4			# LN: 285 | 
	call (_shelvingLP)			# LN: 285 | 
	i0 = (0) + (_sb_ptr1)			# LN: 285 | 
	i0 = xmem[i0]			# LN: 285 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 285 | 
cline_285_0:			/* LN: 286 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 286 | 
	nop #empty cycle
	i0 += 1			# LN: 286 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 286 | 
cline_286_0:			/* LN: 288 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 288 | 
	i1 = (0) + (_z_xH + 4)			# LN: 288 | 
	a0 = ymem[i0]			# LN: 288 | 
	i4 = (0) + (_z_yH + 4)			# LN: 288 | 
	i0 = i1			# LN: 288 | 
	i1 = i4			# LN: 288 | 
	call (_shelvingHP)			# LN: 288 | 
	i0 = (0) + (_sb_ptr2)			# LN: 288 | 
	i0 = xmem[i0]			# LN: 288 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 288 | 
cline_288_0:			/* LN: 289 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 289 | 
	i1 = (0) + (_z_xL + 4)			# LN: 289 | 
	a0 = ymem[i0]			# LN: 289 | 
	i4 = (0) + (_z_yL + 4)			# LN: 289 | 
	i0 = i1			# LN: 289 | 
	i1 = i4			# LN: 289 | 
	call (_shelvingLP)			# LN: 289 | 
	i0 = (0) + (_sb_ptr2)			# LN: 289 | 
	i0 = xmem[i0]			# LN: 289 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 289 | 
cline_289_0:			/* LN: 290 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 290 | 
	nop #empty cycle
	i0 += 1			# LN: 290 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 290 | 
cline_290_0:			/* LN: 292 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 292 | 
	i1 = (0) + (_z_xH + 6)			# LN: 292 | 
	a0 = ymem[i0]			# LN: 292 | 
	i4 = (0) + (_z_yH + 6)			# LN: 292 | 
	i0 = i1			# LN: 292 | 
	i1 = i4			# LN: 292 | 
	call (_shelvingHP)			# LN: 292 | 
	i0 = (0) + (_sb_ptr3)			# LN: 292 | 
	i0 = xmem[i0]			# LN: 292 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 292 | 
cline_292_0:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 293 | 
	i1 = (0) + (_z_xL + 6)			# LN: 293 | 
	a0 = ymem[i0]			# LN: 293 | 
	i4 = (0) + (_z_yL + 6)			# LN: 293 | 
	i0 = i1			# LN: 293 | 
	i1 = i4			# LN: 293 | 
	call (_shelvingLP)			# LN: 293 | 
	i0 = (0) + (_sb_ptr3)			# LN: 293 | 
	i0 = xmem[i0]			# LN: 293 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 293 | 
cline_293_0:			/* LN: 294 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 294 | 
	nop #empty cycle
	i0 += 1			# LN: 294 | 
	xmem[_sb_ptr3 + 0] = i0			# LN: 294 | 
cline_294_0:			/* LN: 296 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 296 | 
	i1 = (0) + (_z_xH + 8)			# LN: 296 | 
	a0 = ymem[i0]			# LN: 296 | 
	i4 = (0) + (_z_yH + 8)			# LN: 296 | 
	i0 = i1			# LN: 296 | 
	i1 = i4			# LN: 296 | 
	call (_shelvingHP)			# LN: 296 | 
	i0 = (0) + (_sb_ptr4)			# LN: 296 | 
	i0 = xmem[i0]			# LN: 296 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 296 | 
cline_296_0:			/* LN: 297 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 297 | 
	i1 = (0) + (_z_xL + 8)			# LN: 297 | 
	a0 = ymem[i0]			# LN: 297 | 
	i4 = (0) + (_z_yL + 8)			# LN: 297 | 
	i0 = i1			# LN: 297 | 
	i1 = i4			# LN: 297 | 
	call (_shelvingLP)			# LN: 297 | 
	i0 = (0) + (_sb_ptr4)			# LN: 297 | 
	i0 = xmem[i0]			# LN: 297 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 297 | 
cline_297_0:			/* LN: 298 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 298 | 
	nop #empty cycle
	i0 += 1			# LN: 298 | 
	xmem[_sb_ptr4 + 0] = i0			# LN: 298 | 
cline_298_0:			/* LN: 300 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 300 | 
	i1 = (0) + (_z_xH + 10)			# LN: 300 | 
	a0 = ymem[i0]			# LN: 300 | 
	i4 = (0) + (_z_yH + 10)			# LN: 300 | 
	i0 = i1			# LN: 300 | 
	i1 = i4			# LN: 300 | 
	call (_shelvingHP)			# LN: 300 | 
	i0 = (0) + (_sb_ptr5)			# LN: 300 | 
	i0 = xmem[i0]			# LN: 300 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 300 | 
cline_300_0:			/* LN: 301 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 301 | 
	i1 = (0) + (_z_xL + 10)			# LN: 301 | 
	a0 = ymem[i0]			# LN: 301 | 
	i4 = (0) + (_z_yL + 10)			# LN: 301 | 
	i0 = i1			# LN: 301 | 
	i1 = i4			# LN: 301 | 
	call (_shelvingLP)			# LN: 301 | 
	i0 = (0) + (_sb_ptr5)			# LN: 301 | 
	i0 = xmem[i0]			# LN: 301 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 301 | 
cline_301_0:			/* LN: 302 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 302 | 
	nop #empty cycle
	i0 += 1			# LN: 302 | 
	xmem[_sb_ptr5 + 0] = i0			# LN: 302 | 
cline_302_0:			/* LN: 304 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr6 + 0]			# LN: 304 | 
	i1 = (0) + (_z_xH + 12)			# LN: 304 | 
	a0 = ymem[i0]			# LN: 304 | 
	i4 = (0) + (_z_yH + 12)			# LN: 304 | 
	i0 = i1			# LN: 304 | 
	i1 = i4			# LN: 304 | 
	call (_shelvingHP)			# LN: 304 | 
	i0 = (0) + (_sb_ptr6)			# LN: 304 | 
	i0 = xmem[i0]			# LN: 304 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 304 | 
cline_304_0:			/* LN: 305 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr6 + 0]			# LN: 305 | 
	i2 = xmem[_sb_ptr6 + 0]			# LN: 305 | 
	a0 = ymem[i0]			# LN: 305 | 
	i1 = xmem[_sb_ptr6 + 0]			# LN: 305 | 
	i4 = (0) + (_z_yL + 12)			# LN: 305 | 
	i1 += 1			# LN: 305 | 
	xmem[_sb_ptr6 + 0] = i1			# LN: 305 | 
	i1 = i4			# LN: 305 | 
	i0 = (0) + (_z_xL + 12)			# LN: 305 | 
	call (_shelvingLP)			# LN: 305 | 
	ymem[i2] = a0h			# LN: 305 | 
cline_305_0:			/* LN: 306 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr6 + 0]			# LN: 306 | 
	nop #empty cycle
	i0 += 1			# LN: 306 | 
	xmem[_sb_ptr6 + 0] = i0			# LN: 306 | 
	jmp (endif_8)			# LN: 306 | 
cline_306_0:			/* LN: 313 | CYCLE: 0 | RULES: () */ 
else_8:			/* LN: 277 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 313 | 
	i1 = (0) + (_z_xH)			# LN: 313 | 
	a0 = ymem[i0]			# LN: 313 | 
	i4 = (0) + (_z_yH)			# LN: 313 | 
	i0 = i1			# LN: 313 | 
	i1 = i4			# LN: 313 | 
	call (_shelvingHP)			# LN: 313 | 
	i0 = (0) + (_sb_ptr0)			# LN: 313 | 
	i0 = xmem[i0]			# LN: 313 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 313 | 
cline_313_0:			/* LN: 314 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 314 | 
	i1 = (0) + (_z_xL)			# LN: 314 | 
	a0 = ymem[i0]			# LN: 314 | 
	i4 = (0) + (_z_yL)			# LN: 314 | 
	i0 = i1			# LN: 314 | 
	i1 = i4			# LN: 314 | 
	call (_shelvingLP)			# LN: 314 | 
	i0 = (0) + (_sb_ptr0)			# LN: 314 | 
	i0 = xmem[i0]			# LN: 314 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 314 | 
cline_314_0:			/* LN: 315 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr0 + 0]			# LN: 315 | 
	nop #empty cycle
	i0 += 1			# LN: 315 | 
	xmem[_sb_ptr0 + 0] = i0			# LN: 315 | 
cline_315_0:			/* LN: 317 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 317 | 
	i1 = (0) + (_z_xH + 2)			# LN: 317 | 
	a0 = ymem[i0]			# LN: 317 | 
	i4 = (0) + (_z_yH + 2)			# LN: 317 | 
	i0 = i1			# LN: 317 | 
	i1 = i4			# LN: 317 | 
	call (_shelvingHP)			# LN: 317 | 
	i0 = (0) + (_sb_ptr1)			# LN: 317 | 
	i0 = xmem[i0]			# LN: 317 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 317 | 
cline_317_0:			/* LN: 318 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 318 | 
	i1 = (0) + (_z_xL + 2)			# LN: 318 | 
	a0 = ymem[i0]			# LN: 318 | 
	i4 = (0) + (_z_yL + 2)			# LN: 318 | 
	i0 = i1			# LN: 318 | 
	i1 = i4			# LN: 318 | 
	call (_shelvingLP)			# LN: 318 | 
	i0 = (0) + (_sb_ptr1)			# LN: 318 | 
	i0 = xmem[i0]			# LN: 318 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 318 | 
cline_318_0:			/* LN: 319 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr1 + 0]			# LN: 319 | 
	nop #empty cycle
	i0 += 1			# LN: 319 | 
	xmem[_sb_ptr1 + 0] = i0			# LN: 319 | 
cline_319_0:			/* LN: 321 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 321 | 
	i1 = (0) + (_z_xH + 4)			# LN: 321 | 
	a0 = ymem[i0]			# LN: 321 | 
	i4 = (0) + (_z_yH + 4)			# LN: 321 | 
	i0 = i1			# LN: 321 | 
	i1 = i4			# LN: 321 | 
	call (_shelvingHP)			# LN: 321 | 
	i0 = (0) + (_sb_ptr2)			# LN: 321 | 
	i0 = xmem[i0]			# LN: 321 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 321 | 
cline_321_0:			/* LN: 322 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 322 | 
	i1 = (0) + (_z_xL + 4)			# LN: 322 | 
	a0 = ymem[i0]			# LN: 322 | 
	i4 = (0) + (_z_yL + 4)			# LN: 322 | 
	i0 = i1			# LN: 322 | 
	i1 = i4			# LN: 322 | 
	call (_shelvingLP)			# LN: 322 | 
	i0 = (0) + (_sb_ptr2)			# LN: 322 | 
	i0 = xmem[i0]			# LN: 322 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 322 | 
cline_322_0:			/* LN: 323 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr2 + 0]			# LN: 323 | 
	nop #empty cycle
	i0 += 1			# LN: 323 | 
	xmem[_sb_ptr2 + 0] = i0			# LN: 323 | 
cline_323_0:			/* LN: 325 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 325 | 
	i1 = (0) + (_z_xH + 6)			# LN: 325 | 
	a0 = ymem[i0]			# LN: 325 | 
	i4 = (0) + (_z_yH + 6)			# LN: 325 | 
	i0 = i1			# LN: 325 | 
	i1 = i4			# LN: 325 | 
	call (_shelvingHP)			# LN: 325 | 
	i0 = (0) + (_sb_ptr3)			# LN: 325 | 
	i0 = xmem[i0]			# LN: 325 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 325 | 
cline_325_0:			/* LN: 326 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 326 | 
	i1 = (0) + (_z_xL + 6)			# LN: 326 | 
	a0 = ymem[i0]			# LN: 326 | 
	i4 = (0) + (_z_yL + 6)			# LN: 326 | 
	i0 = i1			# LN: 326 | 
	i1 = i4			# LN: 326 | 
	call (_shelvingLP)			# LN: 326 | 
	i0 = (0) + (_sb_ptr3)			# LN: 326 | 
	i0 = xmem[i0]			# LN: 326 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 326 | 
cline_326_0:			/* LN: 327 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr3 + 0]			# LN: 327 | 
	nop #empty cycle
	i0 += 1			# LN: 327 | 
	xmem[_sb_ptr3 + 0] = i0			# LN: 327 | 
cline_327_0:			/* LN: 329 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 329 | 
	i1 = (0) + (_z_xH + 8)			# LN: 329 | 
	a0 = ymem[i0]			# LN: 329 | 
	i4 = (0) + (_z_yH + 8)			# LN: 329 | 
	i0 = i1			# LN: 329 | 
	i1 = i4			# LN: 329 | 
	call (_shelvingHP)			# LN: 329 | 
	i0 = (0) + (_sb_ptr4)			# LN: 329 | 
	i0 = xmem[i0]			# LN: 329 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 329 | 
cline_329_0:			/* LN: 330 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 330 | 
	i1 = (0) + (_z_xL + 8)			# LN: 330 | 
	a0 = ymem[i0]			# LN: 330 | 
	i4 = (0) + (_z_yL + 8)			# LN: 330 | 
	i0 = i1			# LN: 330 | 
	i1 = i4			# LN: 330 | 
	call (_shelvingLP)			# LN: 330 | 
	i0 = (0) + (_sb_ptr4)			# LN: 330 | 
	i0 = xmem[i0]			# LN: 330 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 330 | 
cline_330_0:			/* LN: 331 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr4 + 0]			# LN: 331 | 
	nop #empty cycle
	i0 += 1			# LN: 331 | 
	xmem[_sb_ptr4 + 0] = i0			# LN: 331 | 
cline_331_0:			/* LN: 333 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 333 | 
	i1 = (0) + (_z_xH + 10)			# LN: 333 | 
	a0 = ymem[i0]			# LN: 333 | 
	i4 = (0) + (_z_yH + 10)			# LN: 333 | 
	i0 = i1			# LN: 333 | 
	i1 = i4			# LN: 333 | 
	call (_shelvingHP)			# LN: 333 | 
	i0 = (0) + (_sb_ptr5)			# LN: 333 | 
	i0 = xmem[i0]			# LN: 333 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 333 | 
cline_333_0:			/* LN: 334 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 334 | 
	i1 = (0) + (_z_xL + 10)			# LN: 334 | 
	a0 = ymem[i0]			# LN: 334 | 
	i4 = (0) + (_z_yL + 10)			# LN: 334 | 
	i0 = i1			# LN: 334 | 
	i1 = i4			# LN: 334 | 
	call (_shelvingLP)			# LN: 334 | 
	i0 = (0) + (_sb_ptr5)			# LN: 334 | 
	i0 = xmem[i0]			# LN: 334 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 334 | 
cline_334_0:			/* LN: 335 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr5 + 0]			# LN: 335 | 
	nop #empty cycle
	i0 += 1			# LN: 335 | 
	xmem[_sb_ptr5 + 0] = i0			# LN: 335 | 
cline_335_0:			/* LN: 337 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr6 + 0]			# LN: 337 | 
	i1 = (0) + (_z_xH + 12)			# LN: 337 | 
	a0 = ymem[i0]			# LN: 337 | 
	i4 = (0) + (_z_yH + 12)			# LN: 337 | 
	i0 = i1			# LN: 337 | 
	i1 = i4			# LN: 337 | 
	call (_shelvingHP)			# LN: 337 | 
	i0 = (0) + (_sb_ptr6)			# LN: 337 | 
	i0 = xmem[i0]			# LN: 337 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 337 | 
cline_337_0:			/* LN: 338 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr6 + 0]			# LN: 338 | 
	i2 = xmem[_sb_ptr6 + 0]			# LN: 338 | 
	a0 = ymem[i0]			# LN: 338 | 
	i1 = xmem[_sb_ptr6 + 0]			# LN: 338 | 
	i4 = (0) + (_z_yL + 12)			# LN: 338 | 
	i1 += 1			# LN: 338 | 
	xmem[_sb_ptr6 + 0] = i1			# LN: 338 | 
	i1 = i4			# LN: 338 | 
	i0 = (0) + (_z_xL + 12)			# LN: 338 | 
	call (_shelvingLP)			# LN: 338 | 
	ymem[i2] = a0h			# LN: 338 | 
cline_338_0:			/* LN: 339 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr6 + 0]			# LN: 339 | 
	nop #empty cycle
	i0 += 1			# LN: 339 | 
	xmem[_sb_ptr6 + 0] = i0			# LN: 339 | 
cline_339_0:			/* LN: 341 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr7 + 0]			# LN: 341 | 
	i1 = (0) + (_z_xH + 14)			# LN: 341 | 
	a0 = ymem[i0]			# LN: 341 | 
	i4 = (0) + (_z_yH + 14)			# LN: 341 | 
	i0 = i1			# LN: 341 | 
	i1 = i4			# LN: 341 | 
	call (_shelvingHP)			# LN: 341 | 
	i0 = (0) + (_sb_ptr7)			# LN: 341 | 
	i0 = xmem[i0]			# LN: 341 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 341 | 
cline_341_0:			/* LN: 342 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr7 + 0]			# LN: 342 | 
	i1 = (0) + (_z_xL + 14)			# LN: 342 | 
	a0 = ymem[i0]			# LN: 342 | 
	i4 = (0) + (_z_yL + 14)			# LN: 342 | 
	i0 = i1			# LN: 342 | 
	i1 = i4			# LN: 342 | 
	call (_shelvingLP)			# LN: 342 | 
	i0 = (0) + (_sb_ptr7)			# LN: 342 | 
	i0 = xmem[i0]			# LN: 342 | 
	nop #empty cycle
	ymem[i0] = a0h			# LN: 342 | 
cline_342_0:			/* LN: 343 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_sb_ptr7 + 0]			# LN: 343 | 
	nop #empty cycle
	i0 += 1			# LN: 343 | 
	xmem[_sb_ptr7 + 0] = i0			# LN: 343 | 
cline_343_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 345 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 193 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 207 | CYCLE: 0 | RULES: () */ 
endif_6:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
endif_7:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
endif_8:			/* LN: 277 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 174 | 
	a0 = xmem[i0]			# LN: 174 | 
	uhalfword(a1) = (0x1)			# LN: 174 | 
	a0 = a0 + a1			# LN: 174 | 
	i0 = i7 - (0x1)			# LN: 174 | 
label_end_92:			# LN: 174 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 174 | 
cline_174_1:			/* LN: 348 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_248)			# LN: 348 | 
__epilogue_248:			/* LN: 348 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 348 | 
	i7 -= 1			# LN: 348 | 
	i2 = xmem[i7]; i7 -= 1			# LN: 348, 348 | 
	ret			# LN: 348 | 



_shelvingHP:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 120 | 
	i7 += 1			# LN: 120 | 
	i7 = i7 + (0x6)			# LN: 120 | 
	i4 = i7 - (0x1)			# LN: 120 | 
	xmem[i4] = a0h			# LN: 120 | 
	i4 = i7 - (0x2)			# LN: 120 | 
	xmem[i4] = i0			# LN: 120 | 
	i0 = i7 - (0x3)			# LN: 120 | 
	xmem[i0] = i1			# LN: 120 | 
cline_120_0:			/* LN: 125 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x1)			# LN: 125 | 
	a0 = xmem[i1]			# LN: 125 | 
	i1 = i7 - (0x2)			# LN: 125 | 
	i1 = xmem[i1]			# LN: 125 | 
	i4 = i7 - (0x3)			# LN: 125 | 
	i4 = xmem[i4]			# LN: 125 | 
	i0 = (0) + (_coeffH)			# LN: 125 | 
	call (_first_order_IIR)			# LN: 125 | 
	i0 = i7 - (0x4)			# LN: 125 | 
	xmem[i0] = a0h			# LN: 125 | 
cline_125_0:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 127 | 
	a0 = xmem[i0]			# LN: 127 | 
	i0 = i7 - (0x4)			# LN: 127 | 
	a1 = xmem[i0]			# LN: 127 | 
	a0 = a0 - a1			# LN: 127 | 
	a0 = a0 >> 1			# LN: 127 | 
	i0 = i7 - (0x6)			# LN: 127 | 
	xmem[i0] = a0h; i0 += 1			# LN: 127, 127 | 
	xmem[i0] = a0l			# LN: 127 | 
cline_127_0:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 129 | 
	a0 = xmem[i0]			# LN: 129 | 
	i0 = i7 - (0x4)			# LN: 129 | 
	a1 = xmem[i0]			# LN: 129 | 
	x0 = xmem[_K2 + 0]			# LN: 129 | 
	i0 = i7 - (0x6)			# LN: 129 | 
	b0 = xmem[i0]; i0 += 1			# LN: 129, 129 | 
	a0 = a0 + a1			# LN: 129 | 
	b0l = xmem[i0]			# LN: 129 | 
	x1 = a0h; a0 =+ b0			# LN: 129, 129 | 
	a0 += x1 * x0			# LN: 129 | 
	i0 = i7 - (0x6)			# LN: 129 | 
	xmem[i0] = a0h; i0 += 1			# LN: 129, 129 | 
	xmem[i0] = a0l			# LN: 129 | 
cline_129_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 132 | 
	call (_clip)			# LN: 132 | 
cline_132_0:			/* LN: 136 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 136 | 
	a0 = xmem[i0]; i0 += 1			# LN: 136, 136 | 
	a0l = xmem[i0]			# LN: 136 | 
	a0 = a0			# LN: 136 | 
	jmp (__epilogue_244)			# LN: 136 | 
cline_136_0:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
__epilogue_244:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x6)			# LN: 138 | 
	i7 -= 1			# LN: 138 | 
	ret			# LN: 138 | 



_shelvingLP:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 103 | 
	i7 += 1			# LN: 103 | 
	i7 = i7 + (0x6)			# LN: 103 | 
	i4 = i7 - (0x1)			# LN: 103 | 
	xmem[i4] = a0h			# LN: 103 | 
	i4 = i7 - (0x2)			# LN: 103 | 
	xmem[i4] = i0			# LN: 103 | 
	i0 = i7 - (0x3)			# LN: 103 | 
	xmem[i0] = i1			# LN: 103 | 
cline_103_0:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x1)			# LN: 108 | 
	a0 = xmem[i1]			# LN: 108 | 
	i1 = i7 - (0x2)			# LN: 108 | 
	i1 = xmem[i1]			# LN: 108 | 
	i4 = i7 - (0x3)			# LN: 108 | 
	i4 = xmem[i4]			# LN: 108 | 
	i0 = (0) + (_coeffL)			# LN: 108 | 
	call (_first_order_IIR)			# LN: 108 | 
	i0 = i7 - (0x4)			# LN: 108 | 
	xmem[i0] = a0h			# LN: 108 | 
cline_108_0:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 110 | 
	a0 = xmem[i0]			# LN: 110 | 
	i0 = i7 - (0x4)			# LN: 110 | 
	a1 = xmem[i0]			# LN: 110 | 
	a0 = a0 + a1			# LN: 110 | 
	a0 = a0 >> 1			# LN: 110 | 
	i0 = i7 - (0x6)			# LN: 110 | 
	xmem[i0] = a0h; i0 += 1			# LN: 110, 110 | 
	xmem[i0] = a0l			# LN: 110 | 
cline_110_0:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 112 | 
	a0 = xmem[i0]			# LN: 112 | 
	i0 = i7 - (0x4)			# LN: 112 | 
	a1 = xmem[i0]			# LN: 112 | 
	x0 = xmem[_K1 + 0]			# LN: 112 | 
	i0 = i7 - (0x6)			# LN: 112 | 
	b0 = xmem[i0]; i0 += 1			# LN: 112, 112 | 
	a0 = a0 - a1			# LN: 112 | 
	b0l = xmem[i0]			# LN: 112 | 
	x1 = a0h; a0 =+ b0			# LN: 112, 112 | 
	a0 += x1 * x0			# LN: 112 | 
	i0 = i7 - (0x6)			# LN: 112 | 
	xmem[i0] = a0h; i0 += 1			# LN: 112, 112 | 
	xmem[i0] = a0l			# LN: 112 | 
cline_112_0:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 113 | 
	call (_clip)			# LN: 113 | 
cline_113_0:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 116 | 
	a0 = xmem[i0]; i0 += 1			# LN: 116, 116 | 
	a0l = xmem[i0]			# LN: 116 | 
	a0 = a0			# LN: 116 | 
	jmp (__epilogue_242)			# LN: 116 | 
cline_116_0:			/* LN: 118 | CYCLE: 0 | RULES: () */ 
__epilogue_242:			/* LN: 118 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x6)			# LN: 118 | 
	i7 -= 1			# LN: 118 | 
	ret			# LN: 118 | 
