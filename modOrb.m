function [  ] = modOrb(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global modFact;     %Сила формируемый исполнительными органами 
global modQJ2k2orb; % Кватернион перехода от ИСК к орбитальной СК
global modRJ2k;      % Координаты центра масс КА в СК J2000, км
global modVJ2k;      % Скорости ц.м. КА в СК J2000, км
global modRWgs84;    % Координаты центра масс КА в гринвичской СК, км
global modVWgs84;    % Скорости ц.м. КА в гринвичской СК, км

global JDJ2k;       %Число Юианских дней от J2000
global JCJ2k;%Число Юианских столетий от J2000
global bortTime;

%x = rj2k/norm(Rj2k);
%z = -cros(Rj2k, Vj2k)/(cross(Rj2k, Vj2k));


julianDays = (bortTime - 630763200 + 0.255814 - 0.3554565)/86400;
julianCent = julianDays/36525;

P = preceshion(julianCent);
%N = Nutation(
R = Rotation(julianDays);

%%
tay = 0.2;
T = 10;
t=0;
X = [Rx, Ry, Rz, Vx, Vy, Vz];
dX = [Vx, Vy, Vz, gx, gy, gz];

for t = 0 : tay : T 
    X1 = X + k1*tau/2;
    g=gravit_acceleration(X1);
    K2 = [X1(4) X1(5) X1(6) g(1) g(2) g(3)];

    X1 = X + k2*tau/2;
    g=gravit_acceleration(X1);
    K3 = [X1(4) X1(5) X1(6) g(1) g(2) g(3)];

    X1 = X + k3*tau;
    g=gravit_acceleration(X1);
    K4 = [X1(4) X1(5) X1(6) g(1) g(2) g(3)];
    X = X + tay/6*(K1 + 2*K2 + 2*K3 + K4);
end
end

