format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex1-linear regression');
% 2.1 Plotting the Data
% ex1data1.txt中的数据有m行，其中每行有两个用,分隔的数值
% load加载后得到的是一个m*2的矩阵
data = load('ex1data1.txt');
% disp(data);
x = data(:, 1);
y = data(:, 2);
% r红色 x叉点
figure(1);
plot(x, y, 'rx', 'MarkerSize', 10);
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');

% 2.2 Gradient Descent
m = length(y);
x = [ones(m, 1), data(:, 1)];
theta = zeros(2, 1);
disp(sprintf('initial cost J(theta) = %f', computeCost(x, y, theta)));

iteration = 1500;
alpha = 0.01;
for i = 1:iteration
  [jVal, gradient] = gradientDescent(x, y, theta);
  % 这里即使训练完成, J(theta)也不会为0, 只是取得最小值
  % disp(jVal);
  theta -= alpha * gradient;
end;
% disp(theta);

hold on;
x_st = linspace(4, 25);
plot(x_st, theta(1) + theta(2) * x_st);

predict1 = [1, 3.5] * theta;
predict2 = [1, 7] * theta;
disp(sprintf('predict1 is %f', predict1));
disp(sprintf('predict2 is %f', predict2));

% 2.4 Visualizing J(θ)
% 绘制三维图像
x_sca = -10:0.05:10;
y_sca = -1:0.05:4;

[X, Y] = meshgrid(x_sca, y_sca);
Z = zeros(size(X, 1), size(X, 2));

for i = 1:size(X, 1)
  for j = 1:size(X, 2)
    theta_sca = [X(i, j) ; Y(i, j)];
    Z(i, j) = computeCost(x, y, theta_sca);
  endfor
endfor
figure(2);
mesh(X, Y, Z);

