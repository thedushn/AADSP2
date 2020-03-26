#pragma once
#include "stdfix_emu.h"

#define BLOCK_SIZE 16
//broj kanala 
#define NUM_CHANNELS 8
#include "stdfix_emu.h"
/* DSP type definitions */
typedef short DSPshort;					/* DSP integer */
typedef unsigned short DSPushort;		/* DSP unsigned integer */
typedef int DSPint;						/* native integer */
typedef double DSPfract;


static DSPfract M_PI = 6.28318530717958647692;// fract_num destroys numbers 
static DSPfract K1;
static DSPfract K2;
static DSPfract Fcl;
static DSPfract Fch;
static DSPfract alpha1;
static DSPfract alpha2;

