clear all 
close all

x1 = 1;     %set the first degree-of-freedom amplitude (generally normalized to 1)
x2 = -2;    %second degree-of-freedom amplitude

%Plot the dash line to show the zero datum
plot ([0 2.5],[0 0],'--k');
hold on
%plot the amplitudes as circles (x values [1 2] are arbitrary and can be anything
plot ([1 2],[x1 x2],'o','LineWidth',2);

% connect the circles with a line by basically plotting the same 
plot ([1 2],[x1 x2],'r','LineWidth',2);     
                                    
set(gca,'xlim',[0.5 2.5])           % set the x limits accordingly so all of the points are seen
set(gca,'ylim',[min(min([x1 x2])-0.5,-0.5) max(max([x1 x2])+0.5,0.5)])
%same for y limits.