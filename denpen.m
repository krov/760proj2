function [ dp ] = denpen( gatePos, gridlen, r, FU )
% calculates density penalty of a given placement
% gatePos is (numGates x 3), (x coord, y coord, size)

grid = zeros(ceil(100/gridlen)+1);
A = (100*gridlen)^2;
cg = A / (101^2);

for i=1:size(gatePos,1)
    xc = gatePos(i,1);
    yc = gatePos(i,2);
    areaC = gatePos(i,3) * FU;
    xMin = max(ceil((xc - (r * gridlen)) / gridlen), 0) + 1;    % +1 because of index from 1
    xMax = min(floor((xc + (r * gridlen)) / gridlen), 100/gridlen) + 1;   % +1 because of index from 1
    yMin = max(ceil((yc - (r * gridlen)) / gridlen), 0) + 1;    % +1 because of index from 1
    yMax = min(floor((yc + (r * gridlen)) / gridlen), 100/gridlen) + 1;   % +1 because of index from 1
    % go through each grid point
    for x=xMin:xMax
        for y=yMin:yMax
            xg = x * gridlen;
            yg = y * gridlen;
            % TODO: what is p(xg - xc)??
            pGain = ((areaC/(r*r)*normpdf(xg,xc/gridlen,r/2)*normpdf(yg,yc/gridlen,r/2)) - cg)^2;
			%pGain = ((areaC/(r*r)*p(xg - xc)*p(yg - yc)) - cg)^2;
            grid(x,y) = grid(x,y) + pGain;
        end
    end
end

% return final grid potential sum
dp = sum(sum(grid));

end

