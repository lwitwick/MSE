function [m,c,k] = frf_fitting(file_name,i);
% close all
% clc
% clear all

% Read file
[freq,amp,pha]=readfreq(file_name,1,10);


% Plotting amplitude
figure()
plot(amp,'r')
ylabel('Amplitude (mm)')
title(string(i))

% Select region to fit FRF
xx = ginput(2);
indx = ceil(xx(1,1)):floor(xx(2,1)); % Round input values to nearst integer
 
amp=amp/1000; %Convert FRF into SI units
% Creating the complex FRF (transfer function)
% Please check your units and divide accrodingly
Gs = amp(indx).*exp(1i*pha(indx));

% Using rational fraction form to get the parameters

% Express the FRF in rational fraction polynomial form
[num,den] = invfreqs(Gs,freq(indx)*2*pi,0,2);
 
% Creates regenerated FRF function
hh = freqs(num,den,freq*2*pi);
 
% Find magnitude and phase of regenerated FRF function
mag = abs(hh);
ang = angle(hh);

% Plotting experimental and fitted data

figure()
title("Frequency Response Functions Setup "+string(i))
subplot(2,1,1)
plot(freq,amp,'r')
hold on
plot(freq,mag)
xlabel('Frequency (Hz)')
ylabel('Amplitude (mm/N)')

subplot(2,1,2)
plot(freq,pha,'r')
hold on
plot(freq,ang)
xlabel('Frequency (Hz)')
ylabel('Phase (rad)')

hold off

% Find Parameters [m, c, k]

param = den/num;
m=param(1);
c=param(2);
k=param(3);
end