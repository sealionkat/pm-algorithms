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
## @deftypefn {Function File} {@var{retval} =} dychotomia (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sealionkat
## Created: 2015-11-28

function [xopt, fval, k] = dychotomia (fn, a, b, epsilon)
  k = 1;
  ak = a;
  bk = b;
  
  #1
  xkm = (ak + bk) / 2;
  deltak = bk - ak;
  fxkm = fn(xkm);
  
  while true
    #2
    xk1 = ak + deltak / 4;
    xk2 = bk - deltak / 4;
    fxk1 = fn(xk1);
    fxk2 = fn(xk2);
    
    goto6 = false;
    
    #3
    if fxk1 < fxkm
      bk = xkm;
      ak = ak;
      deltak = bk - ak;
      xkm = xk1;
      fxkm = fxk1;
      #goto 6
      goto6 = true;
    end
    
    #4
    if fxk2 < fxkm && !goto6
      ak = xkm;
      bk = bk;
      deltak = bk - ak;
      xkm = xk2;
      fxkm = fxk2;
      #goto 6
      goto6 = true;
    end
    
    #5
    if !goto6
      ak = xk1;
      bk = xk2;
      deltak = bk - ak;
    end
    
    #6
    if abs(deltak) <= 2 * epsilon
      xopt = xkm;
      fval = fn(xkm);
      break;
    end
    
    k = k + 1;
  end
  
end
