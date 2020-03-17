#define _CRT_SECURE_NO_WARNINGS 1
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include "WAVheader.h"

#define BLOCK_SIZE 16
#define NUM_CHANNELS 6

double z_xL[2];
double z_yL[2];
double z_xH[2];
double z_yH[2];
double coeffL[4] = { 0,0,0,0 };
double coeffH[4] = { 0,0,0,0 };

double K;
double alpha;


inline void clip(double *x) {
	if (*x > 32767) {
		*x = 32767;
	}
	else if (*x < -32768) {
		*x =-32768;
	}
}

inline void clip24(double *x) {
	if (*x > 8388607) {
		*x = 8388607;
	}
	else if (*x < -8388608) {
		*x = -8388608;
	}
}

inline void clipT(double *x) {
	if (*x > 1) {
		*x = 1;
	}
	else if (*x < -1) {
		*x = -1;
	}
}

double sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];


void calculateShelvingCoeff(double c_alpha, double* output)
{
	double t1, t2;

	t1 = 32767 * c_alpha;
	clip(&t1);

	t2 = -(32768 * c_alpha);
	clip(&t2);

	output[0] = t1;
	output[1] = -32768;
	output[2] = 32767;
	output[3] = t2;
}

void calculateShelvingCoeff24(double c_alpha, double* output)
{
	double t1, t2;

	t1 = 8388607 * c_alpha;
	clip24(&t1);

	t2 = -(8388608 * c_alpha);
	clip24(&t2);

	output[0] = t1;
	output[1] = -8388608;
	output[2] = 8388607;
	output[3] = t2;
}

void calculateShelvingCoeffT(double c_alpha, double* output)
{
	double t1, t2;

	t1 = 1 * c_alpha;
	clipT(&t1);

	t2 = -(1 * c_alpha);
	clipT(&t2);

	output[0] = t1;
	output[1] = -1;
	output[2] = 1;
	output[3] = t2;
}




double first_order_IIR(double input, double* coefficients, double* z_x, double* z_y)
{
	double temp;

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



double shelvingLP(double input, double* coeff, double* z_x, double* z_y, double k) {

	double filtered_input;
	double accum;

	filtered_input = first_order_IIR(input, coeff, z_x, z_y);
	//accum = filtered_input;
	accum = (input + filtered_input) / 2.0;
	accum += ((input - filtered_input) / 2.0)*k;
	clipT(&accum);


	return accum;

}

double shelvingHP(double input, double* coeff, double* z_x, double* z_y, double k) {

	double filtered_input;
	double accum;

	filtered_input = first_order_IIR(input, coeff, z_x, z_y);
	accum = (input - filtered_input) / 2.0; 
	accum += ((input + filtered_input) / 2.0)*k;
	clipT(&accum);


	return accum;

}

void processing() {


	


	for (int i = 0; i < BLOCK_SIZE; i++)
	{
		
		
		//sampleBuffer[0][i] = shelvingLP(sampleBuffer[0][i], coeffL, z_xL, z_yL, K);
		sampleBuffer[0][i] = shelvingHP(sampleBuffer[0][i], coeffH, z_xH, z_yH, K);
		
	
	}
	

};

int main(int argc, char* argv[])
{
	/*if (argc < 3 || argc > 6) {
		printf("Wrong number of arguments\n");
		printf("Usage: %s INPUT OUTPUT \n", argv[0]);
		printf("Enable = [0|1]\n G1,G2 = [0,1]\n MODE = [\"2_0_0\"|\"3_2_0\"|\"3_2_1\"\n");
		return -1;
	}*/


	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;


	// Init channel buffers
	for (int i = 0; i<NUM_CHANNELS; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);


	alpha = atof(argv[3]);


	K = atoi(argv[4]);


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

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

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
		
		calculateShelvingCoeffT(-alpha, coeffH);
		calculateShelvingCoeffT(alpha, coeffL);
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for (int i = 0; i < iNumSamples / BLOCK_SIZE; i++)
		{
			for (int j = 0; j < BLOCK_SIZE; j++)
			{
				for (int k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample /SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
					sampleBuffer[0][j] = -1;
				}
			}
			
			
			processing();

				
				//sampleBuffer[0][j] = shelvingHP(sampleBuffer[0][j], coeffH, z_xH, z_yH, 0.5);
				//printf("%d \n", (int)sampleBuffer[0][j]);
			
			//sampleBuffer[0][j] = shelvingLP(sampleBuffer[0][j], coeff, z_x, z_y, K);
			//sampleBuffer=shelvingLP(sampleBuffer,coeff, z_x, z_y, K);

			for (int j = 0; j < BLOCK_SIZE; j++)
			{
				for (int k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = (int)(sampleBuffer[k][j] * SAMPLE_SCALE);	// crude, non-rounding
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
				}
				
			////	sampleBuffer[0][j] = shelvingHP(sampleBuffer[0][j], coeffH, z_xH, z_yH, K);
			//	sample = (int)(sampleBuffer[0][j] * SAMPLE_SCALE);
			//	sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
			//	/*sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
			//	fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
			//	calculateShelvingCoeff(alpha, coeffL);*/
			//	//sampleBuffer[0][j] =  shelvingLP(sampleBuffer[0][j], coeffL, z_xL, z_yL, 8129);
			////	sampleBuffer[0][j] = shelvingHP(sampleBuffer[0][j], coeffH, z_xH, z_yH, 0.5);
			//
			//	//sample = (int)(sampleBuffer[0][j] * SAMPLE_SCALE);
			//
			//	
			//	fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
			///*	sampleBuffer[1][j] = shelvingHP(sampleBuffer[1][j], coeffH, z_x, z_y, K);
			//	sample = (int)(sampleBuffer[1][j] * SAMPLE_SCALE);
			//	sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
			//	fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);*/
			//	sample = (int)(sampleBuffer[1][j] * SAMPLE_SCALE);
			//	sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
			//	fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
			
				
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
