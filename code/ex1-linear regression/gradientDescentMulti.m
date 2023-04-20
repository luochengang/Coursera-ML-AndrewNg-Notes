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
## @deftypefn {} {@var{retval} =} gradientDescentMulti (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-18

function [jVal, gradient] = gradientDescentMulti (x, y, theta)
  jVal = computeCostMulti(x, y, theta);
  m = length(y); % the size of training set

  gradient = ((x*theta - y)'*x)' / m;
##  和下面的等价
##  gradient = zeros(3, 1);
##  % 两个向量的点积用dot(x1, x2)
##  gradient(1) = dot(x*theta - y, x(:, 1)) / m;
##  gradient(2) = dot(x*theta - y, x(:, 2)) / m;
##  gradient(3) = dot(x*theta - y, x(:, 3)) / m;
endfunction
