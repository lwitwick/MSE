close all
clc
clear all

% set system parameters
m1 = 1.0;           % Mass#1 or Inertia #1
m2 = 1.0;           % Mass#2 or Inertia #2 
c1 = 2.0;           % Damping Coefficient #1
c2 = 2.0;           % Damping Coefficient #2
k1 = 400;           % Spring Constant #1
k2 = 200;           % Spring Constant #2
k3 = 400;           % Spring Constant #3

% initial conditions
x10=0;
v10=0;
x20=0;
v20=0;

Tsim=10;            % simulation time, default simulation time is 10 [s] if you don't change it manually
F=1;                % Force amplitude
freq=5;             % frequency of forcing function
sim_freq=0.001;

sim('two_dof_sim') % call the simulation

% the output variable "output_output" is a timeseries class (similar to the
% struct class). If you open the variable by double clicking it, you will
% find 4 columns of data and corresponding time stamp. Extract the data
% that you require for your calculations. 

figure(1)
subplot(2,1,1)
hold on
plot(output_output.Time,output_output.Data(:,1))
xlabel('Time(sec)')
ylabel('DOF#1 (X1) Response')
grid on

subplot(2,1,2)
hold on
plot(output_output.Time,output_output.Data(:,3),'r')
xlabel('Time(sec)')
ylabel('DOF#2 (X2) Response')
grid on