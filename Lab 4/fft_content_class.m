close all
clear all
clc

[t, force, disp1, disp2] = readf('t4_1_1.txt');

T=30; %sec
Fs = 1000; %Hz

y1=disp1; y2 = disp2;

%% Method 1 - All data

figure(1)
plot(t,y1)

% frequency vector
freq_vector = 0:1/T:(length(t)-1)/T;

figure(2)
plot(freq_vector,abs(fft(y1))/...
    (length(fft(y1))/2))
xlim([0 10])
xlabel('frequency')
ylabel('amplitude')
title('ALL DATA')

%% Method 2 - TAKE STEADY STATE

figure(1)
plot(t,y1)

% select a steady state region
[x z] = ginput(2);

indx = find(t>x(1) & t<x(2));

yy1=y1(indx);
tt=t(indx);

hold on
plot(tt,yy1,'r')

tt=tt-tt(1); % let my t starts from 0

% frequency vector
ff=0:1/tt(end):(length(tt)-1)/tt(end);

figure(3)
plot(ff,abs(fft(yy1))/(length(fft(yy1))/2),'r')
xlim([0 10])
xlabel('frequency')
ylabel('amplitude')
title('TAKE STEADY STATE DATA')

%% Method 3 - Take complete cycles

F=1.25; %frequency of signal
cycle_time = 1/F;

% find maximum number of complete cycles in the selected region
num_cycles = floor(tt(end)/cycle_time);

% finding indices which are part of complete cycles
indx2 = find(tt<num_cycles*cycle_time);

yyy1=yy1(indx2);
ttt=tt(indx2);

% frequency vector
fff = 0:1/ttt(end):(length(ttt)-1)/ttt(end);

z1 = max(abs(fft(yyy1))/(length(fft(yyy1))/2))
figure(4)
plot(fff,abs(fft(yyy1))/(length(fft(yyy1))/2),'k')
xlim([0 10])
xlabel('frequency')
ylabel('amplitude')
title('TAKE COMPLETE CYCLES')