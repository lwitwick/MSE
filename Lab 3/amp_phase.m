close all
clc
clear all

%% Reading file
[time,force,resp] = readf2('Exp1_test1(time).txt');

figure(1)
plot(time,force)

figure(2)
plot(time,resp)

%% Plot over specific time intervals
tl = 10; % Desired lower bound
tu = 15; % Desired upper bound
figure(3)
plot(time(tl*1000+1:tu*1000),force(tl*1000+1:tu*1000))
hold on 
plot(time(tl*1000+1:tu*1000),resp(tl*1000+1:tu*1000))
hold off
legend('Force','Response')



%% Finding index for 1 complete cycle in steady state region

F = 3; % Frequency [Hz]
T = 1/F; % Sampling Period [s]

% We assume that steady state has been reached after 20 sec.
indx_start = find(time>20);
indx_end = find(time>20+T);
ind_range = indx_start(1):indx_end(1);

% New time, force and response vectors for just 1 cycle
tt = time(ind_range);
ff = force(ind_range);
rr = resp(ind_range);

% Plot individual cycles
figure(4)
plot(tt,ff)
hold on
plot(tt,rr,'r')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Input Force(N)','Output Displacement(mm)')

%% Finding amplitude ratio

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
amplitude_ratio = amp_rr/amp_ff
phase_diff = (t1-t2)/T*2*pi