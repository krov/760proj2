function [ bp ] = boundpen( alpha, gatePos )
% calculates the boundary penalty for a given placement
% gatePos is (numGates x 3), (x coord, y coord, size)

% TODO: size? gatePos stores centre coords
% gatePos(gatePos>0 & gatePos<100) = 0;

gateCoords = gatePos(:,1:2);
for i=1:size(gateCoords,1)
    if (gateCoords(i,1) < 0)
        gateCoords(i,1) = (gateCoords(i,1)/alpha)^2;
    else if (gateCoords(i,1) > 100)
        gateCoords(i,1) = ((gateCoords(i,1)-100)/alpha)^2;
        else
            gateCoords(i,1) = 0;
        end
    end
    if (gateCoords(i,2) < 0)
        gateCoords(i,2) = (gateCoords(i,2)/alpha)^2;
    else if (gateCoords(i,2) > 100)
        gateCoords(i,2) = ((gateCoords(i,2)-100)/alpha)^2;
        else
            gateCoords(i,2) = 0;
        end
    end
end

% add them up
bp = sum(sum(gateCoords));

end

