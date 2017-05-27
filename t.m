function t = t( mem )
%Calculate the tranposed matrix
%  Input: mem - member number
%  Ouput: t - transposed matrix
global node member
x1=node(member(mem,1),1);
y1=node(member(mem,1),2);
x2=node(member(mem,2),1);
y2=node(member(mem,2),2);
l0=sqrt((x2-x1)^2+(y2-y1)^2);
l=(x2-x1)/l0;
m=(y2-y1)/l0;
t=[ l -m  0  0  0  0
    m  l  0  0  0  0
    0  0  1  0  0  0
    0  0  0  l -m  0
    0  0  0  m  l  0
    0  0  0  0  0  1];
return

