clear all
close all 

% size LSB in mV
LSB = 800/28;
% ideal codes positions
ideal = -200:LSB:200;
% real zero crossing locations for folding blocks and output latches
real_fold = [-181.4   -158     -136.6   -111.7   -83.691 -55.1   -28     -1.3275   27.3 55.2   79.83  101.3   124.9   148.5   171.061];
real_ltch = [-181.096 -157.806 -136.128 -111.216 -83.671 -54.706 -27.566 -0.829531 27.3 55.686 80.193 101.867 125.153 148.852 171.544];
%unreal = [-181.4 -158  -135.922  -111.7 -83.691 -55.9   -28.157  -1.3275 27.3   55.2 79.83  100.9 124.9   148.5  171.891];
%unreal = [-181.4 -158  -134.2  -111.7 -83.691 -58.1   -28.157  -1.3275
%29.9   55.2 79.83  98.689 124.9   148.5  173.4]; 190 Ohms
% Making DNL
[DNL_fold, DNL_LSB_fold] = get_DNL_LSB(real_fold, ideal, LSB);
[DNL_ltch, DNL_LSB_ltch] = get_DNL_LSB(real_ltch, ideal, LSB);

figure(1)
plot(DNL_fold, 'b'), xlabel('Code'), ylabel('DNL'), title('Figure 22. Folding Blocks DNL plot'), grid on, axis equal, legend("Folding Blocks DNL")
figure(2)
plot(DNL_ltch, 'r'), xlabel('Code'), ylabel('DNL'), title('Figure 40. Output Latches DNL plot'), grid on, axis equal, legend("Output Latches DNL")
figure(3)
x = 1:14;
plot(x, DNL_fold, x, DNL_ltch), legend("Folding Blocks DNL", "Output Latches DNL"), xlabel('Code'), ylabel('DNL'), title('Figure 41. Folding Blocks DNL plot'), grid on, axis equal

function [DNL, DNL_LSB] = get_DNL_LSB(real, ideal, lsb_size)
    INL = ideal - real;
    DNL = INL(2:end) - INL(1:end-1);
    DNL_LSB = max(abs(DNL))/lsb_size;
end