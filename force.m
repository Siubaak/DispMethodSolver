function force(x,y,f,n,sca,c)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if f > 0
    if n == 2
        line([x x],[y y-3*sca],'color',c);
        line([x x+sca/2],[y y-sca],'color',c);
        line([x x-sca/2],[y y-sca],'color',c);
        text(x-sca/2,y-7*sca/2,num2str(abs(f)),'color',c);
    elseif n == 1
        line([x x-3*sca],[y y],'color',c);
        line([x x-sca],[y y+sca/2],'color',c);
        line([x x-sca],[y y-sca/2],'color',c);
        text(x-4*sca,y+sca/1.5,num2str(abs(f)),'color',c);
    else
        line([x x-1.4*sca],[y y+1.4*sca],'color',c);
        line([x-2*sca x-1.4*sca],[y y+1.4*sca],'color',c);
        line([x-2*sca x-1.7*sca],[y y-1.4*sca],'color',c);
        line([x-sca x-1.7*sca],[y-2*sca y-1.4*sca],'color',c);
        line([x-sca x],[y-2*sca y-2*sca],'color',c);
        line([x x-sca],[y-2*sca y-3*sca/2],'color',c);
        line([x x-sca],[y-2*sca y-5*sca/2],'color',c);
        text(x+sca/2,y-2*sca,num2str(abs(f)),'color',c);
    end
end
if f < 0
    if n == 2
        line([x x],[y y+3*sca],'color',c);
        line([x x+sca/2],[y y+sca],'color',c);
        line([x x-sca/2],[y y+sca],'color',c);
        text(x+sca/5,y+3*sca,num2str(abs(f)),'color',c);
    elseif n == 1
        line([x x+3*sca],[y y],'color',c);
        line([x x+sca],[y y+sca/2],'color',c);
        line([x x+sca],[y y-sca/2],'color',c);
        text(x+1.5*sca,y+sca/1.5,num2str(abs(f)),'color',c);
    else
        line([x x+1.4*sca],[y y+1.4*sca],'color',c);
        line([x+2*sca x+1.4*sca],[y y+1.4*sca],'color',c);
        line([x+2*sca x+1.7*sca],[y y-1.4*sca],'color',c);
        line([x+sca x+1.7*sca],[y-2*sca y-1.4*sca],'color',c);
        line([x+sca x],[y-2*sca y-2*sca],'color',c);
        line([x x+sca],[y-2*sca y-3*sca/2],'color',c);
        line([x x+sca],[y-2*sca y-5*sca/2],'color',c);
        text(x+2*sca,y-1.4*sca,num2str(abs(f)),'color',c);
    end
end
end

