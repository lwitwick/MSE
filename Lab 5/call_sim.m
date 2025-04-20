function [x2Time,x2Data,c_eff2Time,c_eff2Data] = call_sim(Kp,Ki,Kd,Tsim)

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
Kp = Kp;     % proportional gain
Ki = Ki;     % integral gain
Kd = Kd;     % derivative gain


Tsim = Tsim; % Simulation Time
sim ('sim_control_old_version'); % call the simulation

% Plot results
figure(1)
subplot(6,1,1)
plot(x.Time,x.Data);
ylabel('Displacement [mm]')
xlabel('Time (s)')
subplot(6,1,2)
plot(x1.Time,x1.Data);
ylabel('Displacement [mm]')
xlabel('Time (s)')
subplot(6,1,3)
plot(x2.Time,x2.Data);
ylabel('Displacement [mm]')
xlabel('Time (s)')
subplot(6,1,4)
plot(c_eff.Time,c_eff.Data);
xlabel('Time(s)')
ylabel('Control Effort (N)')
subplot(6,1,5)
plot(c_eff1.Time,c_eff1.Data);
xlabel('Time(s)')
ylabel('Control Effort (N)')
subplot(6,1,6)
plot(c_eff2.Time,c_eff2.Data);
xlabel('Time(s)')
ylabel('Control Effort (N)')


x2Time = x2.Time;
x2Data = x2.Data;
c_eff2Time = c_eff2.Time;
c_eff2Data = c_eff2.Data;
