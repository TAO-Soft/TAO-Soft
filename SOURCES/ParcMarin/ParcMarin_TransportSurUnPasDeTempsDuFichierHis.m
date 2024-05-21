
for t=T1:dt:T2;
   if (DeleersExtend_OnContinue)
        v_N=(ubar2*(t-T1)+(T2-t)*ubar1)/(T2-T1);     v_N(:,N)=v_N(:,N-1);
        v_M=(vbar2*(t-T1)+(T2-t)*vbar1)/(T2-T1);     v_M(M,:)=v_M(M-1,:);
        h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);

        ParcMarin_Transport

        h_=h__;

%         AgeMoy(index)=sum(sum(age)); 
%         d_AgeMoy=abs(AgeMoy(index)-AgeMoy(index-1));

        Concentration(index)=sum(sum(q)); 
        d_Concentration=abs(Concentration(index) - Concentration(index-1))
         DeleersExtend_OnContinue=(d_Concentration > eps);     
       
        if (~DeleersExtend_OnContinue)
            disp(['   Temps de convergence : ' num2str(t/3600) ' heures'])
            t0=t;
        end

        index=index+1;
   end
  end

