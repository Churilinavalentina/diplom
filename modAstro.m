function [ output_args ] = modAstro( input_args )
%modAstro Summary of this function goes here
%   Detailed explanation goes here
global sunDir;      %��������� ������ � ���
global moonDir;     %��������� ���� � ���
global JDJ2k;       %����� �������� ���� �� J2000
global JCJ2k;       %����� �������� �������� �� J2000

global bortTime;


JDJ2k = JulianTime(bortTime);
JCJ2k = JDJ2k/36525;

end

