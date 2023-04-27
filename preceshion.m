function [Matr] = Preceshion(t)


%bortTime = 1207374730;
%julianDays = (bortTime - 630763200 + 0.255814 - 0.3554565)/86400;
%t = julianDays/36525;
 

Ea = 0.111808609*10^(-1)*t + 0.146356*10^(-5)*t^2+0.872*10^(-7)*t^3;
Za = 0.111808609*10^(-1)+0.53072*10^(-5)*t^2+0.883*10^(-7)*t^3;
Qa = 0.97171735*10^(-2)*t+0.20685*10^(-5)*t^2-0.2028*10^(-6)*t^3;

P11 = cos(Ea)*cos(Za)*cos(Qa)-sin(Ea)*sin(Za);
P12 = -sin(Ea)*cos(Za)*cos(Qa)-cos(Ea)*sin(Za);
P13 = -cos(Za)*sin(Qa);
P21 = cos(Ea)*sin(Za)*cos(Qa)+sin(Ea)*cos(Za);
P22 = -sin(Ea)*sin(Za)*cos(Qa)+cos(Ea)*cos(Za);
P23 = -sin(Za)*sin(Qa);
P31 = cos(Ea)*sin(Qa);
P32 = -sin(Ea)*cos(Qa);
P33 = cos(Qa);

Matr = [P11 P12 P13
        P21 P22 P23
        P31 P32 P33];

end

