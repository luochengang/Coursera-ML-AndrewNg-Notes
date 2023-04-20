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
## @deftypefn {} {@var{retval} =} plotData (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-20
% 1.1 Visualizing the data
function plotData (x, y)
  % Find Indices of Positive and Negative Examples
  pos = find(y == 1);
  neg = find(y == 0);

  % Plot Examples
  % k+ 黑色+
  % LineWidth 线条宽度
  % MarkerSize +大小
  plot(x(pos, 1), x(pos, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
  hold on;
  % ko 黑色o
  % MarkerFaceColor填充颜色 y黄色
  plot(x(neg, 1), x(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
endfunction
