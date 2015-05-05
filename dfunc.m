function [f_prime_out] = dfunc(gatePos)
% returns a (numGates x 2) vector, where 1st col is dx, 2nd col is dy
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates+numPins), 1 in col if connected to
% gate/pin
global numGates numNets gateSize gateCon pins gridlen FU x;

%give your own derivative here. it is a vector output in 
% f_prime_out=(del/del(x1) del/del(x2) ... etc)'

% NAIVE METHOD
numGates = size(gatePos,1)/2;
f_prime_out = zeros(2*numGates,1);
h = gridlen / 100;  % TODO: figure out what a good number should be
% get original cost
origC = func(gatePos);
for i=1:numGates
    % move ith cell by a little bit in x axis
    gatePosTemp = gatePos;
    gatePosTemp(i,1) = gatePosTemp(i,1) + h;
    dxC = func(gatePosTemp);
    f_prime_out(i,1) = (dxC - origC) / h;
    % do the same for y axis
    gatePosTemp = gatePos;
    gatePosTemp(i+numGates,1) = gatePosTemp(i+numGates,1) + h;
    dyC = func(gatePosTemp);
    f_prime_out(numGates+i,1) = (dyC - origC) / h;
end

