clc
clear all
%%
% Save the serial port name in comPort variable.

comPort = '/dev/tty.usbmodem411';
%% 
% It creates a serial element calling the function "stupSerial"

if(~exist('serialFlag','var'))
    [arduino,serialFlag] = setupSerial(comPort);
end

%%
% Time to create our plot window in order to visualize data collectoed 
% from serial port readings

if (~exist('h','var') || ~ishandle(h))
    h = figure(1);
    set(h,'UserData',1);
end

if (~exist('button','var'))
    button = uicontrol('Style','togglebutton','String','Stop',...
        'Position',[0 0 50 25], 'parent',h);
end


%%
% After creating a system of two axis, a line object through which the data
% will be plotted is also created

if(~exist('myAxes','var'))
    
    buf_len = 50;
    index = 1:buf_len; 
    zeroIndex = zeros(size(index)); 
    tcdata = zeroIndex;
    limits = [15 50];
    
    myAxes = axes('Xlim',[0 buf_len],'Ylim',limits);
    grid on;
    
    l = line(index,[tcdata;zeroIndex]);
    
    drawnow;
end
%%

mode = 'R';

while (get(button,'Value') == 0 )
    
    tc = readTemp(arduino,mode);
    
    tcdata = [tcdata(2:end),tc];
    
    set(l,'Ydata',tcdata);
    
    drawnow;
    
    pause(1);
end

% To remeber: when you are satisfied with you measurement click on the 
% "stop" button in the bottom left corner of the figure. Now you have to
% close the serial object "Arduino" using the command "fclose(arduino)",
% and close the h figure typing "close(h)". Now in "tcdata" variable you
% have your real time data. 
