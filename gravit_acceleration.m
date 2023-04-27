function [G] = gravit_acceleration(r, F)

nu = 3.968*10^5;        % κμ^3/ρ^2
e = 2.634*10^10;        % κμ^5/ρ^2
K = 6.773*10^15;        % κμ^7/ρ^2


Gr = -nu/r^2 - e/r^4*(1-3*sin(F).^2) - K/r^6*(5*(sin(F)).^4-30/7*(sin(F)).^2+3/7);
Gm = -e/r^4*sin(2*F) + 1/14*K/r^6*(2*sin(2*F)-7*sin(4*F));
G = Gr + Gm;
end

