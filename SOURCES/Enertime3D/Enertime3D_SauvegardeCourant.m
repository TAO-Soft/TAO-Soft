 Fich=['../DessinsEtSauvegarde/FichiersSauvegardeCourant3D_' num2str(N_T2)];
 NbC=size(Umod,4);
 %Premier tiers :
 %---------------
     Fich_ecrt=[Fich '_1']
     I_ecrt=1:floor(NbC/3);
     U_ecrt=Umod(:,:,:,I_ecrt);
     V_ecrt=Vmod(:,:,:,I_ecrt);
     U_ecrtG=UmodG(:,:,:,I_ecrt);
     V_ecrtG=VmodG(:,:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     save(Fich_ecrt,'T_ecrt','U_ecrt','V_ecrt','U_ecrtG','V_ecrtG')
 %2 ieme tiers :
 %---------------
     Fich_ecrt=[Fich '_2']
     I_ecrt=floor(NbC/3)+1:floor(2*NbC/3);
     U_ecrt=Umod(:,:,:,I_ecrt);
     V_ecrt=Vmod(:,:,:,I_ecrt);
     Y_ecrt=UmodG(:,:,:,I_ecrt);
     V_ecrt=VmodG(:,:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     save(Fich_ecrt,'T_ecrt','U_ecrt','V_ecrt','U_ecrtG','V_ecrtG')
 %3ieme tiers :
 %---------------
     Fich_ecrt=[Fich '_3']
     I_ecrt=floor(2*NbC/3)+1:NbC;
     U_ecrt=Umod(:,:,:,I_ecrt);
     V_ecrt=Vmod(:,:,:,I_ecrt);
     U_ecrtG=UmodG(:,:,:,I_ecrt);
     V_ecrtG=VmodG(:,:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     save(Fich_ecrt,'T_ecrt','U_ecrt','V_ecrt','U_ecrtG','V_ecrtG')

if (N_T2==1)
     Fich='../DessinsEtSauvegarde/Domaine3D';
     save(Fich,'lon','lat','lon_','lat_','rmask','hh',...
          'rmask_','M_source','N_source')
end
    

