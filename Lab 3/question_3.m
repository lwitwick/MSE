clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 3 - Experiment 3
fprintf('\n24-452 MSE Lab 3 Experiment 3\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 3')
 
 k_software = [200 200 200 200 200 100 0 0 0];
 c_software = [1 2 8 15 35 2 2 2 2];
 m_system = [0.77 0.77 0.77 0.77 0.77 0.77 1.754 2.488];
 file_names = ["f3_1_1.txt" "f3_1_2.txt" "f3_1_3.txt" "f3_1_4.txt" "f3_1_5.txt" "f3_1_6.txt" "f3_1_7.txt" "f3_1_8.txt" "f3_1_9.txt"];
 min_freq = 1;
 max_freq = 10;
 
 %% Question 7
 for i = 1:9;
     [m,c,k] = frf_fitting(file_names(i),i);
     fprintf("Mass Setup %d: %f\n",i,m)
     fprintf("Damping Coefficient Setup %d: %f\n",i,c)
     fprintf("Spring Constant Setup %d: %f\n",i,k)
 end
     
 %% Question 8
figure()
hold on
for i = 1:5;
    [freq,amp,pha]=readfreq(file_names(i),1,10);
    plot(freq,amp)
end
title("FRF Amplitudes of Tests with Varying Damping")
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/N)')
legend("c=1","c=2","c=8","c=15","c=35")
hold off

%% Question 9

figure()
hold on
for i = 7:9;
    [freq,amp,pha]=readfreq(file_names(i),1,10);
    plot(freq,amp)
end
title("FRF Amplitudes of Tests with Varying Mass")
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/N)')
legend("No Mass", "Two big weights","All the mass")
hold off

%% Question 10

figure()
hold on
for i = 6:7;
    [freq,amp,pha]=readfreq(file_names(i),1,10);
    plot(freq,amp)
end
title("FRF Amplitudes of Tests with Varying Spring Constant")
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/N)')
legend("k=100","k=0")
hold off
