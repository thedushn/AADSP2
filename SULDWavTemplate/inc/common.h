#ifndef _COMMON_H
#define _COMMON_H

#include "stdfix_emu.h"

/* Basic constants */
#define BLOCK_SIZE 16
#define NUM_CHANNELS 8



/* DSP type definitions */
typedef short DSPshort;					/* DSP integer */
typedef unsigned short DSPushort;		/* DSP unsigned integer */
typedef int DSPint;						/* native integer */
typedef fract DSPfract;				    /* DSP fixed-point fractional */
typedef long_accum DSPaccum;			/* DSP fixed-point fractional */


#define M_PI  3.14159265358979323846

static DSPint Fcl;
static DSPint Fch;
static DSPfract alpha1 = FRACT_NUM(0.0);
static DSPfract alpha2 = FRACT_NUM(0.0);

DSPfract first_order_IIR(DSPfract input,__memX DSPfract* coefficients,__memX DSPfract* z_x,__memY DSPfract* z_y);
#endif //_COMMON_H
