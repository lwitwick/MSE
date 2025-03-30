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

 m = zeros(9,1);
 c = zeros(9,1);
 k = zeros(9,1);
 
 %% Question 7
 for i = 1:9;
     [m(i),c(i),k(i)] = frf_fitting(file_names(i),i);
     fprintf("Mass Setup %d: %f\n",i,m(i))
     fprintf("Damping Coefficient Setup %d: %f\n",i,c(i))
     fprintf("Spring Constant Setup %d: %f\n",i,k(i))
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

%% Question 11
freq_Hz = 1:0.5:10;
freq_rads = freq_Hz*2*pi;
amplitude_ratio = zeros(1,length(freq_rads));
phase_diff = zeros(1,length(freq_rads));

m1 = m(1);
c1 = c(1);
k1 = k(1);

for j = 1:length(freq_rads);
freq = freq_rads(j);
tmax = max(readf2(file_names(1)));   %Max time
x0 = [0; 0];                     % Initial conditions

% Solve ODE
secondorder = @(t, q) [q(2); (1.2*sin(freq*t)-c1*q(2)-k1*q(1))/m1];
[t, x] = ode45(secondorder, [0 tmax], x0);

% Plot results
figure()
hold on
plot(t, x(:,1))
xlabel('Time (s)'); ylabel('Displacement (m)')
title('Mass-Spring-Damper System Response')

force = 1.2*sin(freq*t);
plot(t,force)
hold off

F = freq_Hz(j); % Frequency [Hz]
T = 1/F; % Sampling Period [s]

% We assume that steady state has been reached after 20 sec.
indx_start = find(t>20);
indx_end = find(t>20+T);
ind_range = indx_start(1):indx_end(1);

% New time, force and response vectors for just 1 cycle
tt = t(ind_range);
ff = force(ind_range);
rr = x(ind_range);

% Plot individual cycles
figure()
plot(tt,ff)
hold on
plot(tt,rr,'r')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Input Force(N)','Output Displacement(mm)')

% Finding amplitude ratio

% Amplitudes of force, displacement
amp_ff = (abs(max(ff))+abs(min(ff)))/2;
amp_rr = (abs(max(rr))+abs(min(rr)))/2;

% Index corresponding to max amplitude
indx_amp_ff = find(ff ==max(ff));
indx_amp_rr = find(rr == max(rr));

% Time corresponding to max amplitude
t1 = tt(indx_amp_ff);
t2 = tt(indx_amp_rr);

% Plot these points
plot(t1,max(ff),'*')
plot(t2,max(rr),'*r')

% Calculate
amplitude_ratio(j) = amp_rr/amp_ff;
phase_diff(j) = (t1-t2)/T*2*pi;

fprintf("Amplitude %d: %f\n",j,amplitude_ratio(j))
fprintf("Phase %d: %f\n",j,phase_diff(j))
end

%% Next Part
[freq,amp,pha]=readfreq('f3_1_1.txt',1,10);

figure()
subplot(2,1,1)
plot(freq,amp,'r')
hold on
plot(freq_Hz,amplitude_ratio*1000,"o")
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/N)')
title("Simulated FRF against experimental response 1")

subplot(2,1,2)
plot(freq,pha,'r')
hold on
plot(freq_Hz,phase_diff,"o")
xlabel('Frequency (Hz)')
ylabel('Phase (rad)')

hold off

legend("Experimental Response","Simulated Response")
%%
% function dq = secondorder(t,q,m,c,k,freq)
%     A = [0 1; -k/m -c/m];
%     B = [0; 1/m];
% 
%     dq = A*q+B*1.2*sin(2*pi*freq*t);
% end

