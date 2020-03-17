	.public _m2dB
	.public _m6dB
	.public _sampleBuffer
	.public _state
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
	.public _main
	.extern _memset
	.extern _printf
	.public _processing
	.public _stateInit
	.extern _strcpy
	.extern __div
	.xdata_ovly
_m2dB
	.dw  (0x651eb852)
	.xdata_ovly
_m6dB
	.dw  (0x40000000)
	.xdata_ovly
_sampleBuffer
	.bss (0x60)
	.xdata_ovly
_state
	.bss (0x88)
	.xdata_ovly
_string_const_0
	.dw  (0x73)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x65)
	.dw  (0x63)
	.dw  (0x68)
	.dw  (0x2e)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
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
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x33)
	.dw  (0x2e)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x0)
	.xdata_ovly
_string_const_3
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
	.code_ovly



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

_main:			/* LN: 139 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 139 | 
	i7 += 1			# LN: 139 | 
	i7 = i7 + (0x20e)			# LN: 139 | 
	i1 = i7 - (0x1)			# LN: 139 | 
	xmem[i1] = a0h			# LN: 139 | 
	i1 = i7 - (0x2)			# LN: 139 | 
	xmem[i1] = i0			# LN: 139 | 
cline_139_0:			/* LN: 154 | CYCLE: 0 | RULES: () */ 
	call (_stateInit)			# LN: 154 | 
cline_154_0:			/* LN: 156 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x4)			# LN: 156 | 
	xmem[_state + 135] = a0h			# LN: 156 | 
cline_156_0:			/* LN: 157 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 157 | 
	xmem[_state + 0] = a0h			# LN: 157 | 
cline_157_0:			/* LN: 158 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 158 | 
	xmem[_state + 1] = a0h			# LN: 158 | 
cline_158_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	a0 = (0x4000)			# LN: 159 | 
	xmem[_state + 2] = a0h			# LN: 159 | 
cline_159_0:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 162 | 
	a0 = 0			# LN: 162 | 
	xmem[i0] = a0h			# LN: 162 | 
	do (0x6), label_end_94			# LN: 162 | 
cline_162_0:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 163 | 
	a1 = xmem[i0]; a0 = 0			# LN: 163, 163 | 
	a1 = a1 << 4			# LN: 163 | 
	i0 = a1			# LN: 163 | 
	uhalfword(a1) = (0x10)			# LN: 163 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 163 | 
	call (_memset)			# LN: 163 | 
cline_163_0:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 162 | 
	a0 = xmem[i0]			# LN: 162 | 
	uhalfword(a1) = (0x1)			# LN: 162 | 
	a0 = a0 + a1			# LN: 162 | 
	i0 = i7 - (0x3)			# LN: 162 | 
label_end_94:			# LN: 162 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 162 | 
cline_162_1:			/* LN: 167 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (259 - 0)			# LN: 167 | 
	i1 = (0) + (_string_const_0)			# LN: 167 | 
	call (_strcpy)			# LN: 167 | 
cline_167_0:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (259 - 0)			# LN: 168 | 
	call (_cl_wavread_open)			# LN: 168 | 
	AnyReg(i0, a0h)			# LN: 168 | 
	i1 = i7 - (0x104)			# LN: 168 | 
	xmem[i1] = i0			# LN: 168 | 
cline_168_0:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 169 | 
	a0 = xmem[i0]			# LN: 169 | 
	a0 & a0			# LN: 169 | 
	if (a != 0) jmp (else_4)			# LN: 169 | 
cline_169_0:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 171 | 
	call (_printf)			# LN: 171 | 
cline_171_0:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 172 | 
	jmp (__epilogue_224)			# LN: 172 | 
cline_172_0:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 180 | 
	i0 = xmem[i0]			# LN: 180 | 
	call (_cl_wavread_getnchannels)			# LN: 180 | 
	i0 = i7 - (0x105)			# LN: 180 | 
	xmem[i0] = a0h			# LN: 180 | 
cline_180_0:			/* LN: 181 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 181 | 
	i0 = xmem[i0]			# LN: 181 | 
	call (_cl_wavread_bits_per_sample)			# LN: 181 | 
	i0 = i7 - (0x106)			# LN: 181 | 
	xmem[i0] = a0h			# LN: 181 | 
cline_181_0:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 182 | 
	i0 = xmem[i0]			# LN: 182 | 
	call (_cl_wavread_frame_rate)			# LN: 182 | 
	i0 = i7 - (0x107)			# LN: 182 | 
	xmem[i0] = a0h			# LN: 182 | 
cline_182_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 183 | 
	i0 = xmem[i0]			# LN: 183 | 
	call (_cl_wavread_number_of_frames)			# LN: 183 | 
	i0 = i7 - (0x108)			# LN: 183 | 
	xmem[i0] = a0h			# LN: 183 | 
cline_183_0:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 188 | 
	a0 & a0			# LN: 188 | 
	if (a != 0) jmp (else_5)			# LN: 188 | 
cline_188_0:			/* LN: 189 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 189 | 
	uhalfword(a0) = (0x2)			# LN: 189 | 
	xmem[i0] = a0h			# LN: 189 | 
	jmp (endif_5)			# LN: 189 | 
cline_189_0:			/* LN: 190 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 190 | 
	uhalfword(a1) = (0x1)			# LN: 190 | 
	a0 - a1			# LN: 190 | 
	if (a != 0) jmp (else_6)			# LN: 190 | 
cline_190_0:			/* LN: 191 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 191 | 
	uhalfword(a0) = (0x3)			# LN: 191 | 
	xmem[i0] = a0h			# LN: 191 | 
	jmp (endif_6)			# LN: 191 | 
cline_191_0:			/* LN: 192 | CYCLE: 0 | RULES: () */ 
else_6:			/* LN: 190 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 192 | 
	uhalfword(a1) = (0x2)			# LN: 192 | 
	a0 - a1			# LN: 192 | 
	if (a != 0) jmp (else_7)			# LN: 192 | 
cline_192_0:			/* LN: 193 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 193 | 
	uhalfword(a0) = (0x2)			# LN: 193 | 
	xmem[i0] = a0h			# LN: 193 | 
	jmp (endif_7)			# LN: 193 | 
cline_193_0:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
else_7:			/* LN: 192 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 194 | 
	uhalfword(a1) = (0x3)			# LN: 194 | 
	a0 - a1			# LN: 194 | 
	if (a != 0) jmp (else_8)			# LN: 194 | 
cline_194_0:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 195 | 
	uhalfword(a0) = (0x3)			# LN: 195 | 
	xmem[i0] = a0h			# LN: 195 | 
	jmp (endif_8)			# LN: 195 | 
cline_195_0:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
else_8:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x4)			# LN: 196 | 
	xmem[_state + 135] = a0h			# LN: 196 | 
	uhalfword(a0) = (0x1)			# LN: 196 | 
	a0 & a0			# LN: 196 | 
	if (a == 0) jmp (else_9)			# LN: 196 | 
cline_196_0:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 197 | 
	uhalfword(a0) = (0x5)			# LN: 197 | 
	xmem[i0] = a0h			# LN: 197 | 
	jmp (endif_9)			# LN: 197 | 
cline_197_0:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
endif_6:			/* LN: 190 | CYCLE: 0 | RULES: () */ 
endif_7:			/* LN: 192 | CYCLE: 0 | RULES: () */ 
endif_8:			/* LN: 194 | CYCLE: 0 | RULES: () */ 
endif_9:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
else_9:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (521 - 0)			# LN: 198 | 
	i1 = (0) + (_string_const_2)			# LN: 198 | 
	call (_strcpy)			# LN: 198 | 
