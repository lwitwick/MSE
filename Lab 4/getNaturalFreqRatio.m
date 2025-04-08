function [wn] = getNaturalFreq(time,disp)
t_firstpeak = peakfind(time,disp);
t_secondpeak = peakfind(time,disp);
T = (t_secondpeak-t_firstpeak);
delta = log(t_firstpeak/t_secondpeak);
dampingRatio = 1/sqrt(1 + ((2*pi)/delta)^2);
wd = (2*pi)/T;
wn = wd/sqrt(1 - dampingRatio^2);

end