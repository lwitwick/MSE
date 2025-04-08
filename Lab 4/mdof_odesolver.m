clear all
close all
clc

% Defining of global variables which would be used in other function calls
global m1 c1 k1 m2 c2 k2 k3 freq ampl

%% Definition of Parameters (All values are in SI Units)
m1 = 1.0;           % Mass#1 or Inertia #1
m2 = 1.0;           % Mass#2 or Inertia #2 
c1 = 2.0;           % Damping Coefficient #1
c2 = 2.0;           % Damping Coefficient #2
k1 = 400;           % Spring Constant #1
k2 = 200;           % Spring Constant #2
k3 = 400;           % Spring Constant #3

freq = 5;   %in Hz. Excitation frequency of the single sine forcing (this value is used in the function "forcing_mdof")
ampl = 1;   %in SI units. Excitation Amplitude of the single sine forcing (this value is used in the function "forcing_mdof")

% Initial conditions
tspan = [0 10]; 		% time span [s]
y0 = [0 0 0 0]; 		% initial values [mm mm/s mm mm/s]

%% Solve for the system response
[t,y]=ode45(@mdof_secondorder,tspan,y0); %function call to inbuilt ode45 function syntax

% t = vector of time values at which ode45 calculates the response
% y = response matrix of the states 
% In the 2-DOF system we are considering, there are four states. The number of rows is the same as the number of rows 
% in the time vector. The number of columns is 4.

%% Plot the responses
figure(1)
subplot(2,1,1)
plot(t,y(:,1))  % plot the displacement response of DOF#1
xlabel('Time(sec)')
ylabel('DOF#1 (X1) Response')
grid on

subplot(2,1,2)
plot(t,y(:,3)) % plot the displacement response of DOF#2
xlabel('Time(sec)')
ylabel('DOF#2 (X2) Response')
grid on
