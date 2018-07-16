function y = limit(x,MAX)
%
%  y = limit(x,MAX)  Limits x so that every element of x is <= MAX
%

%  Doug De Boer 3/8/94

   y = ceil((sign(x-MAX)+1)/2);
   y = x - x.*y + MAX*y;

