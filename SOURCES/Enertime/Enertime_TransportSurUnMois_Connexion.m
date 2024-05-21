%% Fin du fichier His (si on boucle comme prévu)
ind_his=size(T_His,1);

% disp([(T0+T_His(ind_his))/3600....
%  Concentration/1000,Concentration0* Decroissance /1000]);

if Enertime_OnContinue
    ind_his,
    T1=T_His(ind_his);
    ubar1=squeeze(nc{Ubar}(ind_his,Imin:Imax,Jmin:Jmax));
    vbar1=squeeze(nc{Vbar}(ind_his,Imin:Imax,Jmin:Jmax));
    zeta1=squeeze(nc{Zeta}(ind_his,Imin:Imax,Jmin:Jmax));    

    T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
    ubar2=squeeze(nc{Ubar}(min(iT0Connexion),Imin:Imax,Jmin:Jmax));
    vbar2=squeeze(nc{Vbar}(min(iT0Connexion),Imin:Imax,Jmin:Jmax));
    zeta2=squeeze(nc{Zeta}(min(iT0Connexion),Imin:Imax,Jmin:Jmax));
    
%     ubar1=0.1*ones(size(ubar1));
%     vbar1=0*ones(size(vbar1));
%     zeta1=0*ones(size(zeta1));    
% 
%     T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
%     ubar2=0.1*ones(size(ubar1));
%     vbar2=0*ones(size(vbar1));
%     zeta2=0*ones(size(zeta1));    
%     h=10*ones(size(h));h_=h;

    Enertime_TransportSurUnPasDeTempsDuFichierHis

end 

