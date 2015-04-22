function [ len ] = wirelen( alpha, gatePos, gateCon )
% calculates smoothened half perim wire length approximation
% for all nets
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates), 1 in col if connected to gate

% only need the coords, not size
numGates = numel(gatePos)/2;
gateCoords = [gatePos(1:numGates),gatePos(numGates+1:2*numGates)];
maxCoords = exp(gateCoords ./ alpha);
maxSum = gateCon * maxCoords;
max1 = alpha * log(maxSum);
minCoords = exp(-gateCoords ./ alpha);
minSum = gateCon * minCoords;
min1 = alpha * log(minSum);
% smooth approx = maxX - minX + maxY - minY
%len = max1(1) - min1(1) + max1(2) - min1(2);
len = sum(sum(max1)) - sum(sum(min1));

% CONSTRAINTS? fixed pads??

end

