: Delete log files first.
cd OutCmp
del Model0_vs_Model1.txt
del Model1_vs_Model2.txt
del Model2_vs_Model3.txt

cd ..

: Execute Model 0, Model 1, Model 2 and Model 3
cd Debug
"model0.exe" "../TestStreams/speech.wav" "../OutStreams/Tone_0.wav" "1" "0.5" "0.5" "500" "2500"
"model1.exe" "../TestStreams/speech.wav" "../OutStreams/Tone_1.wav" "1" "0.5" "0.5" "500" "2500"
"model2.1.exe" "../TestStreams/speech.wav" "../OutStreams/Tone_2.wav" "1" "0.5" "0.5" "500" "2500"
::"model2.1.exe" "../TestStreams/speech.wav" "../OutStreams/Tone_2.wav" "1" "0.5" "0.5" "1000" "15000"
:: TO DO: Call model 1 executable and name output file: out_speech_1.wav
:: TO DO: Call model 2 executable and name output file: out_speech_2.wav



cd ..

: Generate new logs
"PCMCompare.exe" OutStreams//Tone_0.wav OutStreams//Tone_1.wav 2> OutCmp//Model0_vs_Model1.txt
"PCMCompare.exe" OutStreams//Tone_1.wav OutStreams//Tone_2.wav 2> OutCmp//Model1_vs_Model2.txt



:: TO DO: Compare output of model1 and model2 and store the result in OutCmp//whiteNoise_Model1_vs_Model2.txt


