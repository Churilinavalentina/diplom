function [R] = Rotation(JD, Na)

d = JD;
M = d - 0.5 - floor(d-0.5);
t = d/36525;
Na = Nutation(t);
Sm = 1.7533685592+0.017202718051*d+6.2831853072*M+6.7707139*10^(-6)-4.50876*10^(-10)*t^3;
St = Sm +Na;

R = [cos(St) sin(St) 0
    -sin(St) cos(St) 0
    0 0 1];
end

