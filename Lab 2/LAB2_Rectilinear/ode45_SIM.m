global time force m c k

i = 1;
figure
masses = [492 492 1717 1717 0 0 1717 1717];
simsprconst = [300 300 300 500 100 800 100 300];
simdampconst = [1 5 5 5 30 30 30 80];
while i < 9
    string = strcat('t3_2_',num2str(i),'.txt');
    data = textread(string,'','headerlines',22);
    dataLength = 5000;
    tStart = 1001; % lines of offset from movement before drop
    disp = data(tStart:dataLength,3)';
    vel = data(tStart:dataLength,8)';
    time = data(tStart:dataLength,1)' - tStart/1000; %end shifts the data back to 0
    force = data(tStart:dataLength,2);

    m = (masses(i) + 770)/1000; %numerator in grams
    c = simdampconst(i);
    k = simsprconst(i) + 398;

    y0 = [0 0];

    [T,Y] = ode45(@secondorder,time,y0);

    subplot(8,1,i)
    hold on
    if i == 1
        Q1sim = sim('L2Q6_simulink.slx');        
        plot(Q1sim.displacement.Time, Q1sim.displacement.Data*1000,'Color','#EDB120','LineWidth',1.5)
    end
    plot(T, Y(:,1) * 1000,'--','Color','#A2142F','LineWidth',1.5);
    plot(time, disp,'-.','Color','#0072BD','LineWidth',1.5);
    xlabel('Time [s]');
    ylabel('Displacement [mm]');
    title(strcat("Test ", num2str(i)))
    if i == 1
        legend('Simulink Displacement','Matlab Displacement', 'Experimental Displacement', 'Location', 'eastoutside');
    else
        legend('Simulated Displacement', 'Experimental Displacement', 'Location', 'eastoutside');
    end
    xlim([0 4])
    ylim([0 13])
    grid on;
    i = i + 1;
end


%experiment data


function f = u(t)
    global time force
    f = interp1(time,force,t);
end

function dq = secondorder(t,q)
    global m c k

    A = [0 1; -k/m -c/m];
    B = [0; 1/m];

    dq = A*q+B*u(t);
end
