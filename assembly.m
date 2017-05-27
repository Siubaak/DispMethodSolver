function assembly( memn )
%Assembly the global stiffness matrix
%  Input: memn - member matrix size
%  Ouput: none
global GK member
for i = 1:memn(1)
    K = ke(i);
    T = t(i);
    Ke = T*K*T';
    for j = 1:2
        for k = 1:2
            for p = 1:3
                for q = 1:3
                    m = (member(i,j)-1)*3+p;
                    n = (member(i,k)-1)*3+q;
                    mm = (j-1)*3+p;
                    nn = (k-1)*3+q;
                    GK(m,n) = GK(m,n)+Ke(mm,nn);
                end
            end
        end
    end
end
return

