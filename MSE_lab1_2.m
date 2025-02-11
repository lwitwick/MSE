clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 1 - Rectiliear - Experiment 2
fprintf('\n24-452 MSE Lab 1\n');

% ----------------------------------------------------
% Data Import

data1 = textread('test2_1.txt','','headerlines',22);
time1 = data1(:,1);
force1 = data1(:,2);
disp1 = data1(:,3) * 0.01;

data2 = textread('test2_2.txt','','headerlines',22);
time2 = data2(:,1);
force2 = data2(:,2);
disp2 = data2(:,3) * 0.01; 

data3 = textread('test2_3.txt','','headerlines',22);
time3 = data3(:,1);
force3 = data3(:,2);
disp3 = data3(:,3) * 0.01;

data4 = textread('test2_4.txt','','headerlines',22);
time4 = data4(:,1);
force4 = data4(:,2);
disp4 = data4(:,3) * 0.01;

data5 = textread('test2_5.txt','','headerlines',22);
time5 = data5(:,1);
force5 = data5(:,2);
disp5 = data5(:,3) * 0.01;

data6 = textread('test2_6.txt','','headerlines',22);
time6 = data6(:,1);
force6 = data6(:,2);
disp6 = data6(:,3) * 0.01;

data7 = textread('test2_7.txt','','headerlines',22);
time7 = data7(:,1);
force7 = data7(:,2);
disp7 = data7(:,3) * 0.01;

data8 = textread('test2_8.txt','','headerlines',22);
time8 = data8(:,1);
force8 = data8(:,2);
disp8 = data8(:,3) * 0.01;

data9 = textread('test2_9.txt','','headerlines',22);
time9 = data9(:,1);
force9 = data9(:,2);
disp9 = data9(:,3) * 0.01;

data10 = textread('test2_10.txt','','headerlines',22);
time10 = data10(:,1);
force10 = data10(:,2);
disp10 = data10(:,3) *0.01;
%% Question 2 - 
% Use data 1 and 2 to find the natural frequencies and damping
% ratios with logarithmic decrement. Since the spring rate is (assumed to be)
% constant, you can determine the change in mass from the ratio of natural 
% frequencies.)

t_firstpeak1 = peakfind(time1,disp1);
t_thirdpeak1 = peakfind(time1,disp1);
T1 = (t_thirdpeak1-t_firstpeak1)/2;
delta1 = 0.5 * log(t_firstpeak1/t_thirdpeak1);
dampingRatio1 = 1/sqrt(1 + ((2*pi)/delta1)^2);
wd1 = (2*pi)/T1;
wn1 = wd1/sqrt(1 - dampingRatio1^2);

t_firstpeak2 = peakfind(time2,disp2);
t_thirdpeak2 = peakfind(time2,disp2);
T2 = (t_thirdpeak2-t_firstpeak2)/2;
delta2 = 0.5 * log(t_firstpeak2/t_thirdpeak2);
dampingRatio2 = 1/sqrt(1 + ((2*pi)/delta2)^2);
wd2 = (2*pi)/T2;
wn2 = wd2/sqrt(1 - dampingRatio2^2); 

wn_ratio = (wn2^2) / (wn1^2);
m = 1.475;
car_mass = (m*wn_ratio)/(1 - wn_ratio);

k = wn1^2 * m;
c1 = dampingRatio1 * 2 * sqrt(k*m);
c2 = dampingRatio2 * 2 * sqrt(k*(m+1475));

fprintf("Car Mass: %4f\n",car_mass)
fprintf("Spring Rate: %d\n",k)
fprintf("Damping Coefficient Test 1: %2f\nDamping Coefficient Test 2: %2f \n", c1, c2)
fprintf("Damping Ratio Test 1: %4f\nDamping Ratio Test 2: %4f\n",dampingRatio1, dampingRatio2)
%% Question 3
t_firstpeak2 = peakfind(time2,disp2);
t_thirdpeak2 = peakfind(time2,disp2);
T2 = (t_thirdpeak2-t_firstpeak2)/2;
delta2 = 0.5 * log(t_firstpeak2/t_thirdpeak2);
dampingRatio2 = 1/sqrt(1 + ((2*pi)/delta2)^2);
wd2 = (2*pi)/T2;
wn2 = wd2/sqrt(1 - dampingRatio2^2);

t_firstpeak3 = peakfind(time3,disp3);
t_thirdpeak3 = peakfind(time3,disp3);
T3 = (t_thirdpeak3-t_firstpeak3)/2;
delta3 = 0.5 * log(t_firstpeak3/t_thirdpeak3);
dampingRatio3 = 1/sqrt(1 + ((2*pi)/delta3)^2);
wd3 = (2*pi)/T3;
wn3 = wd3/sqrt(1 - dampingRatio3^2); 

wn_ratio = (wn3^2) / (wn2^2);
M = 1.475 + car_mass;
littleMass = (M*(1-wn_ratio))/wn_ratio;

fprintf('Little Mass %2f\n',littleMass)