function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
  % Theta1 hidden_layer_size * (input_layer_size + 1)
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
    hidden_layer_size, input_layer_size + 1);
  % Theta2 num_labels * (hidden_layer_size + 1)
  Theta2 = reshape(nn_params(hidden_layer_size * (input_layer_size + 1) + 1:end), ...
  num_labels, hidden_layer_size + 1);




  m = size(X, 1); % the size of training set
  a1 = [ones(m, 1) X];
  % z2 m * hidden_layer_size
  z2 = a1 * Theta1';
  % a2 m * (hidden_layer_size + 1)
  a2 = [ones(m, 1) sigmoid(z2)];
  % z3 m * num_labels
  z3 = a2 * Theta2';
  % a3 m * num_labels
  a3 = sigmoid(z3);

  % y_tr的每一行是training example
  y_tr = zeros(m, num_labels);
  for i = 1:m
    y_tr(i, y(i)) = 1;
  endfor
  y = y_tr;

  J = -sum(sum(log(a3) .* y + log(1 - a3) .* (1 - y))) / m;
  ## 等价形式 灵感来源 不考虑系数问题和正则化
##  J = 0.0;
##  for i = 1:m
##    J += log(a3(i, :)) * y(i, :)' + log(1 - a3(i, :)) * (1 - y(i, :))';
##  endfor
  reg_term = (sum(sum(Theta1(:, 2:end) .^ 2)) + ...
    sum(sum(Theta2(:, 2:end) .^ 2))) * lambda / (2 * m);
  J += reg_term;

  Theta1_grad = zeros(size(Theta1));
  Theta2_grad = zeros(size(Theta2));

  for t = 1:m
    delta3 = (a3(t, :) - y(t, :))';

    % 注意a2(t, 1) = 1, 而常数的partial derivatives为0
    delta2 = (Theta2' * delta3) .* [0; sigmoidGradient(z2(t, :)')];
    delta2 = delta2(2:end);
    % input layer has no cost, so there is no delta1

    Theta2_grad += delta3 * a2(t, :);
    Theta1_grad += delta2 * a1(t, :);
  endfor
  Theta1_grad /= m;
  Theta2_grad /= m;

  % add regularization term
  Theta1_grad += [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)] * lambda / m;
  Theta2_grad += [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)] * lambda / m;

  grad = [Theta1_grad(:); Theta2_grad(:)];
end
