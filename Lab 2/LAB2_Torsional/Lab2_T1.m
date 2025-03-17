clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 2 - Torsional - Experiment 1
fprintf('\n24-452 MSE Lab 2\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 2\LAB2_Torsional')
 
 I_disk = 0.002348;
 m = [2.0045 2.0045 2.0045 1.004];
 r = 0.09;
 I_total = I_disk+(m.*r^2);
 
 b = [0.1 0.2 0.3 0.2];
 T0 = 0.25;
 
 b_exp = [0 0 0 0];
%% Question 2
step_files = ["t2_1_1.txt" "t2_1_2.txt" "t2_1_3.txt" "t2_1_4.txt"];
for i = 1:4;
    tau = calc_time_const(step_files(i),i);
    b_exp(i) = I_total(i)./tau;
    tau_theoretical = I_total(i)./b(i);
    fprintf("Time Constant Test %d: %f\n",i,tau)
    fprintf("Damping Coefficient Test %d: %f\n",i,b_exp(i))
    %fprintf("Theoretical Time Constant Test %d: %f\n",i,tau_theoretical)
end

%% Question 3
impulse_files = ["t2_2_1.txt" "t2_2_2.txt" "t2_2_3.txt" "t2_2_4.txt"];

for i = 1:4;
    hold on
    [time_constant,time,t_value,peak] = find_tau_impulse(impulse_files(i),i);
    T0 = peak.*time_constant.*b_exp(i);
    
    v_analytical = (T0./(b_exp(i).*time_constant)).*exp(-time./time_constant);
    plot(time+t_value,v_analytical)
    legend("Experimental Data","Peak","","Time Constant","Analytical Response")
    fprintf("F0 Test %d: %f\n",i,T0)
    hold off
end