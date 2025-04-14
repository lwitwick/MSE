clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 4 - Experiment 2
fprintf('\n24-452 MSE Lab 4 Experiment 2\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 4')
 
freq_files = ["f2_1_1.txt" "f2_1_2.txt" "f2_1_3.txt"];

car1 = 0.797;
car2 = 0.576;
mass_added_car1 = [1.717 0.9595 1.717];
mass_added_car2 = [1.9585 1.9585 0.9595];

%% Question 2
for i = 1:3
[freq,amp1,pha1,amp2,pha2] = readfreq(freq_files(i),1,6);
figure()

subplot(2,1,1)
hold on
plot(freq,amp1)
plot(freq,amp2)
title("Experiment 2, Test "+string(i)+" FRF");
xlabel("Frequency (Hz)"); ylabel("Amplitude (mm/N)")
legend("Car 1","Car 2")
hold off

subplot(2,1,2)
hold on
plot(freq,pha1)
plot(freq,pha2)
xlabel("Frequency (Hz)"); ylabel("Phase (rad)")
legend("Car 1","Car 2")
hold off

figure()
hold on
plot(freq,amp1)
plot(freq,amp2)
title("Experiment 2, Test "+string(i)+" FRF");
xlabel("Frequency (Hz)"); ylabel("Amplitude (mm/N)")
legend("Car 1","Car 2")

% Find Peak 1 Car 1 and 2 amplitudes
[x1, ~] = ginput(2);
indx1 = find(freq>x1(1) & freq<x1(2));
aa11 = amp1(indx1);
aa12 = amp2(indx1);
peak11(i) = max(aa11);
peak12(i) = max(aa12);
peak1_ratio(i) = peak12(i)/peak11(i);
fprintf("Peak 1 Ratio Test %d: %f\n",i,peak1_ratio(i))

% Find Peak 2 Car 1 and 2 amplitudes
[x2, ~] = ginput(2);
indx2 = find(freq>x2(1) & freq<x2(2));
aa21 = amp1(indx2);
aa22 = amp2(indx2);
peak21(i) = max(aa21);
peak22(i) = max(aa22);
peak2_ratio(i) = peak22(i)/peak21(i);
fprintf("Peak 2 Ratio Test %d: %f\n",i,peak2_ratio(i))
end

%% Question 3


