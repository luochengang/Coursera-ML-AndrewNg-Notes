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
## @deftypefn {} {@var{retval} =} featureNormalize (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-18

function [normX, meanVal, deriv] = featureNormalize (x)
  meanVal = zeros(size(x, 2), 1);
  deriv = zeros(size(x, 2), 1);

  meanVal(1) = mean(x(:, 1)');
  deriv(1) = std(x(:, 1));

  meanVal(2) = mean(x(:, 2)');
  deriv(2) = std(x(:, 2));

  x(:, 1) = (x(:, 1) - meanVal(1)) / deriv(1);
  x(:, 2) = (x(:, 2) - meanVal(2)) / deriv(2);
  normX = x;
endfunction
