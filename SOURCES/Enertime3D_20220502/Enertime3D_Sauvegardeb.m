 Fich=['../DessinsEtSauvegarde/FichiersSauvegarde3D_' num2str(N_T2)];
 NbC=size(ConcDomaine,4);
 %Premier tiers :
 %---------------
     Fich_ecrt=[Fich '_1']
     I_ecrt=1:floor(NbC/3);
     C_ecrt=ConcDomaine(:,:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     Deb_ecrt=Debit2016(I_ecrt);
     save(Fich_ecrt,'ConcDomaine','t_sauv')


if (N_T2==1)
     Fich='../DessinsEtSauvegarde/Domaine3D';
     save(Fich,'lon','lat','lon_','lat_','rmask', ...
          'rmask_','M_source','N_source')
end
     Fich='../DessinsEtSauvegarde/Vitesse';
 
 %Vitesse :
 %----------
     Fich_ecrt=[Fich '_1']
     save(Fich_ecrt,'Vit')
     

