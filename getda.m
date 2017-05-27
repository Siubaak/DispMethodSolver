function getda()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global node member material BC F hn hmm hm hc hl;
node = [];
member = [];
material = [];
BC = [];
F = [];
node = str2double(get(hn,'data'));
member = str2double(get(hm,'data'));
material = str2double(get(hmm,'data'));
b = get(hc,'data');
kkb = size(b);
for i=3:3:3*kkb(1)
    BC(i-2,1) = str2double(b(i/3,1));
    BC(i-1,1) = str2double(b(i/3,1));
    BC(i,1) = str2double(b(i/3,1));
    if strcmp(b(i/3,2),'Fixed') == 1
        BC(i-2,2) = 1;
        BC(i-1,2) = 1;
        BC(i,2) = 1;
    elseif strcmp(b(i/3,2),'Pinned') == 1
        BC(i-2,2) = 1;
        BC(i-1,2) = 1;
        BC(i,2) = 0;
    elseif strcmp(b(i/3,2),'Slide(x)') == 1
        BC(i-2,2) = 0;
        BC(i-1,2) = 1;
        BC(i,2) = 1;
    elseif strcmp(b(i/3,2),'Slide(y)') == 1
        BC(i-2,2) = 1;
        BC(i-1,2) = 0;
        BC(i,2) = 1;
    elseif strcmp(b(i/3,2),'Link(x)') == 1
        BC(i-2,2) = 1;
        BC(i-1,2) = 0;
        BC(i,2) = 0;
    else
        BC(i-2,2) = 0;
        BC(i-1,2) = 1;
        BC(i,2) = 0;
    end
end
Fh = str2double(get(hl,'data'));
noden = size(node);
F = zeros(noden(1)*3,1);
fhn = size(Fh);
for i = 1:fhn(1)
    for j = 1:3
        F((Fh(i,1)-1)*3+j,1) = Fh(i,j+1);
    end
end
end

