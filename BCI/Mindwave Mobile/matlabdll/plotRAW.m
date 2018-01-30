function plotRAW(data)
%this subfunction is used to plot EEG data

plot(data)
axis([0 255 -2000 2000])
drawnow;
