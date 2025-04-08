function [freq,amp1,pha1,amp2,pha2] = readfreq(filename,minfreq,maxfreq)

% Reads the experimental data to variable a
a = textread(filename,'','headerlines',22); 

% Assigns frequency, magnitude and phase information from the xp data
freq = a(minfreq*40+1:maxfreq*40+1,1);
amp1 = a(minfreq*40+1:maxfreq*40+1,2);
pha1 = a(minfreq*40+1:maxfreq*40+1,5);
amp2 = a(minfreq*40+1:maxfreq*40+1,3);
pha2 = a(minfreq*40+1:maxfreq*40+1,6);
end
