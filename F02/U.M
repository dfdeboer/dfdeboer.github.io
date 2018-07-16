function y = u(n)
%
%  The unit step function
%
%  n = sample number (the independent variable)
%
%  u(n) = 1 if n is greater than or equal to zero.
%         otherwise u(n) = 0
%
%  EXAMPLE:
%  >>n = -4:1:4
%  n = 
%      -4   -3   -2   -1    0    1    2    3    4
%
%  >>u(n)
%  ans = 
%       0    0    0    0    1    1    1    1    1
%
%     Written by Douglas F. De Boer, January 13, 2000

   y = 0.5+sign(n)/2;
   y = ceil(y);

