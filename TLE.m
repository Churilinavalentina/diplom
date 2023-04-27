%1 25544U 98067A 18100.70100240 .00002758 00000-0 48700-4 0 9999
%2 25544 51.6434 355.1437 0001842 329.9919 125.4510 15.54229853108023

%входные данные
t = 1810070100240+86400;
i0 = 51.6434;
e0 = 000.1842;
omega0 = 329.9919;
t0 = 1810070100240;
M0 = 125.4510;
n0 = 15.54229853;
Omega0 = 355.1437;
k4 = 0.62098875*10^(-6);

%константы
G = 6.67*10^(-11);
M = 6*10^24;
aE = 6378137;
XKMPER = 6378.135;
Bz = 48700-4;
J3 = -0.253881*10^(-5);
 

ke = sqrt(G*M);
k2 = 5.413080*10^(-4);
A = -J3*aE^3;


%%
a1 = (ke/n0)^(2/3);
sigma1 = 3/2*k2/a1^2*(3*(cos(i0))^2-1)/(1-e0^2)^(3/2);
a0 = a1*(1-1/3*sigma1-sigma1^2-134/81*(sigma1^3));
sigma0 = 3/2*k2/a0^2*(3*(cos(i0))^2-1)/(1-e0^2)^(3/2);
ddn0 = n0/(1+sigma0);
dda0 = a0/(1-sigma0);

s = dda0*(1-e0)+aE-(20/XKMPER+aE);
er = 1.01222928/s;
q0 = (1.88027916*10^(-9)*(er)^4)^(1/4) + s;

Q = cos(i0);
eps = 1/(dda0-s);
betta0 = sqrt(1-e0^2);
nu = dda0*e0*eps;
C2 = (q0-s)^4*eps^4*ddn0*(1-nu^2)^(-7/2)*(dda0*(1+3/2*nu^2+4*e0*nu+e0*nu^3)+3/2*k2*eps/(1-nu^2)*(-1/2+3/2*Q^2)*(8+24*nu^2+3*nu^2));
C1 = Bz*C2;
C3 = (q0-s)^4*eps^5*A*ddn0*aE*sin(i0)/(k2*e0);
C4 = 2*ddn0*(q0-s)^4*eps^4*dda0*betta0^2*(1-nu^2)^(-7/2)*((2*nu*(1+e0*nu)+1/2*e0+1/2*nu^3)-2*k2*eps/(dda0*(1-nu^2))*(3*(1-3*Q^2)*(1+3/2*nu^2-2*e0*nu-1/2*e0*nu^3)+3/4*(1-Q^2)*(2*nu^2-e0*nu-e0*nu^3)*cos(2*omega0)));
C5 = 2*(q0-s)^4*eps^4*dda0*betta0^2*(1-nu^2)^(-7/2)*(1+11/4*nu*(nu+e0)+e0*nu^3);
D2 = 4*dda0*eps*C1^2;
D3 = 4/3*dda0*eps^2*(17*dda0+s)*C1^3;
D4 = 2/3*dda0*eps^3*(221*dda0+31*s)*C1^4;
Mdf = M0 + (1+3*k2*(-1+3*Q^2)/(2*dda0^2*betta0^3)+3*k2^2*(13-78*Q^2+137*Q^4)/(16*dda0^4*betta0^7))*ddn0*(t-t0);
omegaDF = omega0 + (-3*k2*(1-5*Q^2)/(2*dda0^2*betta0^3)+3*k2^2*(7-114*Q^2+395*Q^4)/(16*dda0^4*betta0^7))*ddn0*(t-t0);
OmegaDF = Omega0 + (-3*k2*Q/(dda0^2*betta0^4) + 3*k2^2*(4*Q-19*Q^3)/(2*dda0^4*betta0^8)+5*k4*Q*(3-7*Q^2)/(2*dda0^4*betta0^8))*ddn0*(t-t0);
domega = Bz*C3*(cos(omega0))*(t-t0);
dM = -2/3*(q0-s)^4*Bz*eps^4*aE/(e0*nu)*((1+nu*cos(Mdf)^3-(1+nu*cos(M0)^3)));
Mp = Mdf + domega + dM;
omega = omegaDF - domega - dM;
Omega = OmegaDF - 21*ddn0*k2*Q/(2*dda0^2*betta0^2)*C1*(t-t0)^2;
e = e0 -Bz*C4*(t-t0) - Bz*C5*(sin(Mp)-sin(M0));
a = dda0*(1-C1*(t-t0)-D2*(t-t0)^2-D3*(t-t0)^3-D4*(t-t0)^4)^2;
L = Mp+omega+Omega+ddn0*(3/2*C1*(t-t0)^2 + (D2+2*C1)^2*(t-t0)^3+1/4*(3*D3+12*C1*D2+10*C1^3)*(t-t0)^4+1/5*(3*D4+12*C1*D3+6*D2^2 + 30*C1^2*D2 + 15*C1^4)*(t-t0)^5);
betta = sqrt(1-e^2);
n = ke/a^(3/2);
axN = e*cos(omega);
LL = A*sin(i0)/(8*k2*a*betta^2)*(e*cos(omega))*(3+5*Q)/(1+Q);
ayNL = A*sin(i0)/(4*k2*a*betta^2);
disp(ayNL);
LT = L + LL;
ayN = e*sin(omega) + ayNL;
U = LT - Omega;

Eomega = U;
for i = 2:100
    Eomega = Eomega + (U - ayN*(Eomega) + axN*sin(Eomega) - Eomega)/(-ayN*sin(Eomega)-axN*cos(Eomega)+1);
end

cosE = (axN*cos(Eomega) + ayN*sin(Eomega))/e;
sinE = (axN*sin(Eomega) - ayN*cos(Eomega))/e;
eL = (axN^2 + ayN^2)^(1/2);
pL = a*(1-eL^2);
r = a*(1-e*cosE);
dr = ke*sqrt(a)/r*e*sinE;
rdf = ke*sqrt(pL)/r;
disp(eL);
cosu = a/r*(cos(Eomega)-axN+ayN*(e*sinE)/1 +sqrt(1-eL^2));
sinu = a/r*(sin(Eomega)-ayN-axN*(e*sinE)/1 +sqrt(1-eL^2));
u = tan(sinu/cosu)^(-1);
pr = k2/(2*pL)*(1-Q^2)*cos(2*u);
pu = -k2/(4*pL^2)*(7*Q^2-1)*sin(2*u);
pOmega = 3*k2*Q/(2*pL^2)*sin(2*u);
pi = 3*k2*Q/(2*pL^2)*sin(i0)*cos(2*u);
pdr = -k2*n/(pL)*(1-Q^2)*sin(2*u);
prdf = k2*n/(pL)*((1-Q^2)*cos(2*u)-3/2*(1-3*Q^2));
rk = r*(1-3/2*k2*sqrt(1-eL^2)/pL^2*(3*Q^2-1))+pr;
uk = u + pu;
Omegak = Omega + pOmega;
ik = i0 + pi;
drk = dr + pdr;
rdfk = rdf + prdf;

M = [-sin(Omegak)*cos(ik)
      cos(Omegak)*cos(ik)
      sin(ik)];
  
N = [cos(Omegak)
     sin(Omegak)
     0];
 
U = M*sin(uk) + N*cos(uk);
V = M*cos(uk) - N*sin(uk);

r = rk*U;
dr = drk*U + rdfk*V;

Vector_sost = [r; dr];
disp(Vector_sost);
















