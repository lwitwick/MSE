function draw_mode_shape(Z1,Z2,i)

x1 = 1;     %set the first degree-of-freedom amplitude (generally normalized to 1)
x2 = Z2/Z1;    %second degree-of-freedom amplitude

if i/2 == 2
    x2 = -x2;
end

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

if i/2 == 1
    natural_freq = "First";
elseif i/2 == 2
    natural_freq = "Second";
end

xlabel("DOF (cart)")
ylabel("Relative Amplitude")
title(natural_freq+ " Natural Frequency Mode Shape")

end