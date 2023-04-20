% 1 Logistic Regression
format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex2-logistic regression');
% ex2data1.txt中的数据有m行，其中每行有3个用comma,分隔的数值
% load加载后得到的是一个m*3的矩阵
data = load('ex2data1.txt');
x = data(:, 1:2);
y = data(:, 3);
plotData(x, y);
xlabel('Exam 1 score');
ylabel('Exam 2 score');
legend('Admitted', 'Not admitted');

m = length(y);
x = [ones(m, 1), x];
initial_theta = zeros(3, 1);

[jVal, gradient] = costFunction (initial_theta, x, y);
disp(sprintf('initial cost J(theta) = %f', jVal));

% 1.2.3 Learning parameters using fminunc
% Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Run fminunc to obtain the optimal theta
% This function will return theta and the cost
% 这里的t相当于theta
[theta, cost] = fminunc(@(t)(costFunction(t, x, y)), initial_theta, options);
disp(theta);
disp(sprintf('final cost J(theta) = %f', cost));

plotDecisionBoundary(theta);

% For a student with an Exam 1 score of 45 and an Exam 2 score of 85, admission
% probability is 0.776
x_test = [1; 45; 85];
disp(sprintf('admission probability is %f', sigmoid(theta' * x_test)));

