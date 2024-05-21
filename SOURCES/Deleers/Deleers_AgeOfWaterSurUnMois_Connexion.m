%% Fin du fichier His (si on boucle comme prévu)
ind_his=N2_His;
    if (MultiFichier)
            %Hisname=[DossierResultats 'his_GG96_' num2str(indFich) '.nc'];
            Hisname=Nom(1,:);
            ParcMarin_InitialisationTemps
            N1_His_=max(N1_His,1);            
    end

% disp([(T0+T_His(ind_his))/3600....
%  Concentration/1000,Concentration0* Decroissance /1000]);

if (DeleersExtend_OnContinue)
    T1=T_His(ind_his)+T0;
    ubar1=squeeze(nc{'ubar'}(ind_his,:,:));
    vbar1=squeeze(nc{'vbar'}(ind_his,:,:));
    zeta1=squeeze(nc{'zeta'}(ind_his,:,:));    

   T2=T0+T_His(ind_his)+(T2_His-T1_His)/(N2_His-N1_His);
           [T1 T2 T0]/3600

   %  T2=T_His(ind_his)+(T2_His-T1_His)/(N2_His);
    ubar2=squeeze(nc{'ubar'}(N1_His_,:,:));
    vbar2=squeeze(nc{'vbar'}(N1_His_,:,:));
    zeta2=squeeze(nc{'zeta'}(N1_His_,:,:));
    h_=h;

    DeleersExtend_AgeOfWaterSurUnPasDeTempsDuFichierHis
end 