cline_198_0:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (521 - 0)			# LN: 199 | 
	i1 = i7 - (0x106)			# LN: 199 | 
	a0 = xmem[i1]			# LN: 199 | 
	i1 = i7 - (0x109)			# LN: 199 | 
	a1 = xmem[i1]			# LN: 199 | 
	i1 = i7 - (0x107)			# LN: 199 | 
	b0 = xmem[i1]			# LN: 199 | 
	call (_cl_wavwrite_open)			# LN: 199 | 
	AnyReg(i0, a0h)			# LN: 199 | 
	i1 = i7 - (0x20a)			# LN: 199 | 
	xmem[i1] = i0			# LN: 199 | 
cline_199_0:			/* LN: 200 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 200 | 
	a0 = xmem[i0]			# LN: 200 | 
	a0 & a0			# LN: 200 | 
	if (a != 0) jmp (else_10)			# LN: 200 | 
cline_200_0:			/* LN: 202 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_3)			# LN: 202 | 
	call (_printf)			# LN: 202 | 
cline_202_0:			/* LN: 203 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 203 | 
	jmp (__epilogue_224)			# LN: 203 | 
cline_203_0:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
endif_10:			/* LN: 200 | CYCLE: 0 | RULES: () */ 
else_10:			/* LN: 200 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 216 | 
	a0 = 0			# LN: 216 | 
	xmem[i0] = a0h			# LN: 216 | 
for_3:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x108)			# LN: 216 | 
	a0 = xmem[i0]			# LN: 216 | 
	uhalfword(a1) = (0x10)			# LN: 216 | 
	call (__div)			# LN: 216 | 
	i0 = i7 - (0x20b)			# LN: 216 | 
	a1 = xmem[i0]			# LN: 216 | 
	a1 - a0			# LN: 216 | 
	if (a >= 0) jmp (for_end_3)			# LN: 216 | 
cline_216_0:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 218 | 
	a0 = 0			# LN: 218 | 
	xmem[i0] = a0h			# LN: 218 | 
	do (0x10), label_end_95			# LN: 218 | 
cline_218_0:			/* LN: 220 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 220 | 
	a0 = 0			# LN: 220 | 
	xmem[i0] = a0h			# LN: 220 | 
for_5:			/* LN: 220 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 220 | 
	a0 = xmem[i0]			# LN: 220 | 
	i0 = i7 - (0x105)			# LN: 220 | 
	a1 = xmem[i0]			# LN: 220 | 
	a0 - a1			# LN: 220 | 
	if (a >= 0) jmp (for_end_5)			# LN: 220 | 
cline_220_0:			/* LN: 222 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 222 | 
	i0 = xmem[i0]			# LN: 222 | 
	call (_cl_wavread_recvsample)			# LN: 222 | 
	i0 = i7 - (0x20e)			# LN: 222 | 
	xmem[i0] = a0h			# LN: 222 | 
cline_222_0:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 223 | 
	a0 = xmem[i0]			# LN: 223 | 
	a0 = a0 << 4			# LN: 223 | 
	i0 = a0			# LN: 223 | 
	i1 = i7 - (0x20c)			# LN: 223 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 223 | 
	a0 = xmem[i1]			# LN: 223 | 
	a1 = i0			# LN: 223 | 
	a0 = a1 + a0			# LN: 223 | 
	AnyReg(i0, a0h)			# LN: 223 | 
	i1 = i7 - (0x20e)			# LN: 223 | 
	a0 = xmem[i1]			# LN: 223 | 
	xmem[i0] = a0h			# LN: 223 | 
cline_223_0:			/* LN: 220 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 220 | 
	a0 = xmem[i0]			# LN: 220 | 
	uhalfword(a1) = (0x1)			# LN: 220 | 
	a0 = a0 + a1			# LN: 220 | 
	i0 = i7 - (0x20d)			# LN: 220 | 
	xmem[i0] = a0h			# LN: 220 | 
	jmp (for_5)			# LN: 220 | 
cline_220_1:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 220 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 218 | 
	a0 = xmem[i0]			# LN: 218 | 
	uhalfword(a1) = (0x1)			# LN: 218 | 
	a0 = a0 + a1			# LN: 218 | 
	i0 = i7 - (0x20c)			# LN: 218 | 
label_end_95:			# LN: 218 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 218 | 
cline_218_1:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
	call (_processing)			# LN: 227 | 
cline_227_0:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 230 | 
	a0 = 0			# LN: 230 | 
	xmem[i0] = a0h			# LN: 230 | 
	do (0x10), label_end_96			# LN: 230 | 
cline_230_0:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 232 | 
	a0 & a0			# LN: 232 | 
	if (a != 0) jmp (else_11)			# LN: 232 | 
cline_232_0:			/* LN: 234 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 234 | 
	a0 = xmem[i0]			# LN: 234 | 
	i0 = a0			# LN: 234 | 
	i1 = i7 - (0x20e)			# LN: 234 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 234 | 
	a0 = xmem[i0]			# LN: 234 | 
	xmem[i1] = a0h			# LN: 234 | 
cline_234_0:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 235 | 
	i1 = i7 - (0x20e)			# LN: 235 | 
	a0 = xmem[i1]			# LN: 235 | 
	i0 = xmem[i0]			# LN: 235 | 
	call (_cl_wavwrite_sendsample)			# LN: 235 | 
cline_235_0:			/* LN: 236 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 236 | 
	a0 = xmem[i0]			# LN: 236 | 
	i0 = a0			# LN: 236 | 
	i1 = i7 - (0x20e)			# LN: 236 | 
	i0 = i0 + (_sampleBuffer + 32)			# LN: 236 | 
	a0 = xmem[i0]			# LN: 236 | 
	xmem[i1] = a0h			# LN: 236 | 
cline_236_0:			/* LN: 237 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 237 | 
	i1 = i7 - (0x20e)			# LN: 237 | 
	a0 = xmem[i1]			# LN: 237 | 
	i0 = xmem[i0]			# LN: 237 | 
	call (_cl_wavwrite_sendsample)			# LN: 237 | 
	jmp (endif_11)			# LN: 237 | 
cline_237_0:			/* LN: 239 | CYCLE: 0 | RULES: () */ 
else_11:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 239 | 
	uhalfword(a1) = (0x1)			# LN: 239 | 
	a0 - a1			# LN: 239 | 
	if (a != 0) jmp (else_12)			# LN: 239 | 
