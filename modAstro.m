function [ output_args ] = modAstro( input_args )
%modAstro Summary of this function goes here
%   Detailed explanation goes here
global sunDir;      %Положение Солнца в ССК
global moonDir;     %Положение Луны в ССК
global JDJ2k;       %Число Юианских дней от J2000
global JCJ2k;       %Число Юианских столетий от J2000

global bortTime;


JDJ2k = JulianTime(bortTime);
JCJ2k = JDJ2k/36525;

end

