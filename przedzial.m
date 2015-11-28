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
## @deftypefn {Function File} {@var{retval} =} przedzial (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: sealionkat
## Created: 2015-11-28

## [amin, bmax, info] = przedzial(@(x) x^2, -10, 1)

function [amin, bmax, info] = przedzial (fn, a, d)
  a1 = a;
  delta = d;
  at = a + delta;
  
  if fn(a1) <= fn(at)
    a3 = at;
    a2 = (a1 + a3) / 2;
    while !warunek3p(fn, a1, a2, a3) #w matlabie ~ zamiast !
      a2 = (a1 + a2) / 2;
    end
  else 
    a2 = at;
    a3 = a2 + delta;
    while !warunek3p(fn, a1, a2, a3)
      delta = 2 * delta;
      a3 = a2 + delta;
    end
  end
  
  amin = a1;
  bmax = a3;
  info = 'none';
end

function [spelniony] = warunek3p(fn, a1, a2, a3)
  spelniony = false;
  if fn(a1) > fn(a2) && fn(a2) < fn(a3)
    spelniony = true;
  end;
end
