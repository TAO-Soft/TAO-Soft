 
 Ndivision = 5;
 [a,b]=mkdir('../DessinsEtSauvegarde/Vitesses');
 
 NbC=size(ConcDomaine,4);

%% Domaine
Fich='../DessinsEtSauvegarde/Vitesses/Domaine3D';
save(Fich,'lon','lat','lon_','lat_',...
      'Rmask_','M_source','N_source','Conc_Source','Ndivision')

%% Vitesses
clear C_ecrt
Fich='../DessinsEtSauvegarde/Vitesses/Vitesse';
iDebut=1;

for ii=1:2*Ndivision
     Fich_ecrt=[Fich num2str(ii)]
     iFin=min(iDebut+ceil(NbC/(2*Ndivision))-1,size(t_sauv,2));
     I_ecrt=iDebut:iFin;
     Deb_ecrt=Debit2016(I_ecrt);
     C_ecrt=Vit(:,I_ecrt);
     save(Fich_ecrt,'C_ecrt')
     iDebut=iFin + 1;
     disp(num2str(I_ecrt(1:3)))
     disp(num2str(I_ecrt(end-3:end)))
end

%% Concentration dans le Milieu
Fich=['../DessinsEtSauvegarde/FichiersSauvegarde3D_' num2str(N_T2)];
 
 iDebut=1;
 
 for ii=1:Ndivision
     Fich_ecrt=[Fich num2str(ii)]
     iFin=min(iDebut+ceil(NbC/Ndivision)-1,size(t_sauv,2));
     I_ecrt=iDebut:iFin;
     C_ecrt=ConcDomaine(:,:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     Deb_ecrt=Debit2016(I_ecrt);
     save(Fich_ecrt,'T_ecrt','C_ecrt','Deb_ecrt','Wch')
     iDebut=iFin + 1;
     disp(num2str(T_ecrt(1:3)/3600/3))
     disp(num2str(T_ecrt(end-3:end)/3600/3))
 end

%% Dépot
if (MES)
    FichMES=['../DessinsEtSauvegarde/Depot_' num2str(N_T2)];
     iDebut=1;

 for ii=1:Ndivision
     Fich_ecrt=[FichMES num2str(ii)]
     iFin=min(iDebut+ceil(NbC/Ndivision)-1,size(t_sauv,2));
     I_ecrt=iDebut:iFin;
     C_ecrt=DepotDomaine(:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     Deb_ecrt=Debit2016(I_ecrt);
     save(Fich_ecrt,'T_ecrt','C_ecrt','Deb_ecrt','Wch')
     iDebut=iFin + 1;
     disp(num2str(T_ecrt(1:3)/3600/3))
     disp(num2str(T_ecrt(end-3:end)/3600/3))
 end
    save(FichMES,'DepotDomaine','Wch')
end

