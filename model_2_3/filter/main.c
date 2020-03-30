#define _CRT_SECURE_NO_WARNINGS 1
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>

#include "WAVheader.h"
#include "common.h"
#ifndef __CCC
#include "fixed_point_math.h"
#endif
#include "fixed_math.h"

#define cordic_1K 0x26DD3B6A
#define half_pi 0x6487ED51
#define MUL 1073741824.000000
#define CORDIC_NTAB 32
int cordic_ctab[] = { 0x3243F6A8, 0x1DAC6705, 0x0FADBAFC, 0x07F56EA6, 0x03FEAB76, 0x01FFD55B, 0x00FFFAAA, 0x007FFF55, 0x003FFFEA, 0x001FFFFD, 0x000FFFFF, 0x0007FFFF, 0x0003FFFF, 0x0001FFFF, 0x0000FFFF, 0x00007FFF, 0x00003FFF, 0x00001FFF, 0x00000FFF, 0x000007FF, 0x000003FF, 0x000001FF, 0x000000FF, 0x0000007F, 0x0000003F, 0x0000001F, 0x0000000F, 0x00000008, 0x00000004, 0x00000002, 0x00000001, 0x00000000, };

void cordic(int theta, int *s, int *c, int n)
{
	int k, d, tx, ty, tz;
	int x = cordic_1K, y = 0, z = theta;
	n = (n>CORDIC_NTAB) ? CORDIC_NTAB : n;
	for (k = 0; k<n; ++k)
	{
		d = z >> 31;
		//get sign. for other architectures, you might want to use the more portable version
		//d = z>=0 ? 0 : -1;
		tx = x - (((y >> k) ^ d) - d);
		ty = y + (((x >> k) ^ d) - d);
		tz = z - ((cordic_ctab[k] ^ d) - d);
		x = tx; y = ty; z = tz;
	}
	*c = x; *s = y;
}

// Enable
DSPint enable = 1;


DSPfract sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];
DSPfract z_xL[NUM_CHANNELS][2];
DSPfract z_yL[NUM_CHANNELS][2];
DSPfract z_xH[NUM_CHANNELS][2];
DSPfract z_yH[NUM_CHANNELS][2];

fract  coeffL[4] = { FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) };
fract  coeffH[4] = { FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) ,FRACT_NUM(0.0) };

DSPfract test_p = FRACT_NUM(1.0);
DSPfract test_n = FRACT_NUM(-1.0);

DSPfract* sb_ptr0 = sampleBuffer[0];
DSPfract* sb_ptr1 = sampleBuffer[1];
DSPfract* sb_ptr2 = sampleBuffer[2];
DSPfract* sb_ptr3 = sampleBuffer[3];
DSPfract* sb_ptr4 = sampleBuffer[4];
DSPfract* sb_ptr5 = sampleBuffer[5];
DSPfract* sb_ptr6 = sampleBuffer[6];
DSPfract* sb_ptr7 = sampleBuffer[7];

inline void clip(fract *x) {
	if (*x >test_p) {
		*x = test_p;
	}
	else if (*x < test_n) {
		*x = test_n;
	}
}






void calculateShelvingCoeff(DSPfract c_alpha, DSPfract* output)
{
	DSPfract t1, t2;

	t1 = c_alpha;
	clip(&t1);

	t2 = -c_alpha;
	clip(&t2);

	*output = t1;
	
	*(output + 1) = FRACT_NUM(-1.0);
	*(output + 2) = FRACT_NUM(1.0);
	*(output + 3) = t2;
	
} 


long_fract calculateAlpha(double omega)
{

	double a1 = 1 / cos(omega) + tan(omega);
	double a2 = 1 / cos(omega) - tan(omega);
	
	a1= (a1 >= -1 && a1 <= 1) ? a1 : a2;
	return FRACT_NUM(a1);
	
	

}

void calculatealpha_test(uint64_t omega,double omega2) {

	int64_t test;
	double placebo;
	test =sine(omega);
	placebo = sin(omega2);


}



DSPaccum first_order_IIR(DSPfract input, DSPfract* coefficients, DSPfract* z_x, DSPfract* z_y)
{
	DSPaccum temp;

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
	DSPaccum accum;

	filtered_input = first_order_IIR(input, coeffL, z_x, z_y);
	accum = (input + filtered_input) >>1;
	accum += (input - filtered_input) *K1;
	clip(&(DSPfract)accum);


	return DSPfract(accum);

}

DSPfract shelvingHP(DSPfract input, DSPfract* z_x, DSPfract* z_y) {

	DSPfract filtered_input;
	DSPaccum accum;
	
	filtered_input = first_order_IIR(input, coeffH, z_x, z_y);
	
	accum = ((input - filtered_input) >>1);

	accum += (input + filtered_input) *(K2);

	
	clip(&(DSPfract)accum);
	


	return DSPfract(accum);

}


