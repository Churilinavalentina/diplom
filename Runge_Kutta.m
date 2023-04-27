function [X] = Runge_Kutta(Rx, Ry, Rz, Vx, Vy, Vz, gx, gy, gz)

tay = 0.2;
T = 10;
t=0;
X = [Rx, Ry, Rz, Vx, Vy, Vz];
dX = [Vx+gx*t, Vy+gy*t, Vz+gz*t, gx, gy, gz];

for t = 0 : tay : T 
    k1 = dX;
    k2 = dX + tay/2*k1;
    k3 = dX + tay/2*k2;
    k4 = dX + tay*k3;
    X = X + tay/6*(k1 + 2*k2 + 2*k3 + k4);
end

    



end

