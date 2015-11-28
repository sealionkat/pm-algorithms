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
## @deftypefn {Function File} {@var{retval} =} golden (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sealionkat
## Created: 2015-11-28

function [xopt, fval, k] = golden (fn, a, b, epsilon)
 k = 1;
 ak = a;
 bk = b;
 c = (sqrt(5) - 1) / 2;
 
 #1
 xk1 = bk - c * (bk - ak);
 xk2 = ak + c * (bk - ak);
 fxk1 = fn(xk1);
 fxk2 = fn(xk2);
 deltak = bk - ak;
 
 #2
 while abs(deltak) < epsilon
  #3
  if fxk2 > fxk1
    ak = ak;
    bk = xk2;
    xk2 = xk1;
    fxk2 = fxk1;
    xk1 = bk - c * (bk - ak);
    fxk1 = fn(xk1);
  #4
  elseif fxk2 <= fxk1
    ak = xk1;
    bk = bk;
    xk1 = xk2;
    fxk1 = fxk2;
    xk2 = ak + c * (bk - ak);
    fxk2 = fn(xk2);
  end
  #5
  k = k + 1;
 end
 
 xopt = (ak + bk) / 2;
 fval = fn(xopt);
 
end
