function [elk] = AFKN_estiff (A, Izz, Iyy, J, Ayy, Azz, E, v, L)
% Initialize elk matrix
elk=zeros(12,12);
% Define axial stiffness elements
elk_axial=E*A/L;
% Define torsional stiffness elements
elk_torsion=J*E/(2*(1+v)*L);
% Define y-z plane flexural stiffness elements
elk_flex_y=12*E*Izz/L^3;
elk_flex_z=12*E*Iyy/L^3;
% Define rotational stiffness elements
elk_rot_y=4*E*Iyy/L;
elk_rot_z=4*E*Izz/L;
% Define coupled stiffness elements for rotations
elk_rot_y_c=2*E*Iyy/L;
elk_rot_z_c=2*E*Iyy/L;
% Populate axial stiffness elements
elk(1,1)=elk_axial;
elk(7,7)=elk_axial;
elk(1,7)=-elk_axial;
elk(7,1)=-elk_axial;
% Populate torsional stiffness elements
elk(4,4)=elk_torsion;
elk(10,10)=elk_torsion;
elk(4,10)=-elk_torsion;
elk(10,4)=-elk_torsion;
% Populate y-z plane flexural stiffness elements
% Y-plane (bending about z-axis)
elk(2,2)=elk_flex_y;
elk(8,8)=elk_flex_y;
elk(2,8)=-elk_flex_y;
elk(8,2)=-elk_flex_y;
elk(6,6)=elk_rot_y;
elk(12,12)=elk_rot_y;
elk(6,12)=elk_rot_y_c;
elk(12,6)=elk_rot_y_c;
% Z-plane (bending about y-axis)
elk(3,3)=elk_flex_z;
elk(9,9)=elk_flex_z;
elk(3,9)=-elk_flex_z;
elk(9,3)=-elk_flex_z;
elk(5,5)=elk_rot_z;
elk(11,11)=elk_rot_z;
elk(5,11)=elk_rot_z_c;
elk(11,5)=elk_rot_z_c;
% Populate cross terms for coupling
% Bending-torsion coupling
elk(2,6)=6*E*Izz/L^2;
elk(6,2)=6*E*Izz/L^2;
elk(8,12)=-6*E*Izz/L^2;
elk(12,8)=-6*E*Izz/L^2;
elk(3,5)=6*E*Iyy/L^2;
elk(5,3)=6*E*Iyy/L^2;
elk(9,11)=-6*E*Iyy/L^2;
elk(11,9)=-6*E*Iyy/L^2;
end