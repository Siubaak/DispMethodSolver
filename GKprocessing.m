function GKK = GKprocessing( GKK , bcn , noden)
%Process the global stiffness function with boundary conditions
%  Input: GKK - global stiffness matrix
%         bcn - boundary condition matrix size
%         noden - node matrix size
%  Ouput: GKK - structural stiffness matrix (after processing)
global Fp BC
for i = 1:3:(bcn(1)-2)
    for j = 0:2
        m = (BC(i+j,1)-1)*3+j+1;
        if BC(i+j,2) == 1
            Fp(m,1) = 0;
            GKK(:,m) = zeros(noden(1)*3,1);
            GKK(m,:) = zeros(1,noden(1)*3);
            GKK(m,m) = 1;
        end
    end
end
return

