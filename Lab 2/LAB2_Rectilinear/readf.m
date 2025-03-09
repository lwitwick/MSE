function [time, force, disp, velo] = readf(file_name)
 aa=textread(file_name,'','headerlines',22);
 time = aa(:,1);
 force = aa(:,2);
 disp = aa(:,4)*0.01;
 velo = aa(:,7)*0.01;
end