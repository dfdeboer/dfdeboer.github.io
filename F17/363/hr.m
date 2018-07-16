% Script to plot the complex spectrum of a rectangle and 
% its Hilbert transform.  
%
% m(t)  = rect(t)
% mh(t) = Hilbert{m(t)}
% M(f)  = FourierTrans{m(t)}
% Mh(f) = FourierTrans{mh(t)}
%
% This script uses the rect.m    function.  It must be on the path.
% This script uses the simpson.m function.  It must be on the path.
% Written by Douglas De Boer, 10/30/2017

%Plot boundaries, step increments, and F.T. accuracy
  % Time domain boundaries
  t_start = -1.5
  t_step  =  0.001
  t_stop  =  1.5
  
  % Frequency domain boundaries
  % next three lines control F.T. accuracy  
  % Wider limits --> more accuracy, smaller f_step --> more accuracy
  f_start = -50        % if f < f_start, truncated from F.T.
  f_stop  =  50        % if f > f_end,   truncated from F.T.
  f_step  =  0.001     % this is the "df" in the F.T. integral
  
  % next two lines are for plot limits only
  f_plot_start = -10   % best if f_plot_start > f_start
  f_plot_stop  =  10   % best if f_plot_stop < f_stop
                       % plot increment will be f_step
					   
  % let M = Mr +j*Mi  be the Fourier transform of m(t) expressed 
  %     in rectangular coordinates, these are the plot axes limits
  %     next four lines are for plot axes only
  Mr_min   = -1.1      % Real part of M(f)
  Mr_max   =  1.1
  Mi_min   = -1.1      % Imaginary part of M(f)
  Mi_max   =  1.1
  
% Set up the independent axis for the frequency domain  
  f = [f_start:f_step:f_stop];

% Compute F.T. of m(t)  
  M   = sinc(f);
 
% Take the Hilbert transform in the frequency domain
  Mh  = -j*sign(f).*M;
  
  figure(1);
  hold off;
  plot3(f, M);  % Blue line by default
  hold on;
  plot3(f, Mh); % Red line by default
  hold off;
  view(+7.5, 30);
  xlabel('f');
  ylabel('real');
  zlabel('imaginary');
  title('M(f) and Mh(f) vs. f');
  axis([f_plot_start, f_plot_stop, Mr_min, Mr_max, Mi_min, Mi_max]);
  
% Do the inverse Fourier Transform on M and Mh
%
  % Set up the independent variable for the time domain
  t = [t_start:t_step:t_stop];
  
  figure(2);
  hold off;
  m = rect(t);
  
  mm = 0*t;  % dimension mm, reconstructed rect, to same dimension as t
  mh = mm;    % dimension mh, reconstructed Hilbert transform of rect
  for i = 1:length(t)
     % Reconstruct the rectangle from the inverse Fourier Transform of M
     Z  = M.*exp(j*2*pi*f*t(i));  % The stuff inside the integral
     mm(i)= simpson(Z, f_step);   % find integral{Z}d(f_step) using Simpson's rule
	 
	 % Reconstruct the Hilbert transform of the rectangle from the inverse Fourier Transform of Mh
     Zh = Mh.*exp(j*2*pi*f*t(i));  % The stuff inside the integral
     mh(i)= simpson(Zh, f_step);   % find integral{Zh}d(f_step) using Simpson's rule
  end
  
  plot(t,m);  % blue line
  hold on
  plot(t,mm); % red line
  
  figure(3);
  hold off;
  plot (t,mh,'r'); % red line

  
  
  