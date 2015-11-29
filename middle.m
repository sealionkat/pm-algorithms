## Copyright (C) 2015 sealionkat
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} middle (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sealionkat
## Created: 2015-11-29

function [xopt, fval, k] = middle (fn, a, b, epsilon)
  k = 1;
  ak = a;
  bk = b;
  
  
  while true
    #1
    zk = (ak + bk) / 2;
    f1zk = pochodna1(fn, zk);
    
    if f1zk < epsilon
      xopt = zk;
      fval = fn(xopt);
      break;
    elseif f1zk > 0
      #2
      ak = ak;
      bk = zk;
    elseif f1zk < 0 
      #3
      ak = zk;
      bk = bk;
    end
    
    #4
    if abs(bk - ak) < epsilon
      xopt = (ak + bk) / 2;
      fval = fn(xopt);
    else
      k = k + 1;
    end
  end
  
  
end
