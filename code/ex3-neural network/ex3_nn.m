format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex3-neural network');

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

load('ex3data1.mat');
% Load saved matrices from file
load('ex3weights.mat');

% The matrices Theta1 and Theta2 will now be in your Octave
% environment
% Theta1 has size 25 x 401
% Theta2 has size 10 x 26

pred = predict(Theta1, Theta2, X);
fprintf('Training Set Accuracy: %f\n', mean(pred == y) * 100);
