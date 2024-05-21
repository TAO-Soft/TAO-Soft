clear AgeMoy AgeTotMoy Concentration Qtot AgeTot

T2=0;T1=0;N_T2=0;
t0=0;
index=2; 
DeleersExtend_OnContinue=true;
Concentration(1,:)=0*ones(1,N_Milieu);
AgeMoy(1,:)=0*ones(1,N_Milieu);
AgeTotMoy(1,:)=0;

while (DeleersExtend_OnContinue && index <= IndexMax && N_T2 <= N_T2Max)
  T0=(N_T2*((T2_His-T1_His)/(N2_His-N1_His)*(N2_His-N1_His+1)))-T1_His;
  T0=0;
 % T0=(N_T2*(T2_His-T1_His))-T1_His;
  disp(['   Temps : ' num2str((T0+T1_His)/3600/24)])

  DeleersExtend_AgeOfWaterSurUnMois
  if (DeleersExtend_OnContinue)
      disp('     Connection avant nouvelle Relecture')
      Deleers_AgeOfWaterSurUnMois_Connexion
      QtotVerif_OnContinue
      disp('Nouvelle Lecture : ')
  end
  DeleersExtend_Dessin
  N_T2=N_T2+1;
  FichSauvegarde=['Fich_' num2str(N_T2)]
end
index

