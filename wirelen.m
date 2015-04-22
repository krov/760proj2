function [ len ] = wirelen( alpha, gatePos, gateCon )
% calculates smoothened half perim wire length approximation
% for all nets
% gatePos is (numGates*2 x 1), (x coord; y coord)
% gateCon is (numNets x numGates+numPins), 1 in col if connected to
% gate/pin

global pins;

% only need the coords, not size
numGates = numel(gatePos)/2;
gateCoords = [gatePos(1:numGates),gatePos(numGates+1:2*numGates)];
% add pin info to gateCoords
gateCoords = [gateCoords; pins(:,2:3)];
maxCoords = exp(gateCoords ./ alpha);
maxSum = gateCon * maxCoords;
max1 = alpha * log(maxSum);
minCoords = exp(-gateCoords ./ alpha);
minSum = gateCon * minCoords;
min1 = alpha * log(minSum);
% smooth approx = maxX - minX + maxY - minY
len = sum(sum(max1)) - sum(sum(min1));

% CONSTRAINTS? fixed pads??

end

