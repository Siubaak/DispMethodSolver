function slide(x,y,sca,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if n == 0
    line([x-sca x+sca],[y y],'color','r');
    hold on;
    plot(x-sca/2,y-sca/3,'ro');
    hold on;
    plot(x+sca/2,y-sca/3,'ro');
    line([x-sca/2 x-sca/2],[y-2*sca/3 y-sca],'color','r');
    line([x+sca/2 x+sca/2],[y-2*sca/3 y-sca],'color','r');
    hold on;
    plot(x-sca/2,y-4*sca/3,'ro');
    hold on;
    plot(x+sca/2,y-4*sca/3,'ro');
    y = y - 5*sca/3;
    line([x-sca x+sca],[y y],'color','r');
    line([x-sca x-3*sca/2],[y y-sca/2],'color','r');
    line([x x-sca/2],[y y-sca/2],'color','r');
    line([x+sca x+sca/2],[y y-sca/2],'color','r');
else
    line([x x],[y-sca y+sca],'color','r');
    hold on;
    plot(x-sca/3,y-sca/2,'ro');
    hold on;
    plot(x-sca/3,y+sca/2,'ro');
    line([x-2*sca/3 x-sca],[y-sca/2 y-sca/2],'color','r');
    line([x-2*sca/3 x-sca],[y+sca/2 y+sca/2],'color','r');
    hold on;
    plot(x-4*sca/3,y-sca/2,'ro');
    hold on;
    plot(x-4*sca/3,y+sca/2,'ro');
    x = x - 5*sca/3;
    line([x x],[y-sca y+sca],'color','r');
    line([x x-sca/2],[y-sca y-3*sca/2],'color','r');
    line([x x-sca/2],[y y-sca/2],'color','r');
    line([x x-sca/2],[y+sca y+sca/2],'color','r');
end
end

