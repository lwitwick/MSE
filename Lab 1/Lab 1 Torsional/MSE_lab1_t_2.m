clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 1 - Torsional - Experiment 2
fprintf('\n24-452 MSE Lab 1\n');

% ----------------------------------------------------
% Measured Values
r = 0.09;
m = 0.503;

% Data Import
data1 = textread('t2_1_1.txt','','headerlines',22);
time1 = data1(:,1);
disp1 = data1(:,3);
figure(1)
plot(time1, disp1)

data2 = textread('t2_1_2.txt','','headerlines',22);
time2 = data2(:,1);
disp2 = data2(:,3);
figure(2)
plot(time2,disp2)

data3 = textread('t2_1_3.txt','','headerlines',22);
time3 = data3(:,1);
disp3 = data3(:,3);
figure(3)
plot(time3,disp3)

data4 = textread('t2_2_1.txt','','headerlines',22);
time4 = data4(:,1);
disp4 = data4(:,4);

data5 = textread('t2_2_2.txt','','headerlines',22);
time5 = data5(:,1);
disp5 = data5(:,4);

data6 = textread('t2_3_1.txt','','headerlines',22);
time6 = data6(:,1);
disp6 = data6(:,5);

data7 = textread('t2_3_2.txt','','headerlines',22);
time7 = data7(:,1);
disp7 = data7(:,5);
%% Question 2
[wn_ratio2,wn1,wn2,dampingRatio1,dampingRatio2] = getNaturalFreqRatio(time1,disp1,time2,disp2);

I_disk = (m*r^2)/(wn_ratio2-1);

k = wn1^2 * I_disk;
c1 = dampingRatio1 * 2 * sqrt(k*I_disk);
c2 = dampingRatio2 * 2 * sqrt(k*(I_disk+(m*0.09^2)));

fprintf("Disk Moment of Inertia: %4f\n",I_disk)
fprintf("Spring Rate: %d\n",k)
fprintf("Damping Coefficient Test 1: %2f\nDamping Coefficient Test 2: %2f \n", c1, c2)
fprintf("Damping Ratio Test 1: %4f\nDamping Ratio Test 2: %4f\n",dampingRatio1, dampingRatio2)

figure()
hold on
subplot(2,1,1)
plot(time1,disp1)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 1')
subplot(2,1,2)
plot(time2,disp2)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 2')
hold off
%% Question 3 (need to run Q2 for some values)
[wn_ratio3,wn2,wn3,dampingRatio2,dampingRatio3] = getNaturalFreqRatio(time2,disp2,time3,disp3);

I_2 = I_disk + m*r^2;
mass_block = I_2*(wn_ratio3-1)/r^2;

fprintf('Disk Mass %2f\n',mass_block)

figure()
hold on
subplot(2,1,1)
plot(time2,disp2)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 2')
subplot(2,1,2)
plot(time3,disp3)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 3')
hold off
%% Question 5
[wn_ratio5,wn4,wn5,dampingRatio4,dampingRatio5] = getNaturalFreqRatio(time4,disp4,time5,disp5);

I_disk2 = (m*r^2)/(wn_ratio5-1);

k_5 = wn4^2 * I_disk2;
c4 = dampingRatio4 * 2 * sqrt(k_5*I_disk2);
c5 = dampingRatio5 * 2 * sqrt(k_5*(I_disk2+(m*r^2)));

fprintf("Disk Moment of Inertia: %4f\n",I_disk2)
fprintf("Spring Rate: %d\n",k_5)
fprintf("Damping Coefficient Test 4: %2f\nDamping Coefficient Test 5: %2f \n", c4, c5)
fprintf("Damping Ratio Test 4: %4f\nDamping Ratio Test 5: %4f\n",dampingRatio4, dampingRatio5)

figure()
hold on
subplot(2,1,1)
plot(time4,disp4)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 4')
subplot(2,1,2)
plot(time5,disp5)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 5')
hold off
%% Question 6
[wn_ratio6,wn6,wn7,dampingRatio6,dampingRatio7] = getNaturalFreqRatio(time6,disp6,time7,disp7);

I_disk3 = (m*r^2)/(wn_ratio6-1);

k_6 = wn6^2 * I_disk3;
c6 = dampingRatio6 * 2 * sqrt(k_6*I_disk3);
c7 = dampingRatio7 * 2 * sqrt(k_6*(I_disk3+(m*r^2)));

fprintf("Disk 3 Moment of Inertia: %4f\n",I_disk3)
fprintf("Spring Rate: %d\n",k_6)
fprintf("Damping Coefficient Test 6: %2f\nDamping Coefficient Test 7: %2f \n", c6, c7)
fprintf("Damping Ratio Test 6: %4f\nDamping Ratio Test 7: %4f\n",dampingRatio6, dampingRatio7)

figure()
hold on
subplot(2,1,1)
plot(time6,disp6)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 6')
subplot(2,1,2)
plot(time7,disp7)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Torsional Test 7')
hold off
