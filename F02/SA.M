function [out] = sinc(in)

% SA ........	Sampling function, sin(x)/(x).
%

%	AUTHORS : M. Zeytinoglu & N. W. Ma 
%             Department of Electrical & Computer Engineering
%             Ryerson Polytechnic University
%             Toronto, Ontario, CANADA
%
%	DATE    : August 1991.
%	VERSION : 1.0
%
%MODIFIED BY: Douglas De Boer 10/15/02

%===========================================================================
% Modifications history:
% ----------------------
%	o	Tested (and modified) under MATLAB 4.0/4.1 08.16.1993 MZ
%  Converted from sinc to sa 10/15/02
%===========================================================================

[m,n] = size(in);
out   = ones(m,n);
index = (in ~= 0);
x     = in;
out(index) = sin(x(index)) ./ x(index);
