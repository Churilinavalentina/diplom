function [  ] = exchangeModel2Bort(  )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
global modSTizm;        %Измерения звездного датчика
global modWizm;         %Измерения датчика угловой скорости
global modQJ2k2orb;     % Кватернион перехода от ИСК к орбитальной СК

global borSTizm;        %Измерения звездного датчика
global bortWizm;        %Измерения датчика угловой скорости
global bortQL;          %Кватернион от J2000 к орбитальному базису

bortWizm = modWizm;
borSTizm = modSTizm;
bortQL = modQJ2k2orb; % Кватернион перехода от ИСК к орбитальной СК


end

