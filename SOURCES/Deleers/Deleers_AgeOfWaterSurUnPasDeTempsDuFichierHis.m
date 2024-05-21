for t=T1:dt:T2;
    v_N=(ubar2*(t-T1)+(T2-t)*ubar1)/(T2-T1);     v_N(:,N)=v_N(:,N-1);
    v_M=(vbar2*(t-T1)+(T2-t)*vbar1)/(T2-T1);     v_M(M,:)=v_M(M-1,:);
    h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);

    Deleers_EquationTransport

    h_=h__;

end

% AgeMoy(index)=nanmean(nanmean(h(Lagon==1).*age(Lagon==1)))/...
%               nanmean(nanmean(h(Lagon==1)));
% AgeMoy(index)=nanmean(nanmean(age(Lagon==1))); 
AgeMoy(index)=nansum(nansum(h(Lagon==1).*age(Lagon==1)))/...
              nansum(nansum(h(Lagon==1))); 
% Concentration(index)=nanmean(nanmean(h(Lagon==0).*q(Lagon==1)))/... 
%               nanmean(nanmean(h(Lagon==1))); 
Concentration(index)=nansum(nansum(h(Lagon==1).*q(Lagon==1)))/... 
              nansum(nansum(h(Lagon==1))); 
Deleers_OnContinue=(max(max(abs(q(Lagon==1)-Concentration0))) ...
                     /Concentration0...
                               > Decroissance);     
index=index+1;

