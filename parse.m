function [ FU, numGates, numNets, gatePos, gateCon, pins ] = parse( filename )
% read input file
% FU is float: fundamental unit
% gatePos is (numGates x 3), (x coord, y coord, size)
% gateCon is (numNets x numGates), 1 in col if connected to gate
% pins is (numPins x 3), (net connected to, x coord, y coord)

fid = fopen(filename);

tline = fgets(fid);
% get initial parameters
str_list = strsplit(tline);
FU = str2double(str_list{3});
% get # of gates and nets
tline = fgets(fid);
str_list = strsplit(tline);
numGates = str2double(str_list{1});
numNets = str2double(str_list{2});
gatePos = zeros(numGates, 3);
gateCon = zeros(numNets, numGates);
for i=1:numGates
    tline = fgets(fid);
    str_list = strsplit(tline);
    numCon = str2double(str_list{2});
    gatePos(i,3) = numCon;
    for j=1:numCon
        gateCon(str2double(str_list{2+j}), i) = 1;
    end
end
% get pin info
tline = fgets(fid);
str_list = strsplit(tline);
numPins = str2double(str_list{1});
pins = zeros(numPins, 3);
for i=1:numPins
    tline = fgets(fid);
    str_list = strsplit(tline);
    pins(i,1) = str2double(str_list{2});
    pins(i,2) = str2double(str_list{3});
    pins(i,3) = str2double(str_list{4});
end

fclose(fid);


end

