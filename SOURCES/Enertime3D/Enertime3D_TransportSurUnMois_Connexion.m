%% Fin du fichier His (si on boucle comme prévu)
ind_his=size(T_His,1);

% disp([(T0+T_His(ind_his))/3600....
%  Concentration/1000,Concentration0* Decroissance /1000]);

if Enertime_OnContinue
    ind_his,
    T1=T_His(ind_his);
    u3D_1=u3D_2;
    v3D_1=v3D_2;
    zeta1=zeta2;    
    

    T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
    % u3D_=squeeze(nc{Ubar}(min(iT0Connexion),:,Imin:Imax,Jmin:Jmax-1));
    % v3D_=squeeze(nc{Vbar}(min(iT0Connexion),:,Imin:Imax-1,Jmin:Jmax));
    u3D_=squeeze(nc{Ubar}(min(iT0Connexion),:,Imin:Imax,Jmin:Jmax));
    v3D_=squeeze(nc{Vbar}(min(iT0Connexion),:,Imin:Imax,Jmin:Jmax));
    zeta=squeeze(nc{Zeta}(min(iT0Connexion),Imin:Imax,Jmin:Jmax));
    Enertime3D_ChgtRepereVertical
    if(DiviseDomaine)
        Enertime3D_DiviseDomaine
    else
        for k=1:K
            % u3D_2=u3D(k,:,1:end-1);v3D_2=v3D(k,1:end-1,:);zeta2=zeta;
            u3D_2=u3D(k,:,1:end);v3D_2=v3D(k,1:end,:);zeta2=zeta;
        end
    end
    
%     ubar1=0.1*ones(size(ubar1));
%     vbar1=0*ones(size(vbar1));
%     zeta1=0*ones(size(zeta1));    
% 
%     T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
%     ubar2=0.1*ones(size(ubar1));
%     vbar2=0*ones(size(vbar1));
%     zeta2=0*ones(size(zeta1));    
%     h=10*ones(size(h));h_=h;

    Enertime3D_TransportSurUnPasDeTempsDuFichierHis
    index=index+1;
    if (mod(index,3)==0)% 348)
         ConcDomaine(:,:,:,index/3)=q3D;
         Conc0(index/3,:)=q3D(M_source(1),N_source(1),:);
         t_sauv(index/3)=t+N_T2*(T2_His-T1_His);
    end

end 

