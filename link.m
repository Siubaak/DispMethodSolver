function link(x,y,sca,n)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if n == 1
    hold on;
    plot(x,y,'ro');
    line([x x],[y-sca/3 y-sca],'color','r');
    hold on;
    plot(x,y-4*sca/3,'ro');
    y = y - 5*sca/3;
    line([x-sca x+sca],[y y],'color','r');
    line([x-sca x-3*sca/2],[y y-sca/2],'color','r');
    line([x x-sca/2],[y y-sca/2],'color','r');
    line([x+sca x+sca/2],[y y-sca/2],'color','r');
else
    hold on;
    plot(x,y,'ro');
    line([x-sca/3 x-sca],[y y],'color','r');
    hold on;
    plot(x-4*sca/3,y,'ro');
    x = x - 5*sca/3;
    line([x x],[y-sca y+sca],'color','r');
    line([x x-sca/2],[y-sca y-3*sca/2],'color','r');
    line([x x-sca/2],[y y-sca/2],'color','r');
    line([x x-sca/2],[y+sca y+sca/2],'color','r');
end
end

