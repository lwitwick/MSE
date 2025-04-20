clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 5 - Experiment 1
fprintf('\n24-452 MSE Lab Question 8\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 5')
 
 file_names = ["t3_1_2.txt","t3_1_6.txt","t3_1_9.txt","t3_1_10.txt"];
Kp1 = [2,2,2,2];
Ki1 = [0, 8, 22, 8];
Kd1 = [0, 0, 0.05, 0.1];
tests = ["2","6","9","10"];

[t,force,disp,c_eff]=readf(file_names(1));
plot(t,c_eff)
 %% Question 8

 for i = 1:4
 [t,force,disp,ceff]=readf(file_names(i));
 %[x2Time,x2Data,c_eff2Time,c_eff2Data] = call_sim(Kp(i),Ki(i),Kd(i),10);
 % System parameters
 m = 1.1;   % mass [kg] 
 k = 469;    % stiffness [N/m]
 c = 2.76;      % damping coefficient [Ns/m]

 w_n=sqrt(k/m);
 eta=c/(2*m*w_n);
 
 % Initial conditions
 x0 = 0;     % initial displacement   
 v0 = 0;     % initial velocity 
 
 % Controller parameters
 Kp = Kp1(i);     % proportional gain
 Ki = Ki1(i);     % integral gain
 Kd = Kd1(i);     % derivative gain


 Tsim = 10; % Simulation Time
 sim ('sim_control_old_version'); % call the simulation

 x2Time = x1.Time;
 x2Data = x1.Data;
 c_eff2Time = c_eff1.Time;
 c_eff2Data = c_eff1.Data;

 figure()
 hold on
 plot(t,disp)
 xlim([0 10])
 plot(x2Time,x2Data)
 title("Simulated vs Experimental Response Test "+tests(i))
 ylabel('Displacement [mm]')
 xlabel('Time (s)')
 legend("Experimental Data","Simulated Response")
 hold off

 figure()
 hold on
 plot(t,ceff)
 plot(c_eff2Time,c_eff2Data)
 title("Simulated vs Experimental Control Effort Test "+tests(i))
 xlabel('Time(s)')
 ylabel('Control Effort (N)')
 legend("Experimental Data","Simulated Response")
 hold off
 end