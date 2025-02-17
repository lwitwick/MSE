function [t_value = peakfind_damped(time,disp)
%plot data
figure(1)
plot(time,disp)
xlabel('Time (s)')
ylabel('Amplitude (rad)')
xlim([1.5 3])   %sets axis limits for viewing options xmin, xmax
grid on

%Finding the peak

[x,y] = ginput(2);

indx = find(time>x(1) & time<x(2));
t=time(indx);
y=disp(indx);

%plot the selected region
figure(2)
plot(time,disp)
xlabel('Time (s)')
ylabel('Amplitude (rad)')
xlim([1.5 3])
hold on
plot(t,y,'r')


[p1,ind]=min(y);
t_value = t(ind);

figure(3)
plot(time,disp)
xlabel('Time (s)')
ylabel('Amplitude (rad)')
xlim([1.5 3])
hold on
plot(t,y,'r')
plot(t_value,p1,'k*')

end



