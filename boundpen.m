function [ bp ] = boundpen( alpha, gatePos )
% calculates the boundary penalty for a given placement
% gatePos is (numGates x 3), (x coord, y coord, size)

% TODO: size? gatePos stores centre coords
% gatePos(gatePos>0 & gatePos<100) = 0;
numGates = numel(gatePos)/2;
gateCoords = gatePos;
for i=1:numGates
    if (gateCoords(i,1) < 0)
        gateCoords(i,1) = (gateCoords(i,1)/alpha)^2;
    elseif (gateCoords(i,1) > 100)
        gateCoords(i,1) = ((gateCoords(i,1)-100)/alpha)^2;
    else
        gateCoords(i,1) = 0;
    end
    if (gateCoords(i+numGates,1) < 0)
        gateCoords(i+numGates,1) = (gateCoords(i+numGates,1)/alpha)^2;
    elseif (gateCoords(i+numGates,1) > 100)
        gateCoords(i+numGates,1) = ((gateCoords(i+numGates,1)-100)/alpha)^2;
    else
        gateCoords(i+numGates,1) = 0;
    end
end

% add them up
bp = sum(sum(gateCoords));

end

