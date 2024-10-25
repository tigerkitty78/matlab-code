

function [dataSig] = GetData(length)
angles = 2 * pi * (1:length)/length;

dataSig = cos(angles);
end