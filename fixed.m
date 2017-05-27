function fixed( x,y,sca)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
line([x-sca x+sca],[y y],'color','r');
line([x-sca x-3*sca/2],[y y-sca/2],'color','r');
line([x x-sca/2],[y y-sca/2],'color','r');
line([x+sca x+sca/2],[y y-sca/2],'color','r');
end

