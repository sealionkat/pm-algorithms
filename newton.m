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
## @deftypefn {Function File} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sealionkat
## Created: 2015-11-29

function [xopt, fval, k] = newton (fn, a, b, epsilon)
  #1
  k = 0;
  ak = a;
  
  while true
    oldak = ak;
    #2
    f1ak = pochodna1(fn, ak);
    f2ak = pochodna2(fn, ak);
    
    #3
    ak = ak - f1ak / f2ak;
    
    #4
    if abs(ak - oldak) < epsilon || abs(f1ak) < epsilon
      xopt = ak;
      fval = fn(xopt);
      break;
    else
      k = k + 1;
    end
  end
  
  
end
