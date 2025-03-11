clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 2 - Rectilinear - Experiment 1
fprintf('\n24-452 MSE Lab 2\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 2\LAB2_Rectilinear')
 
 m = [2.487 2.487 2.487 1.262];
 c = [20 40 60 40];
 F0 = 2;
%% ----------------------------------------------------
step_files = ["t2_1_1.txt" "t2_1_2.txt" "t2_1_3.txt" "t2_1_4.txt"];
for i = 1:4;
    tau = calc_time_const(step_files(i));
    c_exp = m(i)./tau(i);
    tau_theoretical = m(i)./c(i);
    fprintf("Time Constant Test %d: %f\n",i,tau)
    fprintf("Damping Coefficient Test %d: %f\n",i,c_exp)
    fprintf("Theoretical Time Constant Test %d: %f\n",i,tau_theoretical)
end

%%
impulse_files = ["t2_2_1.txt" "t2_2_2.txt" "t2_2_3.txt" "t2_2_4.txt"];

for i = 1:4;
    peak = peakfinder(impulse_files(i));
    F0 = peak./m(1);
    fprintf("F0 Test %d: %f\n",i,F0)
end
%%
[time, force, disp, velo] = readf("t2_2_2.txt");

% plot figure
figure()
plot(time,velo)
xlim([0.1 time(end)]) % delay of 0.1 seconds during experiments
xlabel('Time (s)')
ylabel('Amplitude')
title('Find time constant from step response')
 
[x, y]=ginput(2);
indx=find(time>x(1) & time<x(2));
t=time(indx);
y=velo(indx);
[p1,ind]=max(y);
t_value = t(ind);

% plot in existing figure
hold on
plot(t_value,p1,'k*')

% final value
amp = y(ind)
% value at 1 time constant
target_value = (1-0.632)*amp
% find index greater than target_value
t_indx = find(velo>target_value,4,"last")

plot(time(t_indx),velo(t_indx),'color','k','Linewidth',2)
 
% 1-D interpolation
time_constant = interp1([velo(t_indx(1)-1) velo(t_indx(1))],[time(t_indx(1)-1)
time(t_indx(1))],target_value)

% plotting the value at time constant
plot(time_constant,target_value,'*','Linewidth',10)
time_constant = time_constant - 0.1;