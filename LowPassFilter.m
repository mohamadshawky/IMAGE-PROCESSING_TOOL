function [ NI ] = LowPassFilter( I, D0, index )

%I=imread(I);


FI = FouierTransform(I);
[H W L]=size(I);


if(index == 1)
    Filter = CreatIdelFilter(D0,H,W); 
end
if(index == 2)
    Filter = GaussianFilter(D0,H,W); 
end
if(index == 3)
    Filter = butterworth_filter(D0,H,W,1); 
end
Filter = double(Filter);
FI = double(FI);

NFI=Filter .* FI;
NI=InverseFouierTransform(NFI);

[H W L] = size(NI);
NewMin = 0;
NewMax = 255;

Img = double(NI);
    
    for i = 1: L
        OldMin = min(min(Img(:, :, i)));
        OldMax = max(max(Img(:, :, i)));
        for j = 1: H
            for k = 1: W
                Img(j,k,i) = ( ( real((Img(j,k,i)) - OldMin) / (OldMax - OldMin) ) * ( NewMax - NewMin ) ) + NewMin;
            end
        end
    end

%disp(NNI);
%3shan at5ls mn el goz2 el imaginary 


NI = uint8(Img);

%figure,imshow(NI);

end

