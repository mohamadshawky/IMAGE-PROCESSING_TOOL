function [ I ] = InverseFouierTransform( Image )
L=256;
exp_I = uint8((exp(double(Image)) .^ (log(L) / (L-1))) - 1);
I=exp_I;
end

