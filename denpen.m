function [ dp ] = denpen( gatePos, gridlen, r, FU, gateSize)
% calculates density penalty of a given placement
% gatePos is (numGates x 3), (x coord, y coord, size)

grid = zeros(ceil(100/gridlen)+1);
A = (100)^2;
cg = 0.75 * A / (101^2);    % assumes 0.75 capacity

gateNum = size(gatePos,1)/2;

for i=1:gateNum
    xc = gatePos(i,1);
    yc = gatePos(i+gateNum,1);
    areaC = gateSize(i) * FU;
    xMin = max(ceil((xc - (r * gridlen)) / gridlen), 0) + 1;              % +1 because of index from 1
    xMax = min(floor((xc + (r * gridlen)) / gridlen), 100/gridlen) + 1;   % +1 because of index from 1
    yMin = max(ceil((yc - (r * gridlen)) / gridlen), 0) + 1;              % +1 because of index from 1
    yMax = min(floor((yc + (r * gridlen)) / gridlen), 100/gridlen) + 1;   % +1 because of index from 1
    % go through each grid point
    for x=xMin:xMax
        for y=yMin:yMax
            xg = x * gridlen;
            yg = y * gridlen;
            pGain = ((areaC/(r*r)*normpdf(xg,xc,r/2)*normpdf(yg,yc,r/2)) - cg)^2;
            grid(x,y) = grid(x,y) + pGain;
        end
    end
end

% return final grid potential sum
dp = sum(sum(grid));

end

