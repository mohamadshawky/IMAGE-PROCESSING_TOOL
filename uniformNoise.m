function [ nimage ] = uniformNoise( i,p,a,b )
[w,h,l2]=size(i);
nimage=i;
ns=(1/(b-a))*w*h*p;
ns=uint8(ns);
for k=1:l2
for u=a :b
for l=1 :ns
    x=randi(w,1,1);
    y=randi(h,1,1);
    nimage(x,y,k)=nimage(x,y,k)+u;
    if(nimage(x,y,k)>255)
       nimage(x,y,k)=255;
    end
end
end
end
