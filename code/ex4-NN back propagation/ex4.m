format long g
clear;
clc;
close;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex4-NN back propagation');

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

load('ex4data1.mat');
% Load saved matrices from file
load('ex4weights.mat');

% The matrices Theta1 and Theta2 will now be in your workspace
% Theta1 has size 25 x 401
% Theta2 has size 10 x 26

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

nn_params = [Theta1(:); Theta2(:)];

lambda = 0;
[J] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
  num_labels, X, y, lambda);
fprintf(['Cost at parameters (loaded from ex4weights): %f '...
  '\n(this value should be about 0.287629)\n'], J);

fprintf('\nChecking Cost Function (w/ Regularization) ... \n');
lambda = 1;
[J] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
  num_labels, X, y, lambda);
fprintf(['Cost at parameters (loaded from ex4weights): %f '...
  '\n(this value should be about 0.383770)\n'], J);

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_Theta1(:); initial_Theta2(:)];

fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
checkNNGradients;

fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')

%  Check gradients by running checkNNGradients
lambda = 3;
checkNNGradients(lambda);

% Also output the costFunction debugging values
debug_J  = nnCostFunction(nn_params, input_layer_size, ...
                          hidden_layer_size, num_labels, X, y, lambda);

fprintf(['\n\nCost at (fixed) debugging parameters (w/ lambda = %f): %f ' ...
         '\n(for lambda = 3, this value should be about 0.576051)\n\n'], lambda, debug_J);

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Theta1 hidden_layer_size * (input_layer_size + 1)
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
  hidden_layer_size, input_layer_size + 1);
% Theta2 num_labels * (hidden_layer_size + 1)
Theta2 = reshape(nn_params(hidden_layer_size * (input_layer_size + 1) + 1:end), ...
num_labels, hidden_layer_size + 1);

fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

pred = predict(Theta1, Theta2, X);
fprintf("Training Set Accuracy %f\n", mean(pred == y) * 100);
