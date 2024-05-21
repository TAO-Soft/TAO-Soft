Enertime_DiviseDomaine
h_=h;
for t=T1:dt:T2;
    v_N=(ubar2*(t-T1)+(T2-t)*ubar1)/(T2-T1);     v_N(:,N)=v_N(:,N-1);
    v_M=(vbar2*(t-T1)+(T2-t)*vbar1)/(T2-T1);     v_M(M,:)=v_M(M-1,:);
    h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);

    Enertime_AjoutSource
    ParcMarin_Transportb

    h_=h__;
end
index=index+1;
if (index >1)% 348)
%      ConcDomaine(:,:,index-700)=q(M_source-10:M_source+10....
%         ,N_source-10:N_source+10);
     %ConcDomaine(:,:,index-348)=q;
     ConcDomaine(:,:,index)=q;
end
Zeta_Verif=[Zeta_Verif;zeta2(M_source,N_source)];
Conc0(index)=q(M_source,N_source);
t_sauv(index)=t+N_T2*(T2_His-T1_His);

