
%close all
%clear all

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
DeleersExtend_DefinitionNom
dt =10;
Decroissance=(1-1/exp(1));
Decroissance=75/100;
%Decroissance=0.25;

ParcMarin_InitialisationDomaine
Enertime_DefinitionSource
Zeta_Verif=0;
M=(M-1)*nx+1;N=(N-1)*nx+1;
% Conc_Domaine=5;
if (Relance==0)
    q=ones(M,N)*Conc_Domaine;%.*rmask;
    clear ConcDomaine 
else
    q=ConcDomaine(:,:,end);%.*rmask;
    clear ConcDomaine 
    t_sauv=t_sauv(end);
end
    Concentration0=q(2:end-1,2:end-1);
q_lim1_N=ones(M,1)*Conc_Domaine;
q_lim2_N=ones(M,1)*Conc_Domaine;
q_lim1_M=ones(1,N)*Conc_Domaine;
q_lim2_M=ones(1,N)*Conc_Domaine;
    
    
N_T2=0;
%lon_=lon(2:end-1,2:end-1);lat_=lat(2:end-1,2:end-1);
Enertime_OnContinue=true;

Enertime_DefinitionVariablesFichiersLecture
index=0;
while Enertime_OnContinue
  N_T2*(T2_His-T1_His)
  Enertime_TransportSurUnMois
  Enertime_TransportSurUnMois_Connexion
  % Enertime_Dessin
  N_T2=N_T2+1;
  if (N_T2>15)
    Enertime_OnContinue=false;
  end
  if (N_T2<=15)
    index=0;
  end
 Fich=['../DessinsEtSauvegarde/FichiersSauvegardeCourt' num2str(N_T2)];
 save(Fich,'t_sauv','ConcDomaine','lon','lat','lon_','lat_','rmask', ...
      'rmask_','M_source','N_source')
end
 save ../DessinsEtSauvegarde/FichiersSauvegardeCourt ...
      t_sauv ConcDomaine lon lat lon_ lat_ rmask rmask_ ...
      M_source N_source
  Enertime_Dessin
