function [time,force,resp]=readf2(filename)

a=textread(filename,'','headerlines',22);
time=a(:,1);
force=a(:,2);
resp=a(:,3);

end