function main()
%Main code structure of the program

global node member BC F GK R Fp;
noden = size(node);
GK = zeros(noden(1)*3);

%% Assembly
assembly(size(member));

%% GK processing
Fp = F;
GKK = GKprocessing(GK , size(BC), size(node));

%% Calculation
if abs(det(GKK)) > 10^(-5)
    u = GKK\Fp
    NetF = GK*u
    R = NetF - F;
    ii = size(R);
    for i = 1:ii
        if abs(R(i)) < 10^(-5)
            R(i) = 0;
        end
       %% Output
        Figure();
    end
else
    underdetermined();
end
end

