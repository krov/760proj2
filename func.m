function [f_out] = func(FU, gatePos, gateCon)
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates), 1 in col if connected to gate

%give your own function here. it is a scalar output

% set parameters
alpha = 1;  % something?
r = 2;
gridlen = 10;   % something??

% set weights
W_BP = 1;   % fix this as constant
W_DP = 1;   % adapt this later
% start wirelen same weight as density
W_WL = denpen(gatePos, gridlen, r, FU) / wirelen(alpha, gatePos, gateCon);

f_out = W_WL*wirelen(alpha, gatePos, gateCon) + ...
        W_DP*denpen(gatePos, gridlen, r, denpen, FU) + ...
        W_BP*boundpen(alpha, gatePos);