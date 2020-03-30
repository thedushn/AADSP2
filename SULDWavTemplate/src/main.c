#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include <common.h>
#include <limits.h>
#include <math.h>
#include <circbuff.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>

__memX DSPfract K1=FRACT_NUM(0.0);
__memX DSPfract K2 = FRACT_NUM(0.0);

enum CHANNEL_NUM{

	OUT_1;
	OUT_2;
	OUT_3;
	OUT_4;
	OUT_5;
	OUT_6;
	OUT_7;
	OUT_8;
}

__memY DSPfract sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];

// Enable
__memX DSPint enable = 1;
//history
__memX static DSPfract test_p=FRACT_NUM(1.0);
__memX static DSPfract test_n=FRACT_NUM(-1.0);

__memX DSPfract z_xL[NUM_CHANNELS][2];
__memX DSPfract z_yL[NUM_CHANNELS][2];
__memX DSPfract z_xH[NUM_CHANNELS][2];
__memX DSPfract z_yH[NUM_CHANNELS][2];

__memX DSPfract __attribute__((__aligned__(4))) coeffL[4] = { FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) };
__memX DSPfract __attribute__((__aligned__(4)))  coeffH[4] = { FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) };



__memY DSPfract* sb_ptr0 ;
__memY DSPfract* sb_ptr1 = sampleBuffer[1];
__memY DSPfract* sb_ptr2 = sampleBuffer[2];
__memY DSPfract* sb_ptr3 = sampleBuffer[3];
__memY DSPfract* sb_ptr4 = sampleBuffer[4];
__memY DSPfract* sb_ptr5 = sampleBuffer[5];
__memY DSPfract* sb_ptr6 = sampleBuffer[6];
__memY DSPfract* sb_ptr7 = sampleBuffer[7];

void clip(long_fract *x) {

	if ( *x -test_p>0) {

		*x = test_p;
	}

	else if (*x-test_n<0) {
		*x = test_n;

	}
}
DSPaccum first_order_IIR(DSPfract input, __memX DSPfract* coefficients,__memX DSPfract* z_x,__memX DSPfract* z_y)
{
	long_fract temp;

	*z_x = input; /* Copy input to x[0] */
	temp = (*coefficients * *z_x);   /* B0 * x(n)     */


	temp += (*(coefficients + 1) * *(z_x + 1));    /* B1 * x(n-1) */


	temp -= (*(coefficients + 3) * *(z_y + 1));    /* A1 * y(n-1) */

	*z_y = (temp);

	/* Shuffle values along one place for next time */

	*(z_y + 1) = *(z_y);   /* y(n-1) = y(n)   */
	*(z_x + 1) = *z_x;   /* x(n-1) = x(n)   */

	return (DSPfract)(temp);
}
 DSPfract shelvingLP(DSPfract input, DSPfract* z_x, DSPfract* z_y) {

	DSPfract filtered_input;
	long_fract accuml;

	filtered_input = first_order_IIR(input, coeffL, z_x, z_y);
	accuml = (input + filtered_input) >>1;
	accuml += (input - filtered_input) *K1;
	clip(&accuml);


	return (DSPfract) (accuml);

}

 DSPfract shelvingHP(DSPfract input, DSPfract* z_x, DSPfract* z_y) {

	DSPfract filtered_input;
	long_fract accuml;

	filtered_input = first_order_IIR(input, coeffH, z_x, z_y);

	accuml = ((input - filtered_input) >>1);

	accuml += (input + filtered_input) *(K2);


	clip(&accuml);



	return ( DSPfract)(accuml);

}




void calculateShelvingCoeff(DSPfract c_alpha, DSPfract* output)
{
	DSPfract t1, t2;

	t1 = c_alpha;
	clip(&t1);

	t2 = -c_alpha;
	clip(&t2);

	*output = t1;

	*(output + 1) = test_n;
	*(output + 2) = test_p;
	*(output + 3) = t2;

}

