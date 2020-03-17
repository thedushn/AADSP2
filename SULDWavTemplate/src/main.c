#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include "common.h"






typedef enum
{
	MODE_2_0_0,
	MODE_2_0_1,
	MODE_0_2_0,
	MODE_0_2_1,
	MODE_3_2_0
}Mode;


typedef struct
{
	DSPfract gainL;
	DSPfract gainR;
	DSPfract gainH;
	DSPfract delay[2][DELAY_SIZE];
	DSPfract *writePtr[2];
	DSPfract *readPtr[2];
	Mode mode ;
}State ;

__memX State state;

DSPfract sampleBuffer[NUM_CHANNELS][BLOCK_SIZE];

DSPfract m2dB = FRACT_NUM(0.79);
		DSPfract m6dB =FRACT_NUM(0.5);
void stateInit()
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




}

void processing()
{


	DSPfract *bufferLeft = sampleBuffer[0];
	DSPfract *bufferRight = sampleBuffer[1];
	DSPfract *left = sampleBuffer[LEFT];
	DSPfract *right = sampleBuffer[RIGHT];
	DSPfract *center = sampleBuffer[CENTER];
	DSPfract *left_sur = sampleBuffer[LEFT_SUR];
	DSPfract *right_sur = sampleBuffer[RIGHT_SUR];
	DSPfract *lfe = sampleBuffer[LFE];

	int i;
	for (i = 0; i < BLOCK_SIZE; i++)
	{
		DSPfract **write = state.writePtr;
		DSPfract **read = state.readPtr;
		DSPfract (*delay)[DELAY_SIZE] = state.delay;

		DSPfract left1;
		DSPfract right1;
		DSPfract a1, a2, a3, a4;
		DSPfract h;
		DSPfract leftIn = *bufferLeft++;
		DSPfract rightIn = *bufferRight++;

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



int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;
	
	char WavInputName[256];
	char WavOutputName[256];
	
    int nChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;
    int i;
    int outChannels;

    stateInit();

    state.mode=MODE_3_2_0;
    state.gainL= FRACT_NUM(0.5);
    	state.gainR= FRACT_NUM(0.5);
    	state.gainH= FRACT_NUM(0.5);

	//Init channel buffers
	for(i=0; i<NUM_CHANNELS; i++)
		memset(&sampleBuffer[i],0,BLOCK_SIZE);

	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,"speech.wav");
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
    if (state.mode == MODE_2_0_0)
    	outChannels = 2;
       			else if (state.mode == MODE_2_0_1)
       				outChannels = 3;
       			else if (state.mode == MODE_0_2_0)
       				outChannels = 2;
       			else if (state.mode == MODE_0_2_1)
       				outChannels = 3;
       			else if (state.mode = MODE_3_2_0)
       				outChannels= 5;
	strcpy(WavOutputName,"out3.wav");
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, outChannels, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	// Processing loop
	//-------------------------------------------------	
    {
		int i;
		int j;
		int k;
		int sample;

		// exact file length should be handled correctly...
		for(i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{	
					sample = cl_wavread_recvsample(wav_in);
        			sampleBuffer[k][j] = rbits(sample);
				}
			}

			processing();


			for (j = 0; j < BLOCK_SIZE; j++)
						{
							if (state.mode == MODE_2_0_0)
							{
								sample = bitsr(sampleBuffer[LEFT][j]);
										cl_wavwrite_sendsample(wav_out, sample);
										sample = bitsr(sampleBuffer[RIGHT][j]);
												cl_wavwrite_sendsample(wav_out, sample);
							}
							else if (state.mode == MODE_2_0_1)
							{
								sample = bitsr(sampleBuffer[LEFT][j]);
										cl_wavwrite_sendsample(wav_out, sample);

										sample = bitsr(sampleBuffer[RIGHT][j]);
												cl_wavwrite_sendsample(wav_out, sample);

								sample = bitsr(sampleBuffer[LFE][j]);
										cl_wavwrite_sendsample(wav_out, sample);
							}
							else if (state.mode == MODE_0_2_0)
							{
								sample = bitsr(sampleBuffer[LEFT_SUR][j]);
										cl_wavwrite_sendsample(wav_out, sample);

										sample = bitsr(sampleBuffer[RIGHT_SUR][j]);
												cl_wavwrite_sendsample(wav_out, sample);
							}
							else if (state.mode == MODE_0_2_1)
							{
								sample = bitsr(sampleBuffer[LEFT_SUR][j]);
										cl_wavwrite_sendsample(wav_out, sample);
										sample = bitsr(sampleBuffer[RIGHT_SUR][j]);
												cl_wavwrite_sendsample(wav_out, sample);
												sample = bitsr(sampleBuffer[LFE][j]);
														cl_wavwrite_sendsample(wav_out, sample);
							}
							else if (state.mode == MODE_3_2_0)
							{
								sample = bitsr(sampleBuffer[LEFT][j]);
								cl_wavwrite_sendsample(wav_out, sample);

										sample = bitsr(sampleBuffer[CENTER][j]);
										cl_wavwrite_sendsample(wav_out, sample);
												sample = bitsr(sampleBuffer[RIGHT][j]);
												cl_wavwrite_sendsample(wav_out, sample);

														sample = bitsr(sampleBuffer[LEFT_SUR][j]);
														cl_wavwrite_sendsample(wav_out, sample);

															sample = bitsr(sampleBuffer[RIGHT_SUR][j]);
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
