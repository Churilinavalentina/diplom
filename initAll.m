function [  ] = initAll(  )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

global modRJ2k;      % Координаты центра масс КА в СК J2000, км
global modVJ2k;      % Скорости ц.м. КА в СК J2000, км
global modWsb;       % Угловая скорость твердого тела
global modQJ2k2body; % Кватернион рассогласования от ИСК к ССК
global bortAct;      % Команды на исполнительные органы
global bortTime;

bortTime = 1207374730;

modRJ2k = [3588.42680645912	3466.14551347409	4586.15423230291]';
modVJ2k = [-6.50325709282537	2.71207491067134	3.03325068365298]';

modWsb = [0.001 0.002 0.0003]';
modQJ2k2body = [1.0 0.0 0.0 0.0];

bortAct = [0 0 0]';
% 	-0.103711337436321	0.255461807405073	0.863217030008877	0.422894292403144	
%     
%     dcm2quat
%     x = Rj2k/norm(Rj2k);
%     z = -cross(Rj2k, Vj2k)/(cross(Rj2k, Vj2k));
%     y = 

end