void processing() {

	DSPint i;


	sb_ptr0 = sampleBuffer[0];
/*	sb_ptr1 = sampleBuffer[1];
	sb_ptr2 = sampleBuffer[2];
	sb_ptr3 = sampleBuffer[3];
	sb_ptr4 = sampleBuffer[4];
	sb_ptr5 = sampleBuffer[5];
	sb_ptr6 = sampleBuffer[6];
	sb_ptr7 = sampleBuffer[7];*/

	for (i = 0; i < BLOCK_SIZE; i++)
	{

		*sb_ptr0 =  shelvingHP(*sb_ptr0, *z_xH, *z_yH);
		*sb_ptr0 = shelvingLP(*sb_ptr0, *z_xL, *z_yL);
		*sb_ptr0++;
	/*	*sb_ptr1 = shelvingHP(*sb_ptr1, *(z_xH + 1), *(z_yH + 1));
		*sb_ptr1 = shelvingLP(*sb_ptr1, *(z_xL + 1), *(z_yL + 1));
		*sb_ptr1++;
		*sb_ptr2 = shelvingHP(*sb_ptr2, *(z_xH + 2), *(z_yH + 2));
		*sb_ptr2 = shelvingLP(*sb_ptr2, *(z_xL + 2), *(z_yL + 2));
		*sb_ptr2++;
		*sb_ptr3 = shelvingHP(*sb_ptr3, *(z_xH + 3), *(z_yH + 3));
		*sb_ptr3 = shelvingLP(*sb_ptr3, *(z_xL + 3), *(z_yL + 3));
		*sb_ptr3++;
		*sb_ptr4 = shelvingHP(*sb_ptr4, *(z_xH + 4), *(z_yH + 4));
		*sb_ptr4 = shelvingLP(*sb_ptr4, *(z_xL + 4), *(z_yL + 4));
		*sb_ptr4++;
		*sb_ptr5 = shelvingHP(*sb_ptr5, *(z_xH + 5), *(z_yH + 5));
		*sb_ptr5 = shelvingLP(*sb_ptr5, *(z_xL + 5), *(z_yL + 5));
		*sb_ptr5++;
		*sb_ptr6 = shelvingHP(*sb_ptr6, *(z_xH + 6), *(z_yH + 6));
		*sb_ptr6++ = shelvingLP(*sb_ptr6, *(z_xL + 6), *(z_yL + 6));
		*sb_ptr6++;
		*sb_ptr7 = shelvingHP(*sb_ptr7, *(z_xH + 7), *(z_yH + 7));
		*sb_ptr7 = shelvingLP(*sb_ptr7, *(z_xL + 7), *(z_yL + 7));
		*sb_ptr7++;
		*/



	}

};
int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;
	
    	char WavInputName[256];
    	char WavOutputName[256];
	
   static int nChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;
    int i,j;

	//  channel buffers
    for (i = 0; i < NUM_CHANNELS; i++) {
    		z_xH[i][0] = FRACT_NUM(0.0);
    		z_xH[i][1] = FRACT_NUM(0.0);

    		z_yH[i][0] = FRACT_NUM(0.0);
    		z_yH[i][1] = FRACT_NUM(0.0);


    		z_xL[i][0] = FRACT_NUM(0.0);
    		z_xL[i][1] = FRACT_NUM(0.0);

    		z_yL[i][0] = FRACT_NUM(0.0);
    		z_yL[i][1] = FRACT_NUM(0.0);




    		for (j = 0; j<BLOCK_SIZE; j++)
    		{
    			sampleBuffer[i][j] = FRACT_NUM(0.0);

    		}

    	}

    if (strcmp(argv[2], "0") != 0) {
    		enable = 1;
    	}
    	else {
    		enable = 0;
    	}


	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	 if(wav_in == NULL)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	nChannels = cl_wavread_getnchannels(wav_in);
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------
	
	// Open output wav file
	//-------------------------------------------------
	strcpy(WavOutputName,argv[1]);
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, nChannels, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
		K1=FRACT_NUM(0.5);
		K2=FRACT_NUM(0.5);
		K1= K1>>1;
		K2= K2>>1;


		alpha1=FRACT_NUM(0.5);
		alpha2=FRACT_NUM(-0.5);
			calculateShelvingCoeff(alpha1, coeffL);
			calculateShelvingCoeff(alpha2, coeffH);
	// Processing loop
	//-------------------------------------------------	
    {


		int k;
		int sample;
		static int h;
		h=iNumSamples/BLOCK_SIZE;
		// exact file length should be handled correctly...
		for(i=0; i<h; i++)
		{	
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{	
					sample = cl_wavread_recvsample(wav_in);
        			sampleBuffer[k][j] = rbits(sample);
				}
			}
			if(enable)
			processing();

			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{
					sample = bitsr(sampleBuffer[k][j]);
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}		
		}
	}
	
	// Close files
	//-------------------------------------------------	
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);
	//-------------------------------------------------	

    return 0;
 }
