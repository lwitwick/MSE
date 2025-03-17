global time force m c k I

i = 1;
figure
masses = [0 0 0 1004 1004 1004 2004.5 2004.5 2004.5];
simsprconst = [1.5 1.5 3 1.5 1.5 3 1.5 1.5 2.5];
simdampconst = [.25 .05 .05 .3 .05 .1 .4 .05 .1];

while i < 10
    string = strcat('t3_2_',num2str(i),'.txt');
    data = textread(string,'','headerlines',22);
    dataLength = size(data,1);
    tStart = 100;
    disp = data(tStart:dataLength,3)';
    vel = data(tStart:dataLength,8)';
    time = data(tStart:dataLength,1)' - tStart/1000;
    force = data(tStart:dataLength,2);
    if masses(i) == 0
        I = (masses(i)/1000*.09^2 + .002348);
        c = simdampconst(i) + .0019;
        k = simsprconst(i) + 1.672;
    elseif masses(i) == 1004
        I = (masses(i)/1000*.09^2 + .002348);
        c = simdampconst(i) + .0049;
        k = simsprconst(i) + 1.575;
    else
        I = (masses(i)/1000*.09^2 + .002348);
        c = simdampconst(i) + .0075;
        k = simsprconst(i) + 1.539;    
    end

    y0 = [0 0];

    [T, Y] = ode45(@secondorder, time, y0);

    subplot(9,1,i)
    hold on
    if i == 1
        Q1sim = sim('L2_2Q6_simulink.slx');  % Ensure your Simulink model is for a torsional system
        plot(Q1sim.displacement.Time, Q1sim.displacement.Data*180/pi, 'Color','#EDB120', 'LineWidth', 1.5);  % Convert radians to degrees for easier interpretation
    end
    
    % MATLAB simulation result (convert radians to degrees for comparison)
    plot(T, Y(:,1) * 180/pi, '--', 'Color','#A2142F', 'LineWidth', 1.5);  % MATLAB displacement in degrees
    plot(time, disp * 180/pi, '-.', 'Color','#0072BD', 'LineWidth', 1.5);   % Experimental displacement in degrees

    xlabel('Time [s]');
    ylabel('Displacement [deg]','Rotation',0);
    title(strcat("Test ", num2str(i)));

    if i == 1
        legend('Simulink Displacement', 'Matlab Displacement', 'Experimental Displacement', 'Location', 'eastoutside');
    else
        legend('Simulated Displacement', 'Experimental Displacement', 'Location', 'eastoutside');
    end
    
    xlim([0 2]);
    ylim([0 20]);  % Adjust the y-limit as per your data
    grid on;
    i = i + 1;
end

% Experimental data function
function f = u(t)
    global time force
    f = interp1(time, force, t);  % Interpolates the torque at time 't'
end

% Modified second-order ODE for a torsional system
function dq = secondorder(t, q)
    global I c k

    A = [0 1; -k/I -c/I];  % Coefficients for the torsional system (inertia, damping, spring constant)
    B = [0; 1/I];           % Input matrix for the torque (forcing function)

    dq = A * q + B * u(t);  % Derivative of the state vector (angular displacement, angular velocity)
end