function [f_out] = func(FU, gatePos, gateCon, gridlen)
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates), 1 in col if connected to gate

%give your own function here. it is a scalar output

% set parameters
r = 2;
alpha = gridlen*r;  % something?

% set weights
W_BP = 1;   % initial only
W_DP = 1;   % always
% start wirelen same weight as density
W_WL = 1;%denpen(gatePos, gridlen, r, FU) / wirelen(alpha, gatePos, gateCon);

f_out = W_WL*wirelen(alpha, gatePos, gateCon) + ...
        W_DP*denpen(gatePos, gridlen, r, FU) + ...
        W_BP*boundpen(alpha, gatePos);