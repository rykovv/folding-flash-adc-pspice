% Script for preamp diff pairs transistors Von estimation
clc;
% Von based on the parameters
nbits = 4; % number of ADC bits
Vfs = 0.4; % [-Vfs/2, Vfs/2] reference voltage
ifact = 4; % interpolation factor
pstag = 3; % number of preamp stages

total_interpolation = ifact^pstag;

lsb = Vfs/(2^nbits);
Von = lsb*total_interpolation;
fprintf("For Vref = %.3fV [%.3f, %.3f]V dm, Von = %.3fV, LSB = %.3f\n", Vfs, -Vfs/2, Vfs/2, Von, lsb);

% reference voltage based on Von
Von = 0.2055; % Volts
lsb = Von/total_interpolation;
Vfs = lsb*2^nbits;
fprintf("For Von = %.3fV, Vref = %.3fV [%.3f, %.3f]V dm\n", Von, Vfs, -Vfs/2, Vfs/2);