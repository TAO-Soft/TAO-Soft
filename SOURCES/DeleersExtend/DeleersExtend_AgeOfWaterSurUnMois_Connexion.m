%% Fin du fichier His (si on boucle comme prévu)
ind_his=size(T_His,1);

% disp([(T0+T_His(ind_his))/3600....
%  Concentration/1000,Concentration0* Decroissance /1000]);

if (DeleersExtend_OnContinue)
    T1=T_His(ind_his);
    ubar1=squeeze(nc{'ubar'}(ind_his,:,:));
    vbar1=squeeze(nc{'vbar'}(ind_his,:,:));
    zeta1=squeeze(nc{'zeta'}(ind_his,:,:));    

    T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
    ubar2=squeeze(nc{'ubar'}(1,:,:));
    vbar2=squeeze(nc{'vbar'}(1,:,:));
    zeta2=squeeze(nc{'zeta'}(1,:,:));
    h_=h;

    DeleersExtend_AgeOfWaterSurUnPasDeTempsDuFichierHis
end 

