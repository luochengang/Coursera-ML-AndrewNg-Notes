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
## @deftypefn {} {@var{retval} =} strm (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: luoch <luoch@LUOCHENGANG_IND>
## Created: 2023-03-28
## 实现C++中strcmp的功能
## 逐位比较
function p = strm(str1, str2)
k=min(length(str1),length(str2));
for n=1:k   %比较前k位
    if(str1(n)>str2(n))
        p=1;break;
    elseif(str1(n)==str2(n))
        p=0;
    else p=-1;break;
    end
end

if(p==0)
    if(length(str1)>length(str2)) %前k位相等，但str1更长
        p=1;
    elseif(length(str1)==length(str2))
        p=0;
    else p=-1;
    end
end
endfunction
