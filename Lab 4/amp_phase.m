function [amplitude_ratio, phase_diff] = amp_phase(file_name, freq)

% Reading file
[time,force,disp1,disp2] = readf(file_name);

figure()
plot(time,disp1)

figure()
plot(time,disp2)

% Plot over specific time intervals
tl = 20; % Desired lower bound
tu = 30; % Desired upper bound
figure()
plot(time(tl*1000+1:tu*1000),disp1(tl*1000+1:tu*1000))
hold on 
plot(time(tl*1000+1:tu*1000),disp2(tl*1000+1:tu*1000))
hold off
legend('Force','Response')


% Finding index for 1 complete cycle in steady state region

F = freq; % Frequency [Hz]
T = 1/F; % Sampling Period [s]

% We assume that steady state has been reached after 20 sec.
indx_start = find(time>20);
indx_end = find(time>20+T);
ind_range = indx_start(1):indx_end(1);

% New time, force and response vectors for just 1 cycle
tt = time(ind_range);
d1 = disp1(ind_range);
d2 = disp2(ind_range);

% Plot individual cycles
figure()
plot(tt,d1)
hold on
plot(tt,d2,'r')
xlabel('Time (s)')
ylabel('Amplitude (mm)')
legend('Car 1','Car 2')

% Finding amplitude ratio

% Amplitudes of force, displacement
amp_d1 = (abs(max(d1))+abs(min(d1)))/2;
amp_d2 = (abs(max(d2))+abs(min(d2)))/2;

% Index corresponding to max amplitude
indx_amp_d1 = find(d1 ==max(d1));
indx_amp_d2 = find(d2 == max(d2));

% Time corresponding to max amplitude
t1 = tt(indx_amp_d1);
t2 = tt(indx_amp_d2);

% Plot these points
plot(t1,max(d1),'*')
plot(t2,max(d2),'*r')

% Calculate
amplitude_ratio = amp_d2/amp_d1;
phase_diff = (t1-t2)/T*2*pi;
end