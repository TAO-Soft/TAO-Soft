function [C,dDepot] = StepTransport(u,Nu,C,dt,dx,schema);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

C_=NaN(size(C,1)+1,1);
Adv=0*C;Diff=0*C;

C_(2:end-1)=C(1:end-1);
C_(1)=0;C_(end)=C(end);
Adv = dt.*(u(1:end-1).*C_(1:end-1) - u(2:end).*C_(2:end));

dDepot=u(end).*C_(end)*dt;
C = C + Adv./(dx);
if size(find(C<0),1)>0
    disp('ouille')
end

end

