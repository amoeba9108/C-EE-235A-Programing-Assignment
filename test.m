clear
clc
format shortG
elk=AFKN_estiff(240,2000,11520,10195,200,200,3605,0.15,120);
disp("Local element matrix =");
disp(elk);
coordi=[0,0,0];
coordj=[0,120,0];
webdir=[0,-1,0];
gamma=AFKN_etran(coordi,coordj,webdir);
disp("gamma =");
disp(gamma);
egk=transpose(gamma)*elk*gamma;
disp("Global element matrix =");
disp(egk);