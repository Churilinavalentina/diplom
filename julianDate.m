function [ JD2000 ] = julianDate( year, month, day, hour, minute, second )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

y = year;
m = month;
d = day;
h = hour;
mn = minute;
s = second;


JD=367*y-floor(7*(y+floor((m+9)/12))/4)+floor(275*m/9)+d+1721013.5+((s/60+mn)/60+h)/24;

JD2000 = JD-2451545;

end

