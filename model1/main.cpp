#define _CRT_SECURE_NO_WARNINGS 1
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include "WAVheader.h"
#include "common.h"

#define BLOCK_SIZE 16
//broj kanala 
#define NUM_CHANNELS 8

DSPfract z_xL[2];
DSPfract z_yL[2];
DSPfract z_xH[2];
DSPfract z_yH[2];
DSPfract coeffL[4] = { 0,0,0,0 };
DSPfract coeffH[4] = { 0,0,0,0 };

DSPfract K1;
DSPfract K2;
DSPfract KHP; 
DSPfract KLP; 
DSPfract alpha1;
DSPfract alpha2;
// Enable
static DSPint enable = 1;

DSPfract sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];




inline void clip(DSPfract *x) {
	if (*x > 1) {
		*x = 1;
	}
	else if (*x < -1) {
		*x = -1;
	}
}








void calculateShelvingCoeffT(DSPfract c_alpha, DSPfract* output)
{
	DSPfract t1, t2;

	t1 = 1 * c_alpha;
	clip(&t1);

	t2 = -(1 * c_alpha);
	clip(&t2);

	output[0] = t1;
	output[1] = -1;
	output[2] = 1;
	output[3] = t2;
}




DSPfract first_order_IIR(DSPfract input, DSPfract* coefficients, DSPfract* z_x, DSPfract* z_y)
{
	DSPfract temp;

	z_x[0] = input; /* Copy input to x[0] */

	temp = (coefficients[0] * z_x[0]);   /* B0 * x(n)     */
	temp += (coefficients[1] * z_x[1]);    /* B1 * x(n-1) */
	temp -= (coefficients[3] * z_y[1]);    /* A1 * y(n-1) */


	z_y[0] = (temp);

	/* Shuffle values along one place for next time */

	z_y[1] = z_y[0];   /* y(n-1) = y(n)   */
	z_x[1] = z_x[0];   /* x(n-1) = x(n)   */

	return (temp);
}



DSPfract shelvingLP(DSPfract input, DSPfract* coeff, DSPfract* z_x, DSPfract* z_y) {

	DSPfract filtered_input;
	DSPfract accum;

	filtered_input = first_order_IIR(input, coeff, z_x, z_y);
	accum = (input + filtered_input) / 2.0;
	accum += (input - filtered_input)*K1 ;
	clip(&accum);


	return accum;

}

DSPfract shelvingHP(DSPfract input, DSPfract* coeff, DSPfract* z_x, DSPfract* z_y) {

	DSPfract filtered_input;
	DSPfract accum;

	filtered_input = first_order_IIR(input, coeff, z_x, z_y);
	accum = (input - filtered_input) / 2.0;
	accum += (input + filtered_input)*K2;
	clip(&accum);


	return accum;

}

void processing() {

	DSPint i;
	DSPint k;


	for (i = 0; i < BLOCK_SIZE; i++)
	{
		for (k = 0; k < NUM_CHANNELS; k++)
		{
			sampleBuffer[k][i] = shelvingLP(sampleBuffer[k][i], coeffL, z_xL, z_yL);
			sampleBuffer[k][i] = shelvingHP(sampleBuffer[k][i], coeffH, z_xH, z_yH);
		}

		/*	sampleBuffer[0][i] = shelvingLP(sampleBuffer[0][i], coeffL, z_xL, z_yL, K1);
		sampleBuffer[0][i] = shelvingHP(sampleBuffer[0][i], coeffH, z_xH, z_yH, K2);*/


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
	for (i = 0; i<NUM_CHANNELS; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);


	if (strcmp(argv[3], "0") != 0) {
		enable = 1;
	}
	else {
		enable = 0;
	}

	alpha1 = atof(argv[6]);
	alpha2 = atof(argv[7]);

	KLP = atof(argv[4]);
	KHP = atof(argv[5]);
	K1 = KLP / 2;
	K2 = KHP / 2;
	





	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, "rb");
	if (wav_in == NULL)
	{
		printf("Error: Could not open input wavefile.\n");
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
	{
		calculateShelvingCoeffT(alpha1, coeffL);
		calculateShelvingCoeffT(alpha2, coeffH);

		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const DSPfract SAMPLE_SCALE = -(DSPfract)(1 << 31);		//2^31
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for ( i = 0; i < iNumSamples / BLOCK_SIZE; i++)
		{
			for (j = 0; j < BLOCK_SIZE; j++)
			{
				for (k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
																			//sampleBuffer[0][j] = -1; debuging 
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
					sample = (DSPint)(sampleBuffer[k][j] * SAMPLE_SCALE);	// crude, non-rounding
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
