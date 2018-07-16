% A script to plot a pulse and its two-sided spectrum
% DDB 10/15/02

tmax = 10;
tstep = 0.01;
mmax = 20;
T = 1;
t0 = 0.0;
delta = 0.2;
t = [-tmax:tstep:tmax];
m = [-mmax:1:mmax];
x = zeros(size(t));

kmax = ceil(tmax/T)
for k = -kmax:kmax,
     x = x + rect((t - t0 -k*T)/(delta*T));
end
x = 100*x;  % Make the pulse amplitude 100, not 1
figure(1)
plot(t,x);

omega = 2*pi/T;
X = 100*delta*sa(m*pi*delta).*exp(-j*m*omega*t0);
figure(2)
gain = 20*log(abs(X));
stem(m,gain);
axis([-mmax mmax 0 100]);
%This spectral plot is incomplete.  Subplot should be used
%to add the phase plot.
