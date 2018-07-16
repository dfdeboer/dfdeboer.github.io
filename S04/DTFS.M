function [ck, k] = dtfs(x)
% DTFS  Discrete-Time Fourier Series
%    [ck, k] = dtfs(x)
%
%    x = A row or column vector of sample values--the fundamental period only.
%        (Fundamental period of samples are samples zero through N-1 
%        where N = fundamental period of the signal.)  If x is a matrix, then
%        ck will be a matrix the same size as x.  Each column of x will 
%        contain the Fourier Series coefficients of each column of x.
%
%    k = A column vector of harmonic numbers, zero through N-1.
%
%    ck = A column vector, the discrete-time Fourier Series coefficients of x.
%
% Note:  The inverse transform can be found with dtfs too: 
%        x = N*conj(dtfs(conj(ck)));  % where N is the period
%        Or using two lines so that the sample numbers are preserved:  
%        [x, n] = dtfs(conj(ck));  % n is a vector of sample numbers
%        x = N*conj(x);            % x is the vector of reconstructed samples
%        If real numbers are expected it is wise to use an absolute value 
%        function in place of the outer (last) conj operator
%        x = N*abs(dtfs(conj(ck)));   
%             - or -
%        [x, n] = dtfs(conj(ck));
%        x = N*abs(x);
%
%    Written by Douglas De Boer, April 9, 2004.

if min(size(x)) == 1
   x  = x(:);         % Convert x to a column vector, if it was a row vector.
end
N  = length(x);
n  = [0:1:N-1];
k  = [0:1:N-1];
WN = exp(j*2*pi/N);   % The basic "twiddle factor"
nk = -n'*k;           % A square matrix. Each entry is the negation of the 
                      %    product of its row  number and its column number.  
                      %    (Rows and columns are numbered 0 thru N-1.)
WN = WN.^nk;          % WN is replaced by a matrix the size of nk where each
                      %    element is WN to the power of the row number times
                      %    the column number.  (Numbered 0 thru N-1.)

ck = (WN*x)/N;        % column vector or matrix of Fourier Series coefficients

