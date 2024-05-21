ConcTot=sum(q3D,3);

Maille1dV=find(ConcTot>ConcMin);
for ii =Maille1dV';
    [iMaille1dV,jMaille1dV]=ind2sub(size(h),ii);
%     if(iMaille1dV==31 & jMaille1dV==99)
%         disp('Cest la bonne')
%     end
      dZ1dV=squeeze(dZZ(iMaille1dV,jMaille1dV,:));
        kk=max(find(dZ1dV~=0));dZ1dV=dZ1dV(1:kk);
      q1DV=squeeze(q3D(iMaille1dV,jMaille1dV,1:kk));
      L=h(ii);
      Wch_=Wch(1:kk+1);
      [q1DV,dDepot]=StepTransportAdv(Wch_,Nu,q1DV,dt1dV,dZ1dV,'UpWind'); 
%       dDepot=max(0,q1DV(end)*Wch(end)*dt);
%       q1DV(end)=max((q1DV(end)*dZ1dV(end)-dDepot)/dZ1dV(end),0);
      Depot(iMaille1dV,jMaille1dV)=Depot(iMaille1dV,jMaille1dV)+dDepot;
      q3D(iMaille1dV,jMaille1dV,1:kk)=q1DV;
end

for k=1:K;
    q=q3D(:,:,k);
    q(ConcTot<ConcMin)=0;
    q3D(:,:,k)=q;
    q3D_=q3D;
end
          
          
      
  