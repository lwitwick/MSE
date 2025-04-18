clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 5 - Experiment 1
fprintf('\n24-452 MSE Lab 5 Experiment 1\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 5')
 
 file_names = "f1_1_1.txt";

 %% Question 1

[m,c,k] = frf_fitting(file_names,1);
fprintf("Mass Setup: %f\n",m)
fprintf("Damping Coefficient Setup: %f\n",c)
fprintf("Spring Constant Setup: %f\n",k)
