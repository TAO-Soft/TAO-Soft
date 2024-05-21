close all
clear all

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
DeleersExtend_DefinitionNom
dt =10;
Decroissance=(1-1/exp(1));

ParcMarin_InitialisationDomaine
q=30*ones(M,N).*rmask;Concentration0=q(2:end-1,2:end-1);
q_lim1_N=ones(M,1)*0;
q_lim2_N=ones(M,1)*0;
q_lim1_M=ones(1,N)*0;
q_lim2_M=ones(1,N)*0;

      
N_T2=0;
FlushingTime=NaN*zeros(M-2,N-2);
lon_=lon(2:end-1,2:end-1);lat_=lat(2:end-1,2:end-1);

Zeta_Verif=0;

jj=1;ind_deb=iT0Connexion
while ~isempty(jj)
  disp('Nouvelle Lecture : ')
  N_T2*(T2_His-T1_His)
  ParcMarin_Flush_TransportSurUnMois

  disp('     Connection avant nouvelle Relecture')
  ParcMarin_Flush_TransportSurUnMois_Connexion

  ParcMarin_Dessin
  N_T2=N_T2+1;
end
