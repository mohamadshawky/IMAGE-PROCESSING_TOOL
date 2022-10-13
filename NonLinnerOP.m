function [ x ] = NonLinnerOP( Vector,index )
%NONLINNEROP Summary of this function goes here
%   Detailed explanation goes here
if(index==1)
    x=Vector(1,5);
end
if(index==2)
    x=Vector(1,1);
end
if(index==3)
    x=Vector(1,3);
end
if(index==4)
    x=(Vector(1,5)+Vector(1,1))/2;
end


end

