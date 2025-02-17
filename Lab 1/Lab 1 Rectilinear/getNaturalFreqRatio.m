function [wn_ratio,wn1,wn2,dampingRatio1,dampingRatio2] = getNaturalFreqRatio(time1,disp1,time2,disp2)
[t_firstpeak1,xt_firstpeak1] = peakfind(time1,disp1);
[t_thirdpeak1, xt_thirdpeak1] = peakfind(time1,disp1);
T1 = (t_thirdpeak1-t_firstpeak1)/2;
delta1 = 0.5 * log(xt_firstpeak1/xt_thirdpeak1);
dampingRatio1 = 1/sqrt(1 + ((2*pi)/delta1)^2);
wd1 = (2*pi)/T1;
wn1 = wd1/sqrt(1 - dampingRatio1^2);

[t_firstpeak2,xt_firstpeak2] = peakfind(time2,disp2);
[t_thirdpeak2, xt_thirdpeak2] = peakfind(time2,disp2);
T2 = (t_thirdpeak2-t_firstpeak2)/2;
delta2 = 0.5 * log(xt_firstpeak2/xt_thirdpeak2);
dampingRatio2 = 1/sqrt(1 + ((2*pi)/delta2)^2);
wd2 = (2*pi)/T2;
wn2 = wd2/sqrt(1 - dampingRatio2^2); 

wn_ratio = (wn2^2) / (wn1^2);
end