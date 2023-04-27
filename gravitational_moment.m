function [Tgrav] = gravitational_moment(Rcm)

J = [800 0 0;
     0 600 0;
     0 0 700]; 
rcm = sqrt(Rcm(1,1)^2 + Rcm(1,2)^2 + Rcm(1,3)^2);
nu = 3.968*10^5;        % κμ^3/ρ^2 
j = quatmultiply(quatmultiply(quatconj(modQJ2k2body),j),
modQJ2k2body);
omega_orb = sqrt(nu/rcm^3);

Tgrav = 3*omega_orb^2*j*(J*j);

 
end

