function [time_constant,time,t_value,peak] = find_tau_impulse(file_name,i)
[time, force, disp, velo] = readf(file_name);

% plot figure
figure()
plot(time,velo)
xlim([0.1 time(end)]) % delay of 0.1 seconds during experiments
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Find time constant from impulse response '+string(i))
 
[x, y]=ginput(2);
indx=find(time>x(1) & time<x(2));
t=time(indx);
y=velo(indx);
[p1,ind]=max(y);
t_value = t(ind);

% plot in existing figure
hold on
plot(t_value,p1,'k*')

% peak value
peak = y(ind);
peak_index = find(velo == peak, 1, 'first');

% Find the minimum value
[x0, y0]=ginput(2);
indx_base=find(time>x0(1) & time<x0(2));
% base value
min = mean(velo(indx_base));
height = peak-min;

% value at 1 time constant
target_value = ((1-0.632)*(height))+min;
% find index greater than target_value
t_indx = find(velo(peak_index:end) <= target_value, 1, 'first')+ peak_index;
time_constant = time(t_indx);

plot(time(t_indx),velo(t_indx),'color','k','Linewidth',2)
 
% 1-D interpolation
%time_constant = interp1([velo(t_indx(1)-1) velo(t_indx(1))],[time(t_indx(1)-1)
%time(t_indx(1))],target_value)

% plotting the value at time constant
plot(time_constant,target_value,'*','Linewidth',10)
time_constant = time_constant - t_value;
end