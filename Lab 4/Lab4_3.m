clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 4 - Experiment 3
fprintf('\n24-452 MSE Lab 4 Experiment 3\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 4')
 
time_files = ["t3_1_1.txt" "t3_1_2.txt" "t3_1_3.txt" "t3_1_4.txt" "t3_1_5.txt"];

freq = [1.25, 1.85, 2.3125, 2.775, 4];

%% Question 4

for i = 1:5
[t, force, disp1, disp2] = readf(time_files(i));

T=30; %sec
Fs = 1000; %Hz
y1=disp1; y2 = disp2;

figure()
plot(t,y1)
title("Car 1 "+string(i))

% select a steady state region
[x1 z1] = ginput(2);

indx = find(t>x1(1) & t<x1(2));

yy1=y1(indx);
tt=t(indx);
tt=tt-tt(1); % let my t starts from 0

% frequency vector
ff=0:1/tt(end):(length(tt)-1)/tt(end);

F=freq(i); %frequency of signal
cycle_time = 1/F;

% find maximum number of complete cycles in the selected region
num_cycles = floor(tt(end)/cycle_time);

% finding indices which are part of complete cycles
indx2 = find(tt<num_cycles*cycle_time);

yyy1=yy1(indx2);
ttt=tt(indx2);

% frequency vector
fff1 = 0:1/ttt(end):(length(ttt)-1)/ttt(end);

Z1(i) = max(abs(fft(yyy1))/(length(fft(yyy1))/2));
fprintf("z1 %d: %f\n",i,Z1(i))


figure()
plot(t,y2)
title("Car 2 "+string(i))

% select a steady state region
[x2 z2] = ginput(2);

indx = find(t>x2(1) & t<x2(2));

yy2=y2(indx);
tt=t(indx);
tt=tt-tt(1); % let my t starts from 0

% frequency vector
ff=0:1/tt(end):(length(tt)-1)/tt(end);

% find maximum number of complete cycles in the selected region
num_cycles = floor(tt(end)/cycle_time);

% finding indices which are part of complete cycles
indx2 = find(tt<num_cycles*cycle_time);

yyy2=yy2(indx2);
ttt=tt(indx2);

% frequency vector
fff2 = 0:1/ttt(end):(length(ttt)-1)/ttt(end);

Z2(i) = max(abs(fft(yyy2))/(length(fft(yyy2))/2));
fprintf("z2 %d: %f\n",i,Z2(i))

figure()
hold on
plot(fff1,abs(fft(yyy1))/(length(fft(yyy1))/2))
plot(fff2,abs(fft(yyy2))/(length(fft(yyy2))/2))
xlim([0 6])
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm)')
title("FFT Results Frequency: "+ string(freq(i))+" Hz")
legend("Car 1","Car 2")
hold off
end

%% Question 5

for i = [2 4]
    fft_ratio(i/2) = Z2(i)/Z1(i);
    fprintf("FFT ratio test %d: %f\n",i,fft_ratio(i/2))
    [amplitude_ratio(i/2), phase_diff(i/2)] = amp_phase(time_files(i), freq(i));
    fprintf("Steady State Ratio %d: %f\n",i,amplitude_ratio(i/2))
    fprintf("Steady State Phase Difference %d: %f\n",i,phase_diff(i/2))
end

%% Question 6
% Draw the mode shape for test 2 and 4

for i = [2 4]
    figure()
    draw_mode_shape(Z1(i),Z2(i),i)    
end

%% Question 7

for i = 1:5
[t1,y_dof1,y_dof2] = mdof_odesolver(freq(i),1,30);
[t, force, disp1, disp2] = readf(time_files(i));

figure()
subplot(2,1,1)
hold on
plot(t1,y_dof1*1000)  % plot the displacement response of DOF#1
xlabel('Time(sec)')
ylabel('DOF#1 (X1) Response (mm)')
plot(t,disp1)
legend("Simulaion","Experimental")
title("Simulated 2-DOF Dyanmic System "+string(i))
grid on
hold off

subplot(2,1,2)
hold on
plot(t1,y_dof2*1000) % plot the displacement response of DOF#2
plot(t,disp2)  % plot the experimental 
xlabel('Time(sec)')
ylabel('DOF#2 (X2) Response (mm)')
hold off
grid on

end