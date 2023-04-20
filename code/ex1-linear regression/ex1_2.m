format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex1-linear regression');
data = load('ex1data2.txt');
% disp(data);
x = data(:, 1:2);
y = data(:, 3);

[x, meanVal, deriv] = featureNormalize(x);

m = length(y);
m = length(y);
x = [ones(m, 1), x];
theta = zeros(3, 1);
% disp(computeCost(x, y, theta));

iteration = 1500;
alpha = 0.01;
for i = 1:iteration
  [jVal, gradient] = gradientDescentMulti(x, y, theta);
  % 这里即使训练完成, J(theta)也不会为0, 只是取得最小值
  % disp(jVal);
  theta -= alpha * gradient;
end;
disp(theta);

x_test = [1; ([1650; 3] - meanVal) ./ deriv];
y_pred = theta' * x_test;
disp(y_pred);
