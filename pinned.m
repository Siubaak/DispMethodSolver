function pinned( x,y,sca )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
hold on;
plot(x,y,'ro');
y = y-sca/3;
line([x-sca x+sca],[y y],'color','r');
line([x-sca x-3*sca/2],[y y-sca/2],'color','r');
line([x x-sca/2],[y y-sca/2],'color','r');
line([x+sca x+sca/2],[y y-sca/2],'color','r');
end

