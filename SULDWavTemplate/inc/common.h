#ifndef _COMMON_H
#define _COMMON_H

#include "stdfix_emu.h"

/* Basic constants */
#define BLOCK_SIZE 16
#define NUM_CHANNELS 6
#define DELAY_SIZE 64 // prvi stepen 2 veci od 48 (broj odbiraka ekvivalentan 1ms)

#define LEFT 0
#define CENTER 1
#define RIGHT 2
#define LEFT_SUR 3
#define RIGHT_SUR 4
#define LFE 5

/* DSP type definitions */
typedef short DSPshort;					/* DSP integer */
typedef unsigned short DSPushort;		/* DSP unsigned integer */
typedef int DSPint;						/* native integer */
typedef fract DSPfract;				    /* DSP fixed-point fractional */
typedef long_accum DSPaccum;			/* DSP fixed-point fractional */

#endif //_COMMON_H
