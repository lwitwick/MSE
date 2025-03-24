clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 3 - Experiment 3
fprintf('\n24-452 MSE Lab 3 Experiment 3\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 3')
 
 k = [200 200 200 200 200 100 0 0 0];
 c = [1 2 8 15 35 2 2 2 2];
 m = [0.77 0.77 0.77 0.77 0.77 0.77 1.754 2.488];
 file_names = ["f3_1_1.txt" "f3_1_2.txt" "f3_1_3.txt" "f3_1_4.txt" "f3_1_5.txt" "f3_1_6.txt" "f3_1_7.txt" "f3_1_8.txt" "f3_1_9.txt"];
 min_freq = 1;
 max_freq = 10;
 
 %% Question 7
 for i = 1:9;
     [freq,amp,pha] = readfreq(file_names(i),min_freq,max_freq);
     figure()
     subplot(2,1,1)
     plot(freq,amp)
     subplot(2,1,2)
     plot(freq,pha)
 end
     
 