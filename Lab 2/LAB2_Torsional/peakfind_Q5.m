function [t_value, xt_value] = peakfind_Q5(file_name,i)
[time, force, disp, velo] = readf(file_name);

%plot data
figure()
plot(time,velo)
xlabel('Time (s)')
ylabel('Velocity (rad/s)')
title('Initial Condition Experiment '+string(i))
%xlim([2 3])   %sets axis limits for viewing options xmin, xmax
grid on

%Finding the peak

[x,y] = ginput(2);

indx = find(time>x(1) & time<x(2));
t=time(indx);
y=velo(indx);

%plot the selected region
hold on
plot(time,velo)
xlabel('Time (s)')
ylabel('Velocity (rad/s)')
%xlim([2 3])
plot(t,y,'r')

[p1,ind]=max(y);
t_value = t(ind);
xt_value = y(ind);

plot(time,velo)
xlabel('Time (s)')
ylabel('Velocity (rad/s)')
%xlim([2 3])
plot(t,y,'r')
plot(t_value,p1,'k*')
end



