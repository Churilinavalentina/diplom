Rx = 100;
Ry = 200;
Rz = 0;
Vx = 10;
Vy = 0.5;
Vz = 1;
gx = 10;
gy = 5;
gz = 1;

X = Runge_Kutta(Rx, Ry, Rz, Vx, Vy, Vz, gx, gy, gz);
disp(X);