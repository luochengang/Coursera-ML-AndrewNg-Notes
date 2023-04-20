format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex1-linear regression');
data = load('ex1data2.txt');
y = data(:, 3);
m = length(y);
x = [ones(m, 1), data(:, 1:2)];
theta = normalEqn(x, y);
disp(theta);

x_test = [1; 1650; 3];
y_pred = theta' * x_test;
disp(y_pred);

