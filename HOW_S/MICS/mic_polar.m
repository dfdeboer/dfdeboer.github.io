% A plot of microphone polar paterns.
%
theta = pi*[-180:1:180]/180;  % degrees converted to radians


% patterns, uncomment one
%gain = abs(1 +     0*theta); %Omni
%gain = abs(0.9 +     0.1*cos(theta)); %Omni practical
%gain = abs(0.5 +   0.5*cos(theta)); %Cardioid 
%gain = abs(0.33 + 0.67*cos(theta)); %Super Cardioid 
%gain = abs(0.0 +   1.0*cos(theta)); %Figure 8 
gain = abs((cos(4*theta).*(0.33 + 0.67*cos(theta).^5))); %Figure 8 
clf;
polar(theta, gain, '-g');
set (gca, "fontsize", 20, "linewidth", 2, "rtick", 0.2:0.2:1, "ttick", 0:30:330);
hold on;  %kludge to increase line width
%kludge to change plot line color--color exchange in The Gimp. [0,50,75]
%size the figure to about 600 pixels high (2/3 of my laptop screen) 
gain1=gain*0.995;
polar(theta, gain1, '-g');
gain1=gain*0.990;
polar(theta, gain1, '-g');
gain1=gain*0.985;
polar(theta, gain1, '-g');
gain1=gain*0.980;
polar(theta, gain1, '-g');
gain1=gain*0.985;
polar(theta, gain1, '-g');
gain1=gain*0.980;
polar(theta, gain1, '-g');
gain1=gain*0.975;
polar(theta, gain1, '-g');
gain1=gain*0.970;
polar(theta, gain1, '-g');
gain1=gain*0.965;
polar(theta, gain1, '-g');
gain1=gain*0.960;
polar(theta, gain1, '-g');

