clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 2 - Rectilinear - Experiment 2 Question 5
fprintf('\n24-452 MSE Lab 2\n');

% make current folder
cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 2\LAB2_Rectilinear')
 
m = [2.487 1.262 0.77];
%% Question 5
file_names = ["t3_1_1.txt" "t3_1_2.txt" "t3_1_3.txt"]

for i = 1:3;
  t_firstpeak = peakfind_Q5(file_names(i));
  t_thirdpeak = peakfind_Q5(file_names(i));
  T = (t_thirdpeak-t_firstpeak)/2;
  delta = 0.5 * log(t_firstpeak/t_thirdpeak);
  dampingRatio = 1/sqrt(1 + ((2*pi)/delta)^2);
  wd = (2*pi)/T;
  wn = wd/sqrt(1 - dampingRatio^2);
  k = wn^2 * m(i);
  c = dampingRatio * 2 * sqrt(k*m(i));
  hold off
  
  fprintf("Damping Coefficient Test %d: %f\n",i,c)
  fprintf("Spring Stiffness Test %d: %f\n",i,k) 
end