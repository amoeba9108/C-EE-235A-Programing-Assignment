function [gamma] = AFKN_etran (coordi, coordj, webdir)
    L = norm(coordj-coordi);
    gammaRow1 = (coordj-coordi)/L;
    gammaRow2 = webdir/norm(webdir);
    gammaRow3 = cross(gammaRow1,gammaRow2);  
    g = [gammaRow1;gammaRow2;gammaRow3];
    gamma = [g,zeros(3,9);zeros(3,3),g,zeros(3,6);zeros(3,6),g,zeros(3,3);zeros(3,9),g];
end
