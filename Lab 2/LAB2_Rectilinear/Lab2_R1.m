clear all
close all
clc

% ----------------------------------------------------

% 24-452 MSE Spring 2025 Group B3 
% LAB 2 - Rectilinear - Experiment 1
fprintf('\n24-452 MSE Lab 2\n');

% make current folder
 cd('C:\Users\kgbar\Documents\MSE\MSE\Lab 2\LAB2_Rectilinear')
 
 m = [2.487 2.487 2.487 1.262];
 c = [20 40 60 40];
 F0 = 2;

 c_exp = [0 0 0 0];
%% ----------------------------------------------------
step_files = ["t2_1_1.txt" "t2_1_2.txt" "t2_1_3.txt" "t2_1_4.txt"];
for i = 1:4;
    tau = calc_time_const(step_files(i),i);
    c_exp(i) = m(i)./tau;
    tau_theoretical = m(i)./c(i);
    fprintf("Time Constant Test %d: %f\n",i,tau)
    fprintf("Damping Coefficient Test %d: %f\n",i,c_exp)
    fprintf("Theoretical Time Constant Test %d: %f\n",i,tau_theoretical)
end

%%
impulse_files = ["t2_2_1.txt" "t2_2_2.txt" "t2_2_3.txt" "t2_2_4.txt"];

for i = 1:4;
    hold on
    [time_constant,time,t_value,peak] = find_tau_impulse(impulse_files(i),i);
    F0 = peak.*time_constant.*c_exp(i);
 
    v_analytical = (F0./(c_exp(i).*time_constant)).*exp(-time./time_constant);
    plot(time+t_value,v_analytical)
    legend("Experimental Data","Peak","","Time Constant","Analytical Response")
    fprintf("F0 Test %d: %f\n",i,F0)
    hold off
end