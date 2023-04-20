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
## @deftypefn {} {@var{retval} =} mapFeature (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-20
% x是vector
function retval = mapFeature (x)
  v1 = [1; x(2); x(2)^2; x(2)^3; x(2)^4; x(2)^5; x(2)^6];
  v2 = [1 x(3) x(3)^2 x(3)^3 x(3)^4 x(3)^5 x(3)^6];
  mat = v1 * v2;
  [m, n] = size(mat);

  retval = [];
  for i=1:n
    retval = [retval; mat(1:m - (i - 1), i)];
  endfor
endfunction
