function [ NI ] = GetNoise( IM )
%GETNOISE Summary of this function goes here
%   Detailed explanation goes here
%IM= imread(IM);

NI = imnoise(IM);

end

