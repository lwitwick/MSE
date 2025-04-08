clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 4 - Experiment 1
fprintf('\n24-452 MSE Lab 4 Experiment 1\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 4')
 
freq_files = ["f1_1_1.txt" "f1_1_2.txt" "f1_1_3.txt" "f1_1_4.txt" "f1_1_5.txt"];
time_files = ["t1_1_1.txt" "t1_1_2.txt" "t1_1_3.txt" "t1_1_4.txt" "t1_1_5.txt"];

m = [0 1.9585 1.9585 0 1.9585];
k = [0 0 0 0 0];
c = [0 0 0 0 0];

% figure()
% [t,force,disp1,disp2] = readf(time_files(1));
% plot(t,disp1)
% xlabel("Time (s)"); ylabel("Displacement (mm)")
% title("System Identification Test 1 Response")
 %% Question 1
 
 % Car 1 Data
 for i = 1:3
     [t,force,disp1,disp2] = readf(time_files(i));
     [wn(i),dampingRatio(i)] = getNaturalFreq(t,disp1);
 end

  % Car 2 Data
 for i = 4:5
     [t,force,disp1,disp2] = readf(time_files(i));
     [wn(i),dampingRatio(i)] = getNaturalFreq(t,disp2);
 end

wn_ratio1 = wn(2)/wn(1);
wn_ratio2 = wn(5)/wn(4);
mass1 = (1.9585*wn_ratio1^2)/(1 - wn_ratio1^2)
mass2 = (1.9585*wn_ratio2^2)/(1 - wn_ratio2^2)

for i = 1:3
    k(i) = wn(i)^2 * (mass1+m(i));
    c(i) = dampingRatio(i) * 2 * sqrt(k(i)*(mass1+m(i)));
    fprintf("Damping Coefficient Test %d: %f\n",i,c(i))
    fprintf("Spring Stiffness Test %d: %f\n",i,k(i)) 
end

for i = 4:5
    k(i) = wn(i)^2 * (mass2+m(i));
    c(i) = dampingRatio(i) * 2 * sqrt(k(i)*(mass2+m(i)));
    fprintf("Damping Coefficient Test %d: %f\n",i,c(i))
    fprintf("Spring Stiffness Test %d: %f\n",i,k(i))
end
