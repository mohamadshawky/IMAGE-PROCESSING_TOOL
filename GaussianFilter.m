function [ Filter ] = GaussianFilter( D0, H, W )

Filter = zeros(H, W);
count_H = round(H / 2);
count_W = round(W / 2);
for i = 1 : H
    for j = 1 : W
        X = power((i - count_H), 2);
        Y = power((j - count_W), 2);
        Dist = sqrt(X + Y);
        M=power((Dist*Dist),2);
        K=2*(power(D0,2));
        Filter(i,j)=exp(-(M/K));
        if Dist <= D0
            Filter(i, j) = 1;
        end
    end
end

end

