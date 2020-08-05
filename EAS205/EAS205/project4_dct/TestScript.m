%%
% Script to show an image
%

% read the image in
I = imread ('mandi.tif');
%I = imread ('moon.tif');
%I = imread ('cameraman.tif');

% Display the image
figure;
image(I);

% set up the colormap - 256 grayscale colors
colormap (gray(256));


% Set the aspect ratio
axis image;

%% Audio input

% load an audio signal 
figure()
% load gong
load train
% load handel;

% plot the audio signal
plot (y);

% play the audio signal
sound (y);