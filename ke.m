function k = ke( mem )
%Calculate the member stiffness matrix in local coordinate
%  Input: mem - member number
%  Ouput: k - stiffness matrix
global node member material
x1=node(member(mem,1),1);
y1=node(member(mem,1),2);
x2=node(member(mem,2),1);
y2=node(member(mem,2),2);
e=material(member(mem, 3),1);
i=material(member(mem, 3),2);
a=material(member(mem, 3),3);
ea=e*a;
ei=e*i;
l=sqrt((x2-x1)^2+(y2-y1)^2);
k=[ ea/l          0         0 -ea/l          0         0
       0  12*ei/l^3  6*ei/l^2     0 -12*ei/l^3  6*ei/l^2
       0   6*ei/l^2    4*ei/l     0  -6*ei/l^2    2*ei/l
   -ea/l          0         0  ea/l          0         0
       0 -12*ei/l^3 -6*ei/l^2     0  12*ei/l^3 -6*ei/l^2
       0   6*ei/l^2    2*ei/l     0  -6*ei/l^2    4*ei/l];
return

