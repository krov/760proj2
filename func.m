function [f_out] = func(gatePos)
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates), 1 in col if connected to gate

%give your own function here. it is a scalar output
global numGates numNets gateSize gateCon pins gridlen FU x;

% set parameters
r = 2;
alpha = gridlen*r;  % something?

% set weights
W_BP = 1;   % initial only
W_DP = 1;   % always
% start wirelen same weight as density
W_WL = denpen(gatePos, gridlen, r, FU, gateSize) / wirelen(alpha, gatePos, gateCon);

WL_pen = wirelen(alpha, gatePos, gateCon);
DP_pen = denpen(gatePos, gridlen, r, FU, gateSize);
BP_pen = boundpen(alpha, gatePos);
    
f_out = W_WL*WL_pen + W_DP*DP_pen + W_BP*BP_pen;