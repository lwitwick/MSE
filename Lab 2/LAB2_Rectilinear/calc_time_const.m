function time_constant = calc_time_const(file_name)
[time, force, disp, velo] = readf(file_name);

% plot figure
figure()
plot(time,velo)
xlim([0.1 time(end)]) % delay of 0.1 seconds during experiments
xlabel('Time (s)')
ylabel('Amplitude')
title('Find time constant from step response')
 
[x, y]=ginput(2);
indx=find(time>x(1) & time<x(2));

% plot on existing figure
hold on
plot(time(indx), velo(indx),'color','r','Linewidth',4)

% final value
amp = mean(velo(indx));
% value at 1 time constant
target_value = 0.632*amp;
% find index greater than target_value
t_indx = find(velo>target_value);

plot(time(t_indx),velo(t_indx),'color','k','Linewidth',2)
 
% 1-D interpolation
time_constant = interp1([velo(t_indx(1)-1) velo(t_indx(1))],[time(t_indx(1)-1)
time(t_indx(1))],target_value);

% plotting the value at time constant
plot(time_constant,target_value,'*','Linewidth',10)
time_constant = time_constant - 0.1;
end