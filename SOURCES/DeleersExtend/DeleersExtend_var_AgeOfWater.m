clear AgeMoy AgeTotMoy Concentration Qtot AgeTot

T2=0;T1=0;N_T2=0;
t0=0;T0=0;
index=1; 
DeleersExtend_OnContinue=true;
Concentration(1,:)=0*ones(1,N_Milieu);
AgeMoy(1,:)=0*ones(1,N_Milieu);
AgeTotMoy(1,:)=0;
PremierFichier=true;

for N_T=1:Nb_fich;
  Hisname=Nom(N_T,:);nc=netcdf(Hisname);
  DeleersExtend_var_InitialisationTemps
  if (FichierOK)
      disp(T_His(N1_His)/3600/24)
      disp(T_His(N2_His)/3600/24)
      DeleersExtend_AgeOfWaterSurUnMois
%       if (DeleersExtend_OnContinue)
%           disp('     Connection avant nouvelle Relecture')
%           Deleers_AgeOfWaterSurUnMois_Connexion
%           QtotVerif_OnContinue
%           disp('Nouvelle Lecture : ')
%       end
      DeleersExtend_Dessin
  end
  close(nc)
end
index

