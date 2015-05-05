function [f_out] = func(gatePos)
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates), 1 in col if connected to gate

%give your own function here. it is a scalar output
global numGates numNets gateSize gateCon pins gridlen FU x r_magic alpha;

% set parameters

global W_BP W_WL W_DP;

WL_pen = wirelen(alpha, gatePos, gateCon);
DP_pen = denpen(gatePos, gridlen, r_magic, FU, gateSize);
BP_pen = boundpen(alpha, gatePos);
f_out = W_WL*WL_pen + W_DP*DP_pen + W_BP*BP_pen;