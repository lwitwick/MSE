clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 1 - Torsional - Experiment 1
fprintf('\n24-452 MSE Lab 1 Torsional Experiment 1');

% ----------------------------------------------------

data = textread('t1_1.txt','','headerlines',22);
time1 = data(:,1);
torque1 = data(:,2);
disp1 = data(:,3);

curveFitter(disp1, torque1)
% ----------------------------------------------------

data = textread('t1_2.txt','','headerlines',22);
time2 = data(:,1);
torque2 = data(:,2);
disp2 = data(:,3);

curveFitter(disp2, torque2)
% ----------------------------------------------------
data = textread('t1_3.txt','','headerlines',22);
time3 = data(:,1);
torque3 = data(:,2);
disp3 = data(:,3);

curveFitter(disp3, torque3)
% ----------------------------------------------------
data = textread('t1_4.txt','','headerlines',22);
time4 = data(:,1);
torque4 = data(:,2);
disp4 = data(:,3);

curveFitter(disp4, torque4)
% ----------------------------------------------------
data = textread('t1_5.txt','','headerlines',22);
time5 = data(:,1);
torque5 = data(:,2);
disp5 = data(:,4);

curveFitter(disp5, torque5)
%----------------------------------------------------
data = textread('t1_6.txt','','headerlines',22);
time6 = data(:,1);
torque6 = data(:,2);
disp6 = data(:,4);

curveFitter(disp6, torque6)
% ----------------------------------------------------
data = textread('t1_7.txt','','headerlines',22);
time7 = data(:,1);
torque7 = data(:,2);
disp7 = data(:,4);

curveFitter(disp7, torque7)
% ----------------------------------------------------
data = textread('t1_8.txt','','headerlines',22);
time8 = data(:,1);
torque8 = data(:,2);
disp8 = data(:,4);

curveFitter(disp8, torque8)