cline_239_0:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 241 | 
	a0 = xmem[i0]			# LN: 241 | 
	i0 = a0			# LN: 241 | 
	i1 = i7 - (0x20e)			# LN: 241 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 241 | 
	a0 = xmem[i0]			# LN: 241 | 
	xmem[i1] = a0h			# LN: 241 | 
cline_241_0:			/* LN: 242 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 242 | 
	i1 = i7 - (0x20e)			# LN: 242 | 
	a0 = xmem[i1]			# LN: 242 | 
	i0 = xmem[i0]			# LN: 242 | 
	call (_cl_wavwrite_sendsample)			# LN: 242 | 
cline_242_0:			/* LN: 244 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 244 | 
	a0 = xmem[i0]			# LN: 244 | 
	i0 = a0			# LN: 244 | 
	i1 = i7 - (0x20e)			# LN: 244 | 
	i0 = i0 + (_sampleBuffer + 32)			# LN: 244 | 
	a0 = xmem[i0]			# LN: 244 | 
	xmem[i1] = a0h			# LN: 244 | 
cline_244_0:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 245 | 
	i1 = i7 - (0x20e)			# LN: 245 | 
	a0 = xmem[i1]			# LN: 245 | 
	i0 = xmem[i0]			# LN: 245 | 
	call (_cl_wavwrite_sendsample)			# LN: 245 | 
cline_245_0:			/* LN: 247 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 247 | 
	a0 = xmem[i0]			# LN: 247 | 
	i0 = a0			# LN: 247 | 
	i1 = i7 - (0x20e)			# LN: 247 | 
	i0 = i0 + (_sampleBuffer + 80)			# LN: 247 | 
	a0 = xmem[i0]			# LN: 247 | 
	xmem[i1] = a0h			# LN: 247 | 
cline_247_0:			/* LN: 248 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 248 | 
	i1 = i7 - (0x20e)			# LN: 248 | 
	a0 = xmem[i1]			# LN: 248 | 
	i0 = xmem[i0]			# LN: 248 | 
	call (_cl_wavwrite_sendsample)			# LN: 248 | 
	jmp (endif_12)			# LN: 248 | 
cline_248_0:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
else_12:			/* LN: 239 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 250 | 
	uhalfword(a1) = (0x2)			# LN: 250 | 
	a0 - a1			# LN: 250 | 
	if (a != 0) jmp (else_13)			# LN: 250 | 
cline_250_0:			/* LN: 252 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 252 | 
	a0 = xmem[i0]			# LN: 252 | 
	i0 = a0			# LN: 252 | 
	i1 = i7 - (0x20e)			# LN: 252 | 
	i0 = i0 + (_sampleBuffer + 48)			# LN: 252 | 
	a0 = xmem[i0]			# LN: 252 | 
	xmem[i1] = a0h			# LN: 252 | 
cline_252_0:			/* LN: 253 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 253 | 
	i1 = i7 - (0x20e)			# LN: 253 | 
	a0 = xmem[i1]			# LN: 253 | 
	i0 = xmem[i0]			# LN: 253 | 
	call (_cl_wavwrite_sendsample)			# LN: 253 | 
cline_253_0:			/* LN: 255 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 255 | 
	a0 = xmem[i0]			# LN: 255 | 
	i0 = a0			# LN: 255 | 
	i1 = i7 - (0x20e)			# LN: 255 | 
	i0 = i0 + (_sampleBuffer + 64)			# LN: 255 | 
	a0 = xmem[i0]			# LN: 255 | 
	xmem[i1] = a0h			# LN: 255 | 
cline_255_0:			/* LN: 256 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 256 | 
	i1 = i7 - (0x20e)			# LN: 256 | 
	a0 = xmem[i1]			# LN: 256 | 
	i0 = xmem[i0]			# LN: 256 | 
	call (_cl_wavwrite_sendsample)			# LN: 256 | 
	jmp (endif_13)			# LN: 256 | 
cline_256_0:			/* LN: 258 | CYCLE: 0 | RULES: () */ 
else_13:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 258 | 
	uhalfword(a1) = (0x3)			# LN: 258 | 
	a0 - a1			# LN: 258 | 
	if (a != 0) jmp (else_14)			# LN: 258 | 
