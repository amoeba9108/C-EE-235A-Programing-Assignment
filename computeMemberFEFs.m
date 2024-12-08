function [memFEF] = computeMemberFEFs(w,L)
    memFEF=zeros(12,1);
    memFEF(2,1)=-wL/2;
    memFEF(6,1)=-wL^2/12;
    memFEF(8,1)=-wL/2;
    memFEF(12,1)=wL^2/12;
end