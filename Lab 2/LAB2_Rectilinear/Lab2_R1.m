clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 2 - Rectilinear - Experiment 1
fprintf('\n24-452 MSE Lab 2\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 2\LAB2_Rectilinear')
 files = ["t2_1_1.txt" "t2_1_2.txt" "t2_1_3.txt" "t2_1_4.txt"];
 
 m = [1.717 1.717 1.717 0.492];
 c = [20 40 60 40];
 F0 = 2;
 
 tau = [0 0 0 0];
 c_exp = [0 0 0 0];
%% ----------------------------------------------------
for i = 1:4;
    tau(i) = calc_time_const(files(i));
    c_exp(i) = m(i)./tau(i);
    fprintf("Time Constant Experiment 1: %f\n",tau(i))
    fprintf("Damping Coefficient Experiment 1: %f\n",c_exp(i))
end