cline_258_0:			/* LN: 260 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 260 | 
	a0 = xmem[i0]			# LN: 260 | 
	i0 = a0			# LN: 260 | 
	i1 = i7 - (0x20e)			# LN: 260 | 
	i0 = i0 + (_sampleBuffer + 48)			# LN: 260 | 
	a0 = xmem[i0]			# LN: 260 | 
	xmem[i1] = a0h			# LN: 260 | 
cline_260_0:			/* LN: 261 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 261 | 
	i1 = i7 - (0x20e)			# LN: 261 | 
	a0 = xmem[i1]			# LN: 261 | 
	i0 = xmem[i0]			# LN: 261 | 
	call (_cl_wavwrite_sendsample)			# LN: 261 | 
cline_261_0:			/* LN: 262 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 262 | 
	a0 = xmem[i0]			# LN: 262 | 
	i0 = a0			# LN: 262 | 
	i1 = i7 - (0x20e)			# LN: 262 | 
	i0 = i0 + (_sampleBuffer + 64)			# LN: 262 | 
	a0 = xmem[i0]			# LN: 262 | 
	xmem[i1] = a0h			# LN: 262 | 
cline_262_0:			/* LN: 263 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 263 | 
	i1 = i7 - (0x20e)			# LN: 263 | 
	a0 = xmem[i1]			# LN: 263 | 
	i0 = xmem[i0]			# LN: 263 | 
	call (_cl_wavwrite_sendsample)			# LN: 263 | 
cline_263_0:			/* LN: 264 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 264 | 
	a0 = xmem[i0]			# LN: 264 | 
	i0 = a0			# LN: 264 | 
	i1 = i7 - (0x20e)			# LN: 264 | 
	i0 = i0 + (_sampleBuffer + 80)			# LN: 264 | 
	a0 = xmem[i0]			# LN: 264 | 
	xmem[i1] = a0h			# LN: 264 | 
cline_264_0:			/* LN: 265 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 265 | 
	i1 = i7 - (0x20e)			# LN: 265 | 
	a0 = xmem[i1]			# LN: 265 | 
	i0 = xmem[i0]			# LN: 265 | 
	call (_cl_wavwrite_sendsample)			# LN: 265 | 
	jmp (endif_14)			# LN: 265 | 
cline_265_0:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
else_14:			/* LN: 258 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_state + 135]			# LN: 267 | 
	uhalfword(a1) = (0x4)			# LN: 267 | 
	a0 - a1			# LN: 267 | 
	if (a != 0) jmp (else_15)			# LN: 267 | 
cline_267_0:			/* LN: 269 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 269 | 
	a0 = xmem[i0]			# LN: 269 | 
	i0 = a0			# LN: 269 | 
	i1 = i7 - (0x20e)			# LN: 269 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 269 | 
	a0 = xmem[i0]			# LN: 269 | 
	xmem[i1] = a0h			# LN: 269 | 
cline_269_0:			/* LN: 270 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 270 | 
	i1 = i7 - (0x20e)			# LN: 270 | 
	a0 = xmem[i1]			# LN: 270 | 
	i0 = xmem[i0]			# LN: 270 | 
	call (_cl_wavwrite_sendsample)			# LN: 270 | 
cline_270_0:			/* LN: 272 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 272 | 
	a0 = xmem[i0]			# LN: 272 | 
	i0 = a0			# LN: 272 | 
	i1 = i7 - (0x20e)			# LN: 272 | 
	i0 = i0 + (_sampleBuffer + 16)			# LN: 272 | 
	a0 = xmem[i0]			# LN: 272 | 
	xmem[i1] = a0h			# LN: 272 | 
cline_272_0:			/* LN: 273 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 273 | 
	i1 = i7 - (0x20e)			# LN: 273 | 
	a0 = xmem[i1]			# LN: 273 | 
	i0 = xmem[i0]			# LN: 273 | 
	call (_cl_wavwrite_sendsample)			# LN: 273 | 
cline_273_0:			/* LN: 274 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 274 | 
	a0 = xmem[i0]			# LN: 274 | 
	i0 = a0			# LN: 274 | 
	i1 = i7 - (0x20e)			# LN: 274 | 
	i0 = i0 + (_sampleBuffer + 32)			# LN: 274 | 
	a0 = xmem[i0]			# LN: 274 | 
	xmem[i1] = a0h			# LN: 274 | 
cline_274_0:			/* LN: 275 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 275 | 
	i1 = i7 - (0x20e)			# LN: 275 | 
	a0 = xmem[i1]			# LN: 275 | 
	i0 = xmem[i0]			# LN: 275 | 
	call (_cl_wavwrite_sendsample)			# LN: 275 | 
cline_275_0:			/* LN: 277 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 277 | 
	a0 = xmem[i0]			# LN: 277 | 
	i0 = a0			# LN: 277 | 
	i1 = i7 - (0x20e)			# LN: 277 | 
	i0 = i0 + (_sampleBuffer + 48)			# LN: 277 | 
	a0 = xmem[i0]			# LN: 277 | 
	xmem[i1] = a0h			# LN: 277 | 
cline_277_0:			/* LN: 278 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 278 | 
	i1 = i7 - (0x20e)			# LN: 278 | 
	a0 = xmem[i1]			# LN: 278 | 
	i0 = xmem[i0]			# LN: 278 | 
	call (_cl_wavwrite_sendsample)			# LN: 278 | 
cline_278_0:			/* LN: 280 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 280 | 
	a0 = xmem[i0]			# LN: 280 | 
	i0 = a0			# LN: 280 | 
	i1 = i7 - (0x20e)			# LN: 280 | 
	i0 = i0 + (_sampleBuffer + 64)			# LN: 280 | 
	a0 = xmem[i0]			# LN: 280 | 
	xmem[i1] = a0h			# LN: 280 | 
cline_280_0:			/* LN: 281 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 281 | 
	i1 = i7 - (0x20e)			# LN: 281 | 
	a0 = xmem[i1]			# LN: 281 | 
	i0 = xmem[i0]			# LN: 281 | 
	call (_cl_wavwrite_sendsample)			# LN: 281 | 
	jmp (endif_15)			# LN: 281 | 
cline_281_0:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 283 | CYCLE: 0 | RULES: () */ 
endif_11:			/* LN: 232 | CYCLE: 0 | RULES: () */ 
endif_12:			/* LN: 239 | CYCLE: 0 | RULES: () */ 
endif_13:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
endif_14:			/* LN: 258 | CYCLE: 0 | RULES: () */ 
endif_15:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
else_15:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 230 | 
	a0 = xmem[i0]			# LN: 230 | 
	uhalfword(a1) = (0x1)			# LN: 230 | 
	a0 = a0 + a1			# LN: 230 | 
	i0 = i7 - (0x20c)			# LN: 230 | 
