function show(node,member,b,load,reaction)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global fig;
cla;
% node
plot(fig,node(:,1),node(:,2),'k.');
% member
ak = size(member);
for i = 1:ak(1)
    line([node(member(i,1),1),node(member(i,2),1)],[node(member(i,1),2),node(member(i,2),2)]);
end
% constraint
xmin = min(node(:,1));
ymin = min(node(:,2));
xmax = max(node(:,1));
ymax = max(node(:,2));
scaax = xmax-xmin;
scaay = ymax-ymin;
sca = max(scaax,scaay);
kkb = size(b);
i = -1;
for i = 0:3:(kkb(1)-3)  
    if b(i+1,2) == 1 && b(i+2,2) == 1 && b(i+3,2) == 1
        fixed(node(b(i+1,1),1), node(b(i+1,1),2), sca/30);
    elseif b(i+1,2) == 1 && b(i+2,2) == 1 && b(i+3,2) == 0
        pinned(node(b(i+1,1),1), node(b(i+1,1),2), sca/30);
    elseif b(i+1,2) == 0 && b(i+2,2) == 1 && b(i+3,2) == 1
        slide(node(b(i+1,1),1), node(b(i+1,1),2), sca/30, 0)
    elseif b(i+1,2) == 1 && b(i+2,2) == 0 && b(i+3,2) == 1
        slide(node(b(i+1,1),1), node(b(i+1,1),2), sca/30, 1)
    elseif b(i+1,2) == 1 && b(i+2,2) == 0 && b(i+3,2) == 0
        link(node(b(i+1,1),1), node(b(i+1,1),2), sca/30, 0)
    else
        link(node(b(i+1,1),1), node(b(i+1,1),2), sca/30, 1)
    end
end
i = -1;
% load
pp = 0;
ln = size(load);
for i = 0:3:(ln(1)-3)
    pp = pp + 1;
    for j = 1:3
        force(node(pp,1), node(pp,2), load(i+j), j, sca/30, 'k');
    end
end
i = -1;
j = -1;
% reaction
pp = 0;
rn = size(reaction);
for i = 0:3:(rn(1)-3)
    pp = pp + 1;
    for j = 1:3
        force(node(pp,1), node(pp,2), reaction(i+j), j, sca/30, 'b');
    end
end
i = -1;
j = -1;
% axis
liubai = sca / 5;
xa = (xmax+xmin-sca)/2-liubai;
xb = (xmax+xmin+sca)/2+liubai;
ya = (ymax+ymin-sca)/2-liubai;
yb = (ymax+ymin+sca)/2+liubai;
if ~isempty(node)
    axis([xa xb ya yb]);
end
set(gca,'xtick',[],'ytick',[]);
set(gca,'box','off');
end

