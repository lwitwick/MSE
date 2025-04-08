function [t,force,disp1,disp2]=readf(filename)

a=textread(filename,'','headerlines',22);
t=a(:,1);
force=a(:,2);
disp1=a(:,3);
disp2=a(:,4);