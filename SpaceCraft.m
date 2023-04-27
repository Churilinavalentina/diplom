clc()
clear()
format long;

global bortTime;
time=0;
initAll();


for(time=0:1:1000)
    
  %Модельные программы
  modActuators();   %Модель исполнительных органов  
  modAstro();       %Модель движения астроориентиров
  modOrb();         %Модель движения центра масс
  modAng();         %Модель углового движения
  modAngVelSensor();%Модель измеритель угловой скорости
  modStarTracker(); %Модель звездного датчика
  
 exchangeModel2Bort();  %Обмены из модели в борт
 
 %Бортовые программы
 bortBins();
 bortActuators();
 
 exchangeBort2Model();  %Обмены из борта в модель      
 
    
 bortTime = bortTime + 0.2;  
end

str ='end';


