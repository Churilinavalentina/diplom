function [ JDJ2k ] = JulianTime( UTC )
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
dTGpsJ2k = 630763200  + 0.255814 - 0.3554565;

JDJ2k = (UTC - dTGpsJ2k)/86400;

end

