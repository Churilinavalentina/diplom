clc()
clear()
format long;

global bortTime;
time=0;
initAll();


for(time=0:1:1000)
    
  %��������� ���������
  modActuators();   %������ �������������� �������  
  modAstro();       %������ �������� ���������������
  modOrb();         %������ �������� ������ ����
  modAng();         %������ �������� ��������
  modAngVelSensor();%������ ���������� ������� ��������
  modStarTracker(); %������ ��������� �������
  
 exchangeModel2Bort();  %������ �� ������ � ����
 
 %�������� ���������
 bortBins();
 bortActuators();
 
 exchangeBort2Model();  %������ �� ����� � ������      
 
    
 bortTime = bortTime + 0.2;  
end

str ='end';


