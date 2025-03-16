function [peak, time] = peakfinder(file_name);
[time, force, disp, velo] = readf(file_name);

% plot figure
figure()
hold on
plot(time,velo)
xlim([0.1 time(end)]) % delay of 0.1 seconds during experiments
xlabel('Time (s)')
ylabel('Amplitude')
title('Find F0 from impulse response')

%Finding the peak
[x,y] = ginput(2);
indx = find(time>x(1) & time<x(2));
t=time(indx);
y=velo(indx);
[p1,ind]=max(y);
t_value = t(ind);
peak = y(ind);
plot(t_value,p1,'k*')
hold off
end