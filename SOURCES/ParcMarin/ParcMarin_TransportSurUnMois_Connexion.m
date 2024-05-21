%% Fin du fichier His (si on boucle comme prévu)
ind_his=size(T_His,1);

% disp([(T0+T_His(ind_his))/3600....
%  Concentration/1000,Concentration0* Decroissance /1000]);

if (t0==0)
    T1=T_His(ind_his);
    ubar1=squeeze(nc{'ubar'}(ind_his,:,:));
    vbar1=squeeze(nc{'vbar'}(ind_his,:,:));
    zeta1=squeeze(nc{'zeta'}(ind_his,:,:));    

    T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
    ubar2=squeeze(nc{'ubar'}(1,:,:));
    vbar2=squeeze(nc{'vbar'}(1,:,:));
    zeta2=squeeze(nc{'zeta'}(1,:,:));
    h_=h;

    for t=T1:dt:T2;
      if (t0==0)
        v_N=(ubar2*(t-T1)+(T2-t)*ubar1)/(T2-T1);     v_N(:,N)=v_N(:,N-1);
        v_M=(vbar2*(t-T1)+(T2-t)*vbar1)/(T2-T1);     v_M(M,:)=v_M(M-1,:);
        h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);

        ParcMarin_Transport

        h_=h__;

        q_=q(I0-dx0:I0+dx0,J0-dy0:J0+dy0);
        Concentration=sum(sum(q_));
        if (Concentration <= Concentration0 * Decroissance )
            disp(['   Temps de résidence : ' num2str(t/3600) ' heures'])
            t0=t;
        end
      end

    end
end 

