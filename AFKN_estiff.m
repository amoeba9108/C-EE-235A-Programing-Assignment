function [elk] = AFKN_estiff (A, Izz, Iyy, J, Ayy, Azz, E, v, L)
%   The purpose of this function is to setup the local stiffness matrix of
%   a member elemnt which accounts for shear deformations.
%   Initialize elk matrix
    elk=zeros(12,12);
%   Setup intermediate calculations for shear deformations
    G=E/(2*(1+v));
    alpha1=12*E*Izz/(G*Ayy*L^2);
    alpha2=12*E*Iyy/(G*Azz*L^2);
    beta1=E*Izz/((1+alpha1)*L);
    beta2=E*Iyy/((1+alpha2)*L);
%   Define axial stiffness elements
    elk_axial=E*A/L;
%   Define torsional stiffness elements
    elk_torsion=J*G/L;
%   Define y-z plane flexural stiffness elements
    elk_flex_y=12*beta1/L^2;
    elk_flex_z=12*beta2/L^2;
%   Define rotational stiffness elements
    elk_rot_y=(4+alpha1)*beta1;
    elk_rot_z=(4+alpha2)*beta2;
%   Define coupled stiffness elements for rotations
    elk_rot_y_c=(2-alpha1)*beta1;
    elk_rot_z_c=(2-alpha2)*beta2;
%   Define bending torsion coupled elements
    elk_ben_tor_1=6*beta1/L;
    elk_ben_tor_2=6*beta2/L;
%   Populate axial stiffness elements
    elk(1,1)=elk_axial;
    elk(7,7)=elk_axial;
    elk(1,7)=-elk_axial;
    elk(7,1)=-elk_axial;
%   Populate torsional stiffness elements
    elk(4,4)=elk_torsion;
    elk(10,10)=elk_torsion;
    elk(4,10)=-elk_torsion;
    elk(10,4)=-elk_torsion;
%   Populate y-z plane flexural stiffness elements
%   Y-plane (bending about z-axis)
    elk(2,2)=elk_flex_y;
    elk(8,8)=elk_flex_y;
    elk(2,8)=-elk_flex_y;
    elk(8,2)=-elk_flex_y;
    elk(6,6)=elk_rot_y;
    elk(12,12)=elk_rot_y;
    elk(6,12)=elk_rot_y_c;
    elk(12,6)=elk_rot_y_c;
%   Z-plane (bending about y-axis)
    elk(3,3)=elk_flex_z;
    elk(9,9)=elk_flex_z;
    elk(3,9)=-elk_flex_z;
    elk(9,3)=-elk_flex_z;
    elk(5,5)=elk_rot_z;
    elk(11,11)=elk_rot_z;
    elk(5,11)=elk_rot_z_c;
    elk(11,5)=elk_rot_z_c;
%   Populate cross terms for coupling
%   Bending-torsion coupling
    elk(2,6)=elk_ben_tor_1;
    elk(6,2)=elk_ben_tor_1;
    elk(8,12)=-elk_ben_tor_1;
    elk(12,8)=-elk_ben_tor_1;
    elk(6,8)=-elk_ben_tor_1;
    elk(8,6)=-elk_ben_tor_1;
    elk(2,12)=elk_ben_tor_1;
    elk(12,2)=elk_ben_tor_1;
    elk(3,5)=-elk_ben_tor_2;
    elk(5,3)=-elk_ben_tor_2;
    elk(9,11)=elk_ben_tor_2;
    elk(11,9)=elk_ben_tor_2;
    elk(9,5)=elk_ben_tor_2;
    elk(5,9)=elk_ben_tor_2;
    elk(3,11)=-elk_ben_tor_2;
    elk(11,3)=-elk_ben_tor_2;
end