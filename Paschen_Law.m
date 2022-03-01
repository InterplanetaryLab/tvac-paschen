%% Paschen Law 
% Using Townsend Breakdown Equation 
% Created by Chandler Hutchens

format compact ;
format long ;
close all ;
clear all ;
clc ;

%% Variables 
A = 112.5 ; % Constant - kPa*cm 
B = 2737.5 ; % Constans - V/(kPa*cm)
p = 10 ; % Torr
p1 = p ./ 7.501 ; % kPa
d = .2 ; % cm
pd = p1 *d ; 

%% Calculations
% k changes based on pd value 
if (.01333<pd) && (pd<.2)
    k = 2.0583*(pd)^-.1724 ; 
elseif (.2<pd) && (pd<100)
    k = 3.5134*(pd)^.0599 ;
elseif (100<pd) && (pd<1400)
    k = 4.6295*(3.5134*(100)^.0599) ;
else 
    fprintf('Error: Pd Not Within Bounds of Paschen Law \n')
    return
end 

Vb = (B*pd) / (log(pd) + k) ;

fprintf('The Breakdown Voltage at the distance of %.5f and pd of %.5f is %.5f Volts', d, pd, Vb)
