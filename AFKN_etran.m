function [gamma] = AFKN_etran (coordi, coordj, webdir)
% Initialize gamma matrix
gamma=zeros(12,12);
% Calculate length of element
L=sqrt( (coordj(1)-coordi(1))^2 + (coordj(2)-coordj(1))^2 + (coordj(3)-coordi(3))^2 );
%% Projection of X' axis onto global axes
% Projection of x' onto x
lambdax=(coordj(1) - coordi(1)) / L;
% Projection of x' onto y
mux=(coordj(2) - coordi(1)) / L;
% Projection of x' onto z
vx=(coordj(3) - coordi(3)) / L;
%% Projection of Y' axis onto global axes
% Projection of y' onto x
lambday=(webdir(1));
% Projection of y' onto y
muy=(webdir(2));
% Projection of y' onto z
vy=(webdir(3));
%% Projection of Z' axis onto global axes
% Z direction vector is cross product x direction vector X y direction vector
% X direction vector
xvector=[lambdax,mux,vx];
% Y direction vector
yvector=[lambday,muy,vy];
% Z direction vector
zvector=cross(xvector,yvector);
% Create rotation matrix
rmatrix=[xvector;yvector;zvector];
% Populate gamma
gamma(1:3,1:3)=rmatrix;
gamma(4:6,4:6)=rmatrix;
gamma(7:9,7:9)=rmatrix;
gamma(10:12,10:12)=rmatrix;
end
