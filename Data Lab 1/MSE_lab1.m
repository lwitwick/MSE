clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 1 - Rectilinear - Experiment 1
fprintf('\n24-452 MSE Lab 1');

% ----------------------------------------------------

data = textread('test1_1.txt','','headerlines',22);
time = data(:,1);
force = data(:,2);
disp = data(:,3);

hold on
figure(1)

% Time vs. Displacement
subplot(2,1,1)
plot(time, disp,'LineWidth',1,'Color','b')
title('Time vs. Displacement for Trial 1-1')
xlabel('Time (s)')
ylabel('Displacement (mm)')
grid minor

% Time vs. Force
subplot(2,1,2)
plot(time,force,'LineWidth',1,'Color','r')
title('Time vs. Force for Trial 1-1')
xlabel('Time (s)')
ylabel('Force (N?)')
grid minor

hold off

curveFitter(force, disp)
% ----------------------------------------------------
data = textread('test1_2.txt','','headerlines',22);
time2 = data(:,1);
force2 = data(:,2);
disp2 = data(:,3);

curveFitter(force2, disp2)
% ----------------------------------------------------
data = textread('test1_3.txt','','headerlines',22);
time3 = data(:,1);
force3 = data(:,2);
disp3 = data(:,3);

curveFitter(force3, disp3)
% ----------------------------------------------------
data = textread('test1_4.txt','','headerlines',22);
time4 = data(:,1);
force4 = data(:,2);
disp4 = data(:,3);

curveFitter(force4, disp4)
% ----------------------------------------------------
data = textread('test1_5.txt','','headerlines',22);
time5 = data(:,1);
force5 = data(:,2);
disp5 = data(:,3);

curveFitter(force5, disp5)

