#ifndef COMMON_H
#define COMMON_H

#include "stdfix_emu.h"

/* Basic constants */
#define BLOCK_SIZE 16
//broj kanala 
#define NUM_CHANNELS 8       /* number of stages in filter calculus	*/

/* DSP type definitions */
typedef short DSPshort;					/* DSP integer */
typedef unsigned short DSPushort;		/* DSP unsigned integer */
typedef int DSPint;						/* native integer */
typedef fract DSPfract;				    /* DSP fixed-point fractional */
typedef long_accum DSPaccum;            /* DSP Accumulator */
typedef long_fract DSPfractl;

#define M_PI  6.28318530717958647692
static DSPfract K1=FRACT_NUM(0.0);
static DSPfract K2 = FRACT_NUM(0.0);
static DSPint Fcl;
static DSPint Fch;
static fract alpha1 = FRACT_NUM(0.0);
static DSPfract alpha2 = FRACT_NUM(0.0);

#endif