label_end_96:			# LN: 230 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 230 | 
cline_230_1:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 284 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 216 | 
	a0 = xmem[i0]			# LN: 216 | 
	uhalfword(a1) = (0x1)			# LN: 216 | 
	a0 = a0 + a1			# LN: 216 | 
	i0 = i7 - (0x20b)			# LN: 216 | 
	xmem[i0] = a0h			# LN: 216 | 
	jmp (for_3)			# LN: 216 | 
cline_216_1:			/* LN: 289 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 289 | 
	i0 = xmem[i0]			# LN: 289 | 
	call (_cl_wavread_close)			# LN: 289 | 
cline_289_0:			/* LN: 290 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 290 | 
	i0 = xmem[i0]			# LN: 290 | 
	call (_cl_wavwrite_close)			# LN: 290 | 
cline_290_0:			/* LN: 293 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 293 | 
	jmp (__epilogue_224)			# LN: 293 | 
cline_293_0:			/* LN: 294 | CYCLE: 0 | RULES: () */ 
__epilogue_224:			/* LN: 294 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20e)			# LN: 294 | 
	i7 -= 1			# LN: 294 | 
	ret			# LN: 294 | 



_processing:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 59 | 
	i7 += 1			# LN: 59 | 
	i7 = i7 + (0x15)			# LN: 59 | 
cline_59_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 63 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 63 | 
	xmem[i0] = a0			# LN: 63 | 
cline_63_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 64 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 64 | 
	xmem[i0] = a0			# LN: 64 | 
cline_64_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 65 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 65 | 
	xmem[i0] = a0			# LN: 65 | 
cline_65_0:			/* LN: 66 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 66 | 
	uhalfword(a0) = (_sampleBuffer + 32)			# LN: 66 | 
	xmem[i0] = a0			# LN: 66 | 
cline_66_0:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 67 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 67 | 
	xmem[i0] = a0			# LN: 67 | 
cline_67_0:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 68 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 68 | 
	xmem[i0] = a0			# LN: 68 | 
cline_68_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 69 | 
	uhalfword(a0) = (_sampleBuffer + 64)			# LN: 69 | 
	xmem[i0] = a0			# LN: 69 | 
cline_69_0:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 70 | 
	uhalfword(a0) = (_sampleBuffer + 80)			# LN: 70 | 
	xmem[i0] = a0			# LN: 70 | 
cline_70_0:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 73 | 
	a0 = 0			# LN: 73 | 
	xmem[i0] = a0h			# LN: 73 | 
	do (0x10), label_end_92			# LN: 73 | 
cline_73_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 75 | 
	uhalfword(a0) = (_state + 131)			# LN: 75 | 
	xmem[i0] = a0			# LN: 75 | 
cline_75_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xb)			# LN: 76 | 
	uhalfword(a0) = (_state + 133)			# LN: 76 | 
	xmem[i0] = a0			# LN: 76 | 
cline_76_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xc)			# LN: 77 | 
	uhalfword(a0) = (_state + 3)			# LN: 77 | 
	xmem[i0] = a0			# LN: 77 | 
cline_77_0:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 83 | 
	i0 = xmem[i0]			# LN: 83 | 
	i1 = i7 - (0xd)			# LN: 83 | 
	a0 = xmem[i0]			# LN: 83 | 
	xmem[i1] = a0h			# LN: 83 | 
	i0 = i7 - (0x1)			# LN: 83 | 
	i0 = xmem[i0]			# LN: 83 | 
	i1 = i7 - (0x1)			# LN: 83 | 
	i0 += 1			# LN: 83 | 
	xmem[i1] = i0			# LN: 83 | 
cline_83_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 84 | 
	i0 = xmem[i0]			# LN: 84 | 
	i1 = i7 - (0xe)			# LN: 84 | 
	a0 = xmem[i0]			# LN: 84 | 
	xmem[i1] = a0h			# LN: 84 | 
	i0 = i7 - (0x2)			# LN: 84 | 
	i0 = xmem[i0]			# LN: 84 | 
	i1 = i7 - (0x2)			# LN: 84 | 
	i0 += 1			# LN: 84 | 
	xmem[i1] = i0			# LN: 84 | 
cline_84_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 131]			# LN: 87 | 
	i1 = i7 - (0xd)			# LN: 87 | 
	a0 = xmem[i1]			# LN: 87 | 
	xmem[i0] = a0h			# LN: 87 | 
cline_87_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 131]			# LN: 88 | 
	a0 = i0			# LN: 88 | 
	uhalfword(a1) = (_state + 66)			# LN: 88 | 
	a0 - a1			# LN: 88 | 
	if (a != 0) jmp (else_0)			# LN: 88 | 
cline_88_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 3)			# LN: 89 | 
	xmem[_state + 131] = i0			# LN: 89 | 
	jmp (endif_0)			# LN: 89 | 
cline_89_0:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 131]			# LN: 91 | 
	nop #empty cycle
	i0 += 1			# LN: 91 | 
	xmem[_state + 131] = i0			# LN: 91 | 
cline_91_0:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 92 | 
	uhalfword(a0) = (_state + 132)			# LN: 92 | 
	xmem[i0] = a0			# LN: 92 | 
cline_92_0:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 133]			# LN: 94 | 
	i1 = i7 - (0xf)			# LN: 94 | 
	a0 = xmem[i0]			# LN: 94 | 
	xmem[i1] = a0h			# LN: 94 | 
cline_94_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 133]			# LN: 95 | 
	a0 = i0			# LN: 95 | 
	uhalfword(a1) = (_state + 66)			# LN: 95 | 
	a0 - a1			# LN: 95 | 
	if (a != 0) jmp (else_1)			# LN: 95 | 
cline_95_0:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 3)			# LN: 96 | 
	xmem[_state + 133] = i0			# LN: 96 | 
	jmp (endif_1)			# LN: 96 | 
cline_96_0:			/* LN: 98 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 133]			# LN: 98 | 
	nop #empty cycle
	i0 += 1			# LN: 98 | 
	xmem[_state + 133] = i0			# LN: 98 | 
cline_98_0:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xb)			# LN: 99 | 
	uhalfword(a0) = (_state + 134)			# LN: 99 | 
	xmem[i0] = a0			# LN: 99 | 
cline_99_0:			/* LN: 100 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xc)			# LN: 100 | 
	uhalfword(a0) = (_state + 67)			# LN: 100 | 
	xmem[i0] = a0			# LN: 100 | 
cline_100_0:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 132]			# LN: 103 | 
	i1 = i7 - (0xe)			# LN: 103 | 
	a0 = xmem[i1]			# LN: 103 | 
	xmem[i0] = a0h			# LN: 103 | 
cline_103_0:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 132]			# LN: 104 | 
	a0 = i0			# LN: 104 | 
	uhalfword(a1) = (_state + 130)			# LN: 104 | 
	a0 - a1			# LN: 104 | 
	if (a != 0) jmp (else_2)			# LN: 104 | 
cline_104_0:			/* LN: 105 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 67)			# LN: 105 | 
	xmem[_state + 132] = i0			# LN: 105 | 
	jmp (endif_2)			# LN: 105 | 
cline_105_0:			/* LN: 107 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 132]			# LN: 107 | 
	nop #empty cycle
	i0 += 1			# LN: 107 | 
	xmem[_state + 132] = i0			# LN: 107 | 
cline_107_0:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xa)			# LN: 108 | 
	uhalfword(a0) = (_state + 133)			# LN: 108 | 
	xmem[i0] = a0			# LN: 108 | 
cline_108_0:			/* LN: 110 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 134]			# LN: 110 | 
	i1 = i7 - (0x10)			# LN: 110 | 
	a0 = xmem[i0]			# LN: 110 | 
	xmem[i1] = a0h			# LN: 110 | 
cline_110_0:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 134]			# LN: 111 | 
	a0 = i0			# LN: 111 | 
	uhalfword(a1) = (_state + 130)			# LN: 111 | 
	a0 - a1			# LN: 111 | 
	if (a != 0) jmp (else_3)			# LN: 111 | 
cline_111_0:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 67)			# LN: 112 | 
	xmem[_state + 134] = i0			# LN: 112 | 
	jmp (endif_3)			# LN: 112 | 
cline_112_0:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	i0 = xmem[_state + 134]			# LN: 114 | 
	nop #empty cycle
	i0 += 1			# LN: 114 | 
	xmem[_state + 134] = i0			# LN: 114 | 
cline_114_0:			/* LN: 115 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xb)			# LN: 115 | 
	uhalfword(a0) = (_state + 135)			# LN: 115 | 
	xmem[i0] = a0			# LN: 115 | 
cline_115_0:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xc)			# LN: 116 | 
	uhalfword(a0) = (_state + 131)			# LN: 116 | 
	xmem[i0] = a0			# LN: 116 | 
cline_116_0:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xd)			# LN: 119 | 
	a0 = xmem[i0]			# LN: 119 | 
	i0 = i7 - (0xe)			# LN: 119 | 
	a1 = xmem[i0]			# LN: 119 | 
	a0 = a0 + a1			# LN: 119 | 
	x0 = a0h			# LN: 119 | 
	x1 = xmem[_state + 2]			# LN: 119 | 
	a0 = x0 * x1			# LN: 119 | 
	i0 = i7 - (0x11)			# LN: 119 | 
	xmem[i0] = a0			# LN: 119 | 
cline_119_0:			/* LN: 123 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0xf)			# LN: 123 | 
	x0 = xmem[i0]			# LN: 123 | 
	x1 = xmem[_m2dB + 0]			# LN: 123 | 
	a0 = x0 * x1			# LN: 123 | 
	i0 = i7 - (0x12)			# LN: 123 | 
	xmem[i0] = a0			# LN: 123 | 
cline_123_0:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x11)			# LN: 124 | 
	x0 = xmem[i0]			# LN: 124 | 
	x1 = xmem[_m6dB + 0]			# LN: 124 | 
	a0 = x0 * x1			# LN: 124 | 
	i0 = i7 - (0x13)			# LN: 124 | 
	xmem[i0] = a0			# LN: 124 | 
cline_124_0:			/* LN: 125 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x11)			# LN: 125 | 
	x0 = xmem[i0]			# LN: 125 | 
	x1 = xmem[_m6dB + 0]			# LN: 125 | 
	a0 = x0 * x1			# LN: 125 | 
	i0 = i7 - (0x14)			# LN: 125 | 
	xmem[i0] = a0			# LN: 125 | 
cline_125_0:			/* LN: 126 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x10)			# LN: 126 | 
	x0 = xmem[i0]			# LN: 126 | 
	x1 = xmem[_m2dB + 0]			# LN: 126 | 
	a0 = x0 * x1			# LN: 126 | 
	i0 = i7 - (0x15)			# LN: 126 | 
	xmem[i0] = a0			# LN: 126 | 
cline_126_0:			/* LN: 128 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 128 | 
	i0 = xmem[i0]			# LN: 128 | 
	i1 = i7 - (0x13)			# LN: 128 | 
	a0 = xmem[i1]			# LN: 128 | 
	xmem[i0] = a0h			# LN: 128 | 
	i0 = i7 - (0x3)			# LN: 128 | 
	i0 = xmem[i0]			# LN: 128 | 
	i1 = i7 - (0x3)			# LN: 128 | 
	i0 += 1			# LN: 128 | 
	xmem[i1] = i0			# LN: 128 | 
cline_128_0:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 129 | 
	i0 = xmem[i0]			# LN: 129 | 
	i1 = i7 - (0x12)			# LN: 129 | 
	a0 = xmem[i1]			# LN: 129 | 
	i1 = i7 - (0x13)			# LN: 129 | 
	a1 = xmem[i1]			# LN: 129 | 
	a0 = a0 + a1			# LN: 129 | 
	xmem[i0] = a0h			# LN: 129 | 
	i0 = i7 - (0x6)			# LN: 129 | 
	i0 = xmem[i0]			# LN: 129 | 
	i1 = i7 - (0x6)			# LN: 129 | 
	i0 += 1			# LN: 129 | 
	xmem[i1] = i0			# LN: 129 | 
cline_129_0:			/* LN: 130 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 130 | 
	i0 = xmem[i0]			# LN: 130 | 
	i1 = i7 - (0x11)			# LN: 130 | 
	a0 = xmem[i1]			# LN: 130 | 
	xmem[i0] = a0h			# LN: 130 | 
	i0 = i7 - (0x5)			# LN: 130 | 
	i0 = xmem[i0]			# LN: 130 | 
	i1 = i7 - (0x5)			# LN: 130 | 
	i0 += 1			# LN: 130 | 
	xmem[i1] = i0			# LN: 130 | 
cline_130_0:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 131 | 
	i0 = xmem[i0]			# LN: 131 | 
	i1 = i7 - (0x11)			# LN: 131 | 
	a0 = xmem[i1]			# LN: 131 | 
	xmem[i0] = a0h			# LN: 131 | 
	i0 = i7 - (0x8)			# LN: 131 | 
	i0 = xmem[i0]			# LN: 131 | 
	i1 = i7 - (0x8)			# LN: 131 | 
	i0 += 1			# LN: 131 | 
	xmem[i1] = i0			# LN: 131 | 
cline_131_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 132 | 
	i0 = xmem[i0]			# LN: 132 | 
	i1 = i7 - (0x14)			# LN: 132 | 
	a0 = xmem[i1]			# LN: 132 | 
	i1 = i7 - (0x15)			# LN: 132 | 
	a1 = xmem[i1]			# LN: 132 | 
	a0 = a0 + a1			# LN: 132 | 
	xmem[i0] = a0h			# LN: 132 | 
	i0 = i7 - (0x7)			# LN: 132 | 
	i0 = xmem[i0]			# LN: 132 | 
	i1 = i7 - (0x7)			# LN: 132 | 
	i0 += 1			# LN: 132 | 
	xmem[i1] = i0			# LN: 132 | 
cline_132_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 133 | 
	i0 = xmem[i0]			# LN: 133 | 
	i1 = i7 - (0x14)			# LN: 133 | 
	a0 = xmem[i1]			# LN: 133 | 
	xmem[i0] = a0h			# LN: 133 | 
	i0 = i7 - (0x4)			# LN: 133 | 
	i0 = xmem[i0]			# LN: 133 | 
	i1 = i7 - (0x4)			# LN: 133 | 
	i0 += 1			# LN: 133 | 
	xmem[i1] = i0			# LN: 133 | 
cline_133_0:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 134 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x9)			# LN: 73 | 
	a0 = xmem[i0]			# LN: 73 | 
	uhalfword(a1) = (0x1)			# LN: 73 | 
	a0 = a0 + a1			# LN: 73 | 
	i0 = i7 - (0x9)			# LN: 73 | 
label_end_92:			# LN: 73 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 73 | 
cline_73_1:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_222)			# LN: 135 | 
__epilogue_222:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x15)			# LN: 135 | 
	i7 -= 1			# LN: 135 | 
	ret			# LN: 135 | 



_stateInit:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 39 | 
	i7 += 1			# LN: 39 | 
	i7 = i7 + (0x1)			# LN: 39 | 
cline_39_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 42 | 
	a0 = 0			# LN: 42 | 
	xmem[i0] = a0h			# LN: 42 | 
	do (0x40), label_end_93			# LN: 42 | 
cline_42_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 44 | 
	a0 = xmem[i0]; a1 = 0			# LN: 44, 44 | 
	i0 = a0			# LN: 44 | 
	nop #empty cycle
	i0 = i0 + (_state + 3)			# LN: 44 | 
	xmem[i0] = a1h			# LN: 44 | 
cline_44_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 45 | 
	a0 = xmem[i0]; a1 = 0			# LN: 45, 45 | 
	i0 = a0			# LN: 45 | 
	nop #empty cycle
	i0 = i0 + (_state + 67)			# LN: 45 | 
	xmem[i0] = a1h			# LN: 45 | 
cline_45_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 42 | 
	a0 = xmem[i0]			# LN: 42 | 
	uhalfword(a1) = (0x1)			# LN: 42 | 
	a0 = a0 + a1			# LN: 42 | 
	i0 = i7 - (0x1)			# LN: 42 | 
label_end_93:			# LN: 42 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 42 | 
cline_42_1:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 66)			# LN: 48 | 
	xmem[_state + 131] = i0			# LN: 48 | 
cline_48_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 130)			# LN: 49 | 
	xmem[_state + 132] = i0			# LN: 49 | 
cline_49_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 18)			# LN: 51 | 
	xmem[_state + 133] = i0			# LN: 51 | 
cline_51_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_state + 82)			# LN: 52 | 
	xmem[_state + 134] = i0			# LN: 52 | 
cline_52_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_220)			# LN: 57 | 
__epilogue_220:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 57 | 
	i7 -= 1			# LN: 57 | 
	ret			# LN: 57 | 
