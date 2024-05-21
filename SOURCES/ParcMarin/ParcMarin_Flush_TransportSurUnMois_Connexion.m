%% Fin du fichier His (si on boucle comme prévu)
ind_his=size(T_His,1);

% disp([(T0+T_His(ind_his))/3600....
%  Concentration/1000,Concentration0* Decroissance /1000]);

jj=find(q(2:end-1,2:end-1)>Concentration0 * Decroissance);
if ~isempty(jj)
    ind_his,
    T1=T_His(ind_his);
    ubar1=squeeze(nc{'ubar'}(ind_his,:,:));
    vbar1=squeeze(nc{'vbar'}(ind_his,:,:));
    zeta1=squeeze(nc{'zeta'}(ind_his,:,:));    

    T2=T_His(ind_his)+(T2_His-T1_His)/(size(T_His,1)-1);
    ubar2=squeeze(nc{'ubar'}(iT0Connexion,:,:));
    vbar2=squeeze(nc{'vbar'}(iT0Connexion,:,:));
    zeta2=squeeze(nc{'zeta'}(iT0Connexion,:,:));

    ParcMarin_Flush_TransportSurUnPasDeTempsDuFichierHis

end 

