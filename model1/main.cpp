#define _CRT_SECURE_NO_WARNINGS 1
#include <stdlib.h>
#include <string.h>

#include <math.h>
#include "WAVheader.h"

#define BLOCK_SIZE 16
#define NUM_CHANNELS 6
#define DELAY_SIZE 64 // prvi stepen 2 veci od 48 (broj odbiraka ekvivalentan 1ms)

#define LEFT 0
#define CENTER 1
#define RIGHT 2
#define LEFT_SUR 3
#define RIGHT_SUR 4
#define LFE 5

enum Mode
{
	MODE_2_0_0,
	MODE_2_0_1,
	MODE_0_2_0,
	MODE_0_2_1,
	MODE_3_2_0
};

struct State
{
	double gainL;
	double gainR;
	double gainH;
	double delay[2][DELAY_SIZE];
	double *writePtr[2];
	double *readPtr[2];
	Mode mode;
};
State state;

double sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];

void stateInit(double dbL, double dbR, double dbH)
{
	int i;
	for (i = 0; i < DELAY_SIZE; i++)
	{
		state.delay[0][i] = 0;
		state.delay[1][i] = 0;
	}

	state.writePtr[0] = state.delay[0] + DELAY_SIZE - 1;
	state.writePtr[1] = state.delay[1] + DELAY_SIZE - 1;

	state.readPtr[0] = state.delay[0] + DELAY_SIZE - 1 - 48;
	state.readPtr[1] = state.delay[1] + DELAY_SIZE - 1 - 48;

	state.gainL = pow(10.0, (dbL / 20.0));
	state.gainR = pow(10.0, (dbR / 20.0));
	state.gainH = pow(10.0, (dbH / 20.0));
}

void processing()
{
	static const double m2dB = pow(10.0, (-2.0 / 20.0));
	static const double m6dB =pow(10.0, (-6.0 / 20.0));

	double *bufferLeft = sampleBuffer[0];
	double *bufferRight = sampleBuffer[1];
	double *left = sampleBuffer[LEFT];
	double *right = sampleBuffer[RIGHT];
	double *center = sampleBuffer[CENTER];
	double *left_sur = sampleBuffer[LEFT_SUR];
	double *right_sur = sampleBuffer[RIGHT_SUR];
	double *lfe = sampleBuffer[LFE];

	int i;
	for (i = 0; i < BLOCK_SIZE; i++)
	{
		double **write = state.writePtr;
		double **read = state.readPtr;
		double (*delay)[DELAY_SIZE] = state.delay;

		double left1;
		double right1;
		double a1, a2, a3, a4;
		double h;
		double leftIn = *bufferLeft++;
		double rightIn = *bufferRight++;

		// Gore
		**write = leftIn;
		if (*write == *delay + DELAY_SIZE - 1)
			*write = *delay;
		else
			(*write)++;
		write++;

		left1 = **read;
		if (*read == *delay + DELAY_SIZE - 1)
			*read = *delay;
		else
			(*read)++;
		read++;
		delay++;

		// Dole
		**write = rightIn;
		if (*write == *delay + DELAY_SIZE - 1)
			*write = *delay;
		else
			(*write)++;
		write++;

		right1 = **read;
		if (*read == *delay + DELAY_SIZE - 1)
			*read = *delay;
		else
			(*read)++;
		read++;
		delay++;

		// Centar
		h = (leftIn + rightIn) * state.gainH;


		// druga kolona
		a1 = left1 * m2dB;
		a2 = h * m6dB;
		a3 = h * m6dB;
		a4 = right1 * m2dB;

		*left++ = a2;
		*left_sur++ = a1 + a2;
		*center++ = h;
		*lfe++ = h;
		*right_sur++ = a3 + a4;
		*right++ = a3;
	}
}


int main(int argc, char* argv[])
{
	State state;
	int i;

	for(i =0 ;i<NUM_CHANNELS; i++)
	memset(&sampleBuffer[i],0,BLOCK_SIZE);
	
	
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;	

	stateInit(atof(argv[4]), atof(argv[5]), atof(argv[6]));

	if (strcmp(argv[3], "MODE_2_0_0") == 0)
		state.mode = MODE_2_0_0;
	else if (strcmp(argv[3], "MODE_2_0_1") == 0)
		state.mode = MODE_2_0_1;
	else if (strcmp(argv[3], "MODE_0_2_0") == 0)
		state.mode = MODE_0_2_0;
	else if (strcmp(argv[3], "MODE_0_2_1") == 0)
		state.mode = MODE_0_2_1;
	else if (strcmp(argv[3], "MODE_3_2_0") == 0)
		state.mode = MODE_3_2_0;

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, "rb");
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
	if (state.mode == MODE_2_0_0)
		outputWAVhdr.fmt.NumChannels = 2;
	else if (state.mode == MODE_2_0_1)
		outputWAVhdr.fmt.NumChannels = 3;
	else if (state.mode == MODE_0_2_0)
		outputWAVhdr.fmt.NumChannels = 2;
	else if (state.mode == MODE_0_2_1)
		outputWAVhdr.fmt.NumChannels = 3;
	else if (state.mode = MODE_3_2_0)
		outputWAVhdr.fmt.NumChannels = 5;

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign * outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);

	// Processing loop
	//-------------------------------------------------	
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = INT_MAX;		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels * inputWAVhdr.fmt.BitsPerSample / 8);
		
		// exact file length should be handled correctly...
		for(int i = 0; i < iNumSamples / BLOCK_SIZE; i++)
		{	
			for(int j = 0; j < BLOCK_SIZE; j++)
			{
				for(int k = 0; k < inputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				}
			}

			processing();

			for (int j = 0; j < BLOCK_SIZE; j++)
			{
				if (state.mode == MODE_2_0_0)
				{
					sample = (int)(sampleBuffer[LEFT][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[RIGHT][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_2_0_1)
				{
					sample = (int)(sampleBuffer[LEFT][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[RIGHT][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[LFE][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_0_2_0)
				{
					sample = (int)(sampleBuffer[LEFT_SUR][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[RIGHT_SUR][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_0_2_1)
				{
					sample = (int)(sampleBuffer[LEFT_SUR][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[RIGHT_SUR][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[LFE][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_3_2_0)
				{
					sample = (int)(sampleBuffer[LEFT][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[CENTER][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[RIGHT][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[LEFT_SUR][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = (int)(sampleBuffer[RIGHT_SUR][j] * SAMPLE_SCALE);
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
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