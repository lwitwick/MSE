%experiment data
data = textread('t3_2_1.txt','','headerlines',22);
dataLength = 5000;
tStart = 1000; % lines of offset from movement before drop
disp2 = data(tStart:dataLength,3)';
vel2 = data(tStart:dataLength,8)';
time2 = data(tStart:dataLength,1)' - tStart/1000; %end shifts the data back to 0
% System Parameters
m = 492/1000; %numerator in grams
c = 2.445;
k = 369.354;
T0 = 1;
omega_n = sqrt(k/m);
zeta = c / (2 * sqrt(m * k));

initConds = [0; 0];
tspan = 0:.001:10-tStart/1000;

f = @(t) T0 * (t >= 0);

% ODE function
ode_func = @(t, x) [x(2);
                    (f(t) - c * x(2) - k * x(1)) / m];

% Solve using ode45
[t, x] = ode45(ode_func, tspan, initConds);

% Plot the response
figure;
subplot(2,1,1);
hold on
plot(t, x(:,1));
plot(time2,disp2);
xlabel('Time (s)');
ylabel('Displacement (mm)');
title('Displacement Response of Second-Order System');
grid on;
