h_=h;
Zeta_Verif=[Zeta_Verif;zeta2(50,25)];

for t=T1:dt:T2;
    v_N=(ubar2*(t-T1)+(T2-t)*ubar1)/(T2-T1);     v_N(:,N)=v_N(:,N-1);
    v_M=(vbar2*(t-T1)+(T2-t)*vbar1)/(T2-T1);     v_M(M,:)=v_M(M-1,:);
    h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);

    ParcMarin_Transportb

    h_=h__;
    ii=find(q(2:end-1,2:end-1)<Concentration0 * Decroissance &...
            isnan(FlushingTime)==1);
    if ~isempty(ii)
      FlushingTime(ii)=N_T2*(T2_His-T1_His)+t;
    end
end

