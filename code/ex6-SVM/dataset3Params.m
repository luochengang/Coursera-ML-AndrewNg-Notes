function [C, sigma, accuracy] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

##C = 1;
##sigma = 0.3;
##93.500000
##
##C = 1;
##sigma = 0.1;
##97.000000
##取到最佳
##
##C = 1;
##sigma = 1;
##92.500000
##
##C = 1;
##sigma = 0.03;
##93.500000
##
##C = 1;
##sigma = 0.01;
##43.500000
##
##C = 3;
##sigma = 0.1;
##96.500000

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
pred = svmPredict(model, Xval);
fprintf('Cross Validation Set Accuracy: %f\n', mean(pred == yval) * 100);
accuracy = mean(pred == yval) * 100;

% =========================================================================

end
