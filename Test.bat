SET CONFIGURATION=Debug
SET PROJECT_NAME=WavTemplate
SET PROJECT_ULD="SULD%PROJECT_NAME%/output/standalone/%PROJECT_NAME%.uld"

: TO DO: Add additional command line args for your program
SET ADDITIONAL_ARGS= "1" "0.5" "0.5" "500" "1000" 

SET SIMULATOR=C:\CirrusDSP\bin\cmdline_simulator.exe -silent
SET COMPARE="..//tools//PCMCompare.exe"


: Delete log files first.
::/Q            Quiet mode, do not ask if ok to delete on global wildcard
del /Q OutCmp\*
del /Q OutStreams\*







: Execute Model 0, Model 1, Model 2 and Model 3

"Debug\model0.exe" ".\TestStreams\speech.wav" ".\OutStreams\Tone_0.wav" "1" "0.5" "0.5" "500" "1000"
"Debug\model1.exe" ".\TestStreams\speech.wav" ".\OutStreams\Tone_1.wav" "1" "0.5" "0.5" "500" "1000"
"Debug\model2.1.exe" ".\TestStreams\speech.wav" ".\OutStreams\Tone_2.wav" "1" "0.5" "0.5" "500" "1000"
::"model2.1.exe" "../TestStreams/speech.wav" "../OutStreams/Tone_2.wav" "1" "0.5" "0.5" "1000" "15000"
:: TO DO: Call model 1 executable and name output file: out_speech_1.wav
:: TO DO: Call model 2 executable and name output file: out_speech_2.wav

echo     model 3
	(
		@echo ^<?xml version="1.0" encoding="UTF-8" standalone="yes"?^>
		@echo ^<CL_PROJECT^>
		@echo     ^<argv^>.\TestStreams\speech.wav OutStreams\Tone_3.wav %ADDITIONAL_ARGS%^</argv^>
		@echo     ^<FILE_IO_CFG block_type="Input" channels_per_line="2" delay="0" file_mode="PCM" index="0" justification="Left" sample_format="LittleEndian" sample_rate="48000" sample_size="32"/^>
		@echo     ^<FILE_IO_CFG block_type="Output" channels_per_line="2" delay="0" file_mode="PCM" index="0" justification="Left" sample_format="LittleEndian" sample_rate="48000" sample_size="32"/^>
		@echo     ^<MEMORY_CFG^>
		@echo         ^<ULD_FILE disk_path="C:/Users/thedushn/Desktop/AADSP2/new_project/Zadatak/New folder/AADSP2/SULDWavTemplate/output/standalone/WavTemplate.uld"/^>
		@echo     ^</MEMORY_CFG^>
		@echo     ^<PROFILE_CFG enable="on"/^>
		@echo     ^<SCP_CFG load_delay="0"/^>
		@echo ^</CL_PROJECT^>
	
	) > SimulatorConfigurationTemp.sbr


: Execute Model 3
	%SIMULATOR% -project SimulatorConfigurationTemp.sbr 



: Generate new logs
"PCMCompare.exe" OutStreams//Tone_0.wav OutStreams//Tone_1.wav 2> OutCmp//Model0_vs_Model1.txt
"PCMCompare.exe" OutStreams//Tone_1.wav OutStreams//Tone_2.wav 2> OutCmp//Model1_vs_Model2.txt
"PCMCompare.exe" OutStreams//Tone_2.wav OutStreams//Tone_3.wav 2> OutCmp//Mode12_vs_Model3.txt


:: TO DO: Compare output of model1 and model2 and store the result in OutCmp//whiteNoise_Model1_vs_Model2.txt


