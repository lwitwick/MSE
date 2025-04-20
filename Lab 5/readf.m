function [t,force,disp,c_eff]=readf(filename)

a=textread(filename,'','headerlines',22);
t=a(:,1);
force=a(:,2);
disp=a(:,3);
c_eff=a(:,6);