function [  ] = exchangeModel2Bort(  )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
global modSTizm;        %��������� ��������� �������
global modWizm;         %��������� ������� ������� ��������
global modQJ2k2orb;     % ���������� �������� �� ��� � ����������� ��

global borSTizm;        %��������� ��������� �������
global bortWizm;        %��������� ������� ������� ��������
global bortQL;          %���������� �� J2000 � ������������ ������

bortWizm = modWizm;
borSTizm = modSTizm;
bortQL = modQJ2k2orb; % ���������� �������� �� ��� � ����������� ��


end

