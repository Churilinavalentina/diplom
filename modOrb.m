function [  ] = modOrb(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global modFact;     %���� ����������� ��������������� �������� 
global modQJ2k2orb; % ���������� �������� �� ��� � ����������� ��
global modRJ2k;      % ���������� ������ ���� �� � �� J2000, ��
global modVJ2k;      % �������� �.�. �� � �� J2000, ��
global modRWgs84;    % ���������� ������ ���� �� � ����������� ��, ��
global modVWgs84;    % �������� �.�. �� � ����������� ��, ��

global JDJ2k;       %����� �������� ���� �� J2000
global JCJ2k;%����� �������� �������� �� J2000
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

