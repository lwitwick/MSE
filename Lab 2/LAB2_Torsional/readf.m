function [time, force, disp, velo] = readf(file_name)
 aa=textread(file_name,'','headerlines',22);
 time = aa(:,1);
 force = aa(:,2);
 disp = aa(:,4);
 velo = aa(:,7);
end