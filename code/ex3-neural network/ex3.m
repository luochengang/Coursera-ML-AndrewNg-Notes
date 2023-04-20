format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex3-neural network');

% Load saved matrices from file
load('ex3data1.mat');
% The matrices X and y will now be in your Octave environment
% 1.2 Visualizing the data
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);
displayData(sel);

lambda = 0.1;
num_labels = 10;
all_theta = oneVsAll(X, y, num_labels, lambda);

pred = predictOneVsAll(all_theta, X);
fprintf('Training Set Accuracy: %f\n', mean((pred == y)) * 100);
