T2=0;T1=0;N_T2=0;
t0=0;
index=2; 
Deleers_OnContinue=true;
Concentration(1)=0;AgeMoy(1)=0;

while (Deleers_OnContinue && index <= IndexMax)
  T0=(N_T2*((T2_His-T1_His)/(size(T_His,1)-1)*size(T_His,1))-T1_His);
  disp(['   Temps : ' num2str((T0+T1_His)/3600)])

  Deleers_AgeOfWaterSurUnMois
  if (Deleers_OnContinue)
      disp('     Connection avant nouvelle Relecture')
      Deleers_AgeOfWaterSurUnMois_Connexion
      disp('Nouvelle Lecture : ')
  end
  Deleers_Dessin
  N_T2=N_T2+1;
end
index

