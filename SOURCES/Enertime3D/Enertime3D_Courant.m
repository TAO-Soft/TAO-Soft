
DeleersExtend_DefinitionNom

ParcMarin_InitialisationDomaine
Enertime3D_DefinitionSource
M=(M-1)*nx+1;N=(N-1)*nx+1;
% Conc_Domaine=5;
if (Relance==1)
    t_sauv=t_sauv(end);
end
    
N_T2=0;
%lon_=lon(2:end-1,2:end-1);lat_=lat(2:end-1,2:end-1);
Enertime_OnContinue=true;

Umax=0*ones(K,Imax-Imin+1,Jmax-Jmin+1);Vmax=Umax;
Enertime3D_DefinitionVariablesFichiersLecture
hh(87:88,184)=1;%rmCr(86:88,183:184)=1;
index=0;
while Enertime_OnContinue
  N_T2*(T2_His-T1_His)
  Enertime3D_CourantSurUnMois
  Enertime3D_SauvegardeCourant
  Enertime_OnContinue=false;
end
 save ../DessinsEtSauvegarde/FichiersSauvegarde3D ...
      t_sauv Ubar Vbar lon lat lon_ lat_ rmask rmask_ ...
      M_source N_source Debit2016

