#define _CRT_SECURE_NO_WARNINGS 1
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include "WAVheader.h"
#include "stdfix_emu.h"

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
	fract gainL;
	fract gainR;
	fract gainH;
	fract delay[2][DELAY_SIZE];
	fract *writePtr[2];
	fract *readPtr[2];
	Mode mode;
};
State state;

fract sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];

void stateInit(double dbL, double dbR, double dbH)
{
	int i;
	for (i = 0; i < DELAY_SIZE; i++)
	{
		state.delay[0][i] = 0.0;
		state.delay[1][i] = 0.0;
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
	static const fract m2dB = pow(10.0, (-2.0 / 20.0));
	static const fract m6dB = pow(10.0, (-6.0 / 20.0));

	fract *bufferLeft = sampleBuffer[0];
	fract *bufferRight = sampleBuffer[1];
	fract *left = sampleBuffer[LEFT];
	fract *right = sampleBuffer[RIGHT];
	fract *center = sampleBuffer[CENTER];
	fract *left_sur = sampleBuffer[LEFT_SUR];
	fract *right_sur = sampleBuffer[RIGHT_SUR];
	fract *lfe = sampleBuffer[LFE];

	int i;
	for (i = 0; i < BLOCK_SIZE; i++)
	{
		fract **write = state.writePtr;
		fract **read = state.readPtr;
		fract (*delay)[DELAY_SIZE] = state.delay;

		fract left1;
		fract right1;
		fract a1, a2, a3, a4;
		fract h;
		fract leftIn = *bufferLeft++;
		fract rightIn = *bufferRight++;

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
	int j;
	for(int i =0;i<NUM_CHANNELS;i++)
		for(int j=0;j<BLOCK_SIZE;j++)
			sampleBuffer[i][j]=FRACT_NUM(0.0);

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
					sample = sampleBuffer[LEFT][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[RIGHT][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_2_0_1)
				{
					sample = sampleBuffer[LEFT][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[RIGHT][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[LFE][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_0_2_0)
				{
					sample = sampleBuffer[LEFT_SUR][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[RIGHT_SUR][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_0_2_1)
				{
					sample = sampleBuffer[LEFT_SUR][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[RIGHT_SUR][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[LFE][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);
				}
				else if (state.mode == MODE_3_2_0)
				{
					sample = sampleBuffer[LEFT][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[CENTER][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[RIGHT][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[LEFT_SUR][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);

					sample = sampleBuffer[RIGHT_SUR][j].toLong();
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
