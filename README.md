# Audio-Spectogram-Image-Construction
This customized function save the MATLAB's generated audio spectrogram as image
For a project I needed to save the spectrogram using short term fourier transform as an image for further classification of speakers. Bag of features used after extracting SURF features from those spectrogram images. I chose MATLAB for this work due to vats library availability. There is a function to plot spectrogram. I loaded audio signal and used that function directly to plot spectrogram.

[input,fs]=audioread('testnext1.wav');
spectrogram(input)


Though a combination of magnitude and phase compensation was used after reading the audio, which will be discussed in next blog. This spectrogram must be saved as an image which needs to be in the form of pixel, when it is saved from the menu option then extra white space around boundaries of spectrogram was also saved. But for our classification task we need only the spectogram image pixels values, excluding everything else. So a code need to be written to achieve this target.

Since the maximum pixel value for an RGB image is 255 and all other pixles lie in between range of 0-255 intensity. If a pixle is of 255 intensity then that pixle will represent the white color in the image. It acts as the motivational factor for our algorithm. Since margin space around the spectrogram is white, so if we can identify the number of columns then we can remove those columns and rows from the image matrix as image operation are done in form of matrix in MATLAB. A snapshot in support of above point is attached.

First of all the spectrogram image has to be converted into RGB format, we did by using the function 'print'

PastacodeProvider: Write code
Syntax: HTML
cdata=print('-RGBImage');
This cdata is passed to custom built  function which scans the white columns and rows and remove them from the original cdata matrix. The code results in the outcome as



The customize function to save the spectogram as image is available for free download from github or can be downloaded from above button.
