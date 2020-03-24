#define _CRT_SECURE_NO_WARNINGS 1
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <math.h>

#include "WAVheader.h"
#include "iir.h"


#define BLOCK_SIZE 16
//broj kanala 
#define NUM_CHANNELS 8
#define M_PI 3.14159265358979323846

double z_xL[NUM_CHANNELS][2];
double z_yL[NUM_CHANNELS][2];
double z_xH[NUM_CHANNELS][2];
double z_yH[NUM_CHANNELS][2];
double coeffL[4] = { 0,0,0,0 };
double coeffH[4] = { 0,0,0,0 };

double K1;
double K2;
double Fcl;
double Fch;
double alpha1;
// Enable
static int enable = 1;


double sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];




inline void clip(double *x) {
	if (*x > 1) {
		*x = 1;
	}
	else if (*x < -1) {
		*x = -1;
	}
}






void calculateShelvingCoeff(double c_alpha, double* output)
{
	double t1, t2;

	t1 = 1 * c_alpha;
	clip(&t1);

	t2 = -(1 * c_alpha);
	clip(&t2);

	output[0] = t1;
	output[1] =	-1;
	output[2] = +1;
	output[3] = t2;
}


double calculateAlpha(double omega)
{
	double a1 = 1 / cos(omega) + tan(omega);
	double a2 = 1 / cos(omega) - tan(omega);

	return (a1 >= -1 && a1 <= 1) ? a1 : a2;
}







double shelvingLP(double input, double* coeff, double* z_x, double* z_y, double k) {

	double filtered_input;
	double accum;

	filtered_input = first_order_IIR(input, coeff, z_x, z_y);
	accum = (input + filtered_input) / 2.0;
	accum += ((input - filtered_input) / 2.0)*k;
	clip(&accum);


	return accum;

}

double shelvingHP(double input, double* coeff, double* z_x, double* z_y, double k) {

	double filtered_input;
	double accum;

	filtered_input = first_order_IIR(input, coeff, z_x, z_y);
	
	accum = (input - filtered_input) / 2.0; 
	accum += ((input + filtered_input) / 2.0)*k;
	clip(&accum);


	return accum;

}


void processing() {

	int i;
	int k;


	for ( i = 0; i < BLOCK_SIZE; i++)
	{
		for ( k = 0; k < NUM_CHANNELS; k++)
		{
			
				sampleBuffer[k][i] = shelvingHP(sampleBuffer[k][i], coeffH, z_xH[k], z_yH[k], K1);
				sampleBuffer[k][i] = shelvingLP(sampleBuffer[k][i], coeffL, z_xL[k], z_yL[k], K2);
			
			
		}
		

	
	}
	

};

int main(int argc, char* argv[])
{

	int i, j, k;
	
	if (argc < 6 || argc > 8) {
		printf("dasdasWrong number of arguments\n");
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
	for ( i = 0; i<NUM_CHANNELS; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);
	
	

	for (i = 0; i < NUM_CHANNELS; i++) {
		z_xH[i][0] = 0;
		z_yH[i][1] = 0;
		z_xL[i][0] = 0;
		z_yL[i][1] = 0;


	}
		

	if (strcmp(argv[3], "0") != 0) {
		enable = 1;
	}
	else {
		enable = 0;
	} 

	
	
	K1 = atof(argv[4]);
	K2 = atof(argv[5]);
	Fcl = atof(argv[6]);
	Fch = atof(argv[7]);
	
	


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
		double omega = 2 * M_PI * Fcl / inputWAVhdr.fmt.SampleRate;
		alpha1=calculateAlpha(omega);
		double omega2 = 2 * M_PI * Fch / inputWAVhdr.fmt.SampleRate;
		double alpha2 = calculateAlpha(omega2);

		calculateShelvingCoeff(alpha1, coeffL);
		calculateShelvingCoeff(alpha2, coeffH);
		
		
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for ( i = 0; i < iNumSamples / BLOCK_SIZE; i++)
		{
			for ( j = 0; j < BLOCK_SIZE; j++)
			{
				for ( k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample /SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
					
				}
			}
			
			if (enable)
			{
				processing();
			}
			

				
		

			for ( j = 0; j < BLOCK_SIZE; j++)
			{
				for ( k = 0; k<outputWAVhdr.fmt.NumChannels ; k++)
				{
					sample = (int)(sampleBuffer[k][j] * SAMPLE_SCALE);	// crude, non-rounding
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
