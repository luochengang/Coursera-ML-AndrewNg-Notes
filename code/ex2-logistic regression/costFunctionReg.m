## Copyright (C) 2023 luoch
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} costFunctionReg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-20

function [jVal, gradient] = costFunctionReg (theta, x, y, lambda)
  m = length(y); % the size of training set
  theta_reg = [0; theta(2:end)];
  jVal = -(y' * log(sigmoid(x * theta)) + (1 - y') * log(1 - sigmoid(x * theta))) / m + theta_reg' * theta_reg * lambda / (2 * m);
  gradient = ((sigmoid(x * theta) - y)' * x)' / m + theta_reg * lambda / m;
endfunction
