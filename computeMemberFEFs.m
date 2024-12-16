function [memFEF] = computeMemberFEFs(w,L)
%   The purpose of this function is to compute a vector of fixed end
%   forces on a member element, given a matrix of uniformly distributed
%   load data in the x, y, z directions.
    memFEF=zeros(12,1);
    %   X direction FEFs
    memFEF(1)=-w(1)*L/2;
    memFEF(7)=-w(1)*L/2;
    %   Y direction FEFs
    memFEF(2)=-w(2)*L/2;
    memFEF(6)=-w(2)*L^2/12;
    memFEF(8)=-w(2)*L/2;
    memFEF(12)=w(2)*L^2/12;
    %   Z direction FEFs
    memFEF(3)=-w(3)*L/2;
    memFEF(11)=-w(3)*L^2/12;
    memFEF(9)=-w(3)*L/2;
    memFEF(5)=w(3)*L^2/12;
end