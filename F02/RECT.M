function y=rect(t)

t=abs(t);
t=t-0.5;
y=sign(-t);
y=y+1;
y=min(ones(size(y)),y);