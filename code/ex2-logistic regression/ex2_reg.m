% 2 Regularized logistic regression
format long g
clear;
clc;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex2-logistic regression');
% ex2data2.txt中的数据有m行，其中每行有3个用comma,分隔的数值
% load加载后得到的是一个m*3的矩阵
data = load('ex2data2.txt');
x = data(:, 1:2);
y = data(:, 3);
plotData(x, y);
xlabel('Microchip Test 1');
ylabel('Microchip Test 2');
legend('y = 1', 'y = 0');

m = length(y);
x = [ones(m, 1), x];
mapped_x = [];
for i=1:m
  r = mapFeature(x(i,:)');
  mapped_x = [mapped_x; r'];
endfor

x = mapped_x;
initial_theta = zeros(size(x, 2), 1);
lambda = 100.0;
[jVal, gradient] = costFunctionReg (initial_theta, x, y, lambda);
disp(sprintf('initial cost J(theta) = %f', jVal));

% Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Run fminunc to obtain the optimal theta
% This function will return theta and the cost
% 这里的t相当于theta
[theta, cost] = fminunc(@(t)(costFunctionReg(t, x, y, lambda)), initial_theta, options);
% disp(theta);
disp(sprintf('final cost J(theta) = %f', cost));

% 2.4 Plotting the decision boundary
[x1,x2]=meshgrid(-1:0.01:1.5);%生成格网
z = zeros(size(x1, 1), size(x1, 2));
for i = 1:size(x1, 1)
  for j = 1:size(x1, 2)
    z(i, j) = predict(mapFeature([1; x1(i, j); x2(i, j)])', theta);
  endfor
endfor

% disp(z);
[C,h]=contour(x1, x2, z);
colormap autumn;
clabel(C,h,'FontSize',0.1);

