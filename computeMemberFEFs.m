function [memFEF] = computeMemberFEFs(w,L)
    % Initialize fixed-end force components
    Fx1 = 0; Mx1 = 0; Fy1 = 0; My1 = 0; Fz1 = 0; Mz1 = 0;
    Fx2 = 0; Mx2 = 0; Fy2 = 0; My2 = 0; Fz2 = 0; Mz2 = 0;

    % Extract load components
    loadX = w(1);
    loadY = w(2);
    loadZ = w(3);

    % Compute fixed-end forces for x direction
    Fx1 = loadX * L / 2;
    Mx1 = loadX * L.^2 / 12;
    Fx2 = Fx1;
    Mx2 = -Mx1;

    % Compute fixed-end forces for y direction
    Fy1 = loadY * L / 2;
    My1 = loadY * L.^2 / 12;
    Fy2 = Fy1;
    My2 = -My1;

    % Compute fixed-end forces for z direction
    Fz1 = loadZ * L / 2;
    Mz1 = loadZ * L.^2 / 12;
    Fz2 = Fz1;
    Mz2 = -Mz1;

    % Package results into a vector
    memFEF = [Fx1, Mx1, Fy1, My1, Fz1, Mz1, Fx2, Mx2, Fy2, My2, Fz2, Mz2];
    memFEF=memFEF';
end