void processing() {

	DSPint i;


	sb_ptr0 = sampleBuffer[0];
	sb_ptr1 = sampleBuffer[1];
	sb_ptr2 = sampleBuffer[2];
	sb_ptr3 = sampleBuffer[3];
	sb_ptr4 = sampleBuffer[4];
	sb_ptr5 = sampleBuffer[5];
	sb_ptr6 = sampleBuffer[6];
	sb_ptr7 = sampleBuffer[7];

	for (i = 0; i < BLOCK_SIZE; i++)
	{
	
		*sb_ptr0 =  shelvingHP(*sb_ptr0, *z_xH, *z_yH);
		*sb_ptr0 = shelvingLP(*sb_ptr0, *z_xL, *z_yL);
		*sb_ptr0++;
		*sb_ptr1 = shelvingHP(*sb_ptr1, *(z_xH + 1), *(z_yH + 1));
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




	}
	
};

DSPint main(DSPint argc, char* argv[])
{

	DSPint i, j, k;

	if (argc < 6 || argc > 8) {
		printf("Wrong number of arguments\n");
		printf("Usage: %s  \n", argv[0]);
		printf("INPUT: %s \n", argv[1]);
		printf(" OUTPUT: %s  \n", argv[2]);
		printf("%s  ENABLE \n", argv[3]);
		printf(" %s  K1 \n", argv[4]);
		printf(" %s  K2 \n", argv[5]);
		printf(" %s  alpha1 \n", argv[6]);
		printf(" %s  alpha2 \n", argv[7]);

		printf("alpha1 alpha2 K1 K2 \n");
		return -1;
	}


	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;


	// Init channel buffers
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





	if (strcmp(argv[3], "0") != 0) {
		enable = 1;
	}
	else {
		enable = 0;
	}


	//K1
	double temp = atof(argv[4]);

	
		K1 = FRACT_NUM(temp/2);
	
	//K2
	temp = atof(argv[5]);
	
		

	
		K2 = FRACT_NUM(temp/2);
	
	Fcl = atoi(argv[6]);
	Fch = atoi(argv[7]);




	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, "rb");
	if (wav_in == NULL)
	{
		printf("Error: Could not open input wavefile.\n");
		printf("The file is in another castle \n");
		return -1;
	}
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, "wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in, inputWAVhdr);

	//-------------------------------------------------

	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = inputWAVhdr.fmt.NumChannels; // change number of channels

	DSPint oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign * outputWAVhdr.fmt.NumChannels;
	//-------------------------------------------------	

	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);

	// Processing loop
	//-------------------------------------------------	
	{	double omega_test = (2 * M_PI * Fcl / inputWAVhdr.fmt.SampleRate);
		
	fract omega_control= FRACT_NUM(2 * M_PI * Fcl / inputWAVhdr.fmt.SampleRate);
	
	int omega = FRACT_TO_INT_BIT_CONV(omega_control);//FRACT_NUM(2*M_PI * Fcl / inputWAVhdr.fmt.SampleRate);
		
		
		//omega_control ++;
		
		int s, c;
		omega = omega >> 1;
		cordic((omega ), &s, &c, 32);
		double alpha1_double =sin(omega_test);
		if (s - MUL > 0)
			s = MUL;
		else if(s + MUL < 0) {
			s = -MUL;
		}
		//s=(s-1) << 1;
	//	alpha2 =FRACT_TO_INT_BIT_CONV s;
		
		printf("%lf : %lf\n", (double)s/ 1073741824, alpha1_double);
		double alpha2_double = alpha2.toDouble();
		calculatealpha_test(omega, omega_test);
		alpha1 = calculateAlpha(omega);
		DSPfract omega2 = FRACT_NUM(2 * M_PI * Fch / inputWAVhdr.fmt.SampleRate);
		
		alpha2 = calculateAlpha(omega2);
		
		//hardcoding 
		alpha1 = 0.5;
		alpha2 = -0.5;

		
	
		
		calculateShelvingCoeff(alpha1, coeffL);
		calculateShelvingCoeff(alpha2, coeffH);


		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);
		DSPint h = iNumSamples / BLOCK_SIZE;
		// exact file length should be handled correctly...
		for (i = 0; i <h; i++)
		{
			for (j = 0; j < BLOCK_SIZE; j++)
			{
				for (k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
				{

					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				
				}
			}

			if (enable)
			{
				processing();
			}





			for (j = 0; j < BLOCK_SIZE; j++)
			{
				for (k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = (DSPint)(sampleBuffer[k][j].toLong());	// crude, non-rounding
																			//	printf("sample %d\n", sampleBuffer[k][j]);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
				}




			}


		}
	}
	// Close files
	//-------------------------------------------------
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------

	return 0;
}
