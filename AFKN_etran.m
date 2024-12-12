function [gamma] = AFKN_etran (coordi, coordj, webdir)
    % Initialize gamma matrix
    gamma = zeros(12, 12);

    % Calculate length of the element
    L = sqrt((coordj(1) - coordi(1))^2 + (coordj(2) - coordi(2))^2 + (coordj(3) - coordi(3))^2);

    % Projection of the local x' axis onto global axes
    lambdax = (coordj(1) - coordi(1)) / L;
    mux = (coordj(2) - coordi(2)) / L;
    vx = (coordj(3) - coordi(3)) / L;

    % Local x-axis unit vector
    xvector = [lambdax, mux, vx];

    % Normalize webdir to ensure it is a unit vector
    webdir = webdir / norm(webdir);

    % Projection of local y' axis onto global axes
    % Local y-axis unit vector (input webdir)
    lambday = webdir(1);
    muy = webdir(2);
    vy = webdir(3);

    % Local y-axis unit vector
    yvector = [lambday, muy, vy];

    % Compute local z' axis as the cross product of xvector and yvector
    zvector = cross(xvector, yvector);

    % Recompute yvector to ensure orthogonality using the cross product
    yvector = cross(zvector, xvector);

    % Normalize the yvector and zvector
    yvector = yvector / norm(yvector);
    zvector = zvector / norm(zvector);

    % Rotation matrix from local to global coordinates
    rmatrix = [xvector; yvector; zvector];

    % Populate gamma matrix with the rotation matrix
    gamma(1:3, 1:3) = rmatrix;
    gamma(4:6, 4:6) = rmatrix;
    gamma(7:9, 7:9) = rmatrix;
    gamma(10:12, 10:12) = rmatrix;
end
