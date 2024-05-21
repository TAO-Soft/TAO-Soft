 Fich=['../DessinsEtSauvegarde/FichiersSauvegarde3D_' num2str(N_T2)];
 NbC=size(ConcDomaine,4);
 
 Ndivision = 4;
 iDebut=1;
 
 for ii=1:Ndivision
     Fich_ecrt=[Fich num2str(ii)]
     iFin=min(iDebut+ceil(NbC/Ndivision)-1,size(t_sauv,2));
     I_ecrt=iDebut:iFin;
     C_ecrt=ConcDomaine(:,:,:,I_ecrt);
     T_ecrt=t_sauv(I_ecrt);
     Deb_ecrt=Debit2016(I_ecrt);
     save(Fich_ecrt,'T_ecrt','C_ecrt','Deb_ecrt')
     iDebut=iFin + 1;
     disp(num2str(T_ecrt(1:3)/3600/3))
     disp(num2str(T_ecrt(end-3:end)/3600/3))
 end

%  %Premier tiers :
%  %---------------
%      Fich_ecrt=[Fich '_1']
%      I_ecrt=1:floor(NbC/3);
%      C_ecrt=ConcDomaine(:,:,:,I_ecrt);
%      T_ecrt=t_sauv(I_ecrt);
%      Deb_ecrt=Debit2016(I_ecrt);
%      save(Fich_ecrt,'T_ecrt','C_ecrt','Deb_ecrt')
%  %2 ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_2']
%      I_ecrt=floor(NbC/3)+1:floor(2*NbC/3);
%      C_ecrt=ConcDomaine(:,:,:,I_ecrt);
%      T_ecrt=t_sauv(I_ecrt);
%      Deb_ecrt=Debit2016(I_ecrt);
%      save(Fich_ecrt,'T_ecrt','C_ecrt','Deb_ecrt')
%  %3ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_3']
%      I_ecrt=floor(2*NbC/3)+1:NbC;
%      C_ecrt=ConcDomaine(:,:,:,I_ecrt);
%      T_ecrt=t_sauv(I_ecrt);
%      Deb_ecrt=Debit2016(I_ecrt);
%      save(Fich_ecrt,'T_ecrt','C_ecrt','Deb_ecrt')

if (N_T2==1)
     Fich='../DessinsEtSauvegarde/Domaine3D';
     save(Fich,'lon','lat','lon_','lat_','rmask', ...
          'rmask_','M_source','N_source')
end

clear C_ecrt
Fich='../DessinsEtSauvegarde/Vitesse';
 Ndivision = 6;
 iDebut=1;
 
 for ii=1:Ndivision
     Fich_ecrt=[Fich num2str(ii)]
     iFin=min(iDebut+ceil(NbC/Ndivision)-1,size(t_sauv,2));
     I_ecrt=iDebut:iFin;
     Deb_ecrt=Debit2016(I_ecrt);
     C_ecrt=Vit(:,I_ecrt);
     save(Fich_ecrt,'C_ecrt')
     iDebut=iFin + 1;
     disp(num2str(I_ecrt(1:3)))
     disp(num2str(I_ecrt(end-3:end)))
 end
 
%  %Premier tiers :
%  %---------------
%      Fich_ecrt=[Fich '_1']
%      I_ecrt=1:floor(NbC/3);
%      C_ecrt=Vit(:,I_ecrt);
%      save(Fich_ecrt,'C_ecrt')
%      
%  %2 ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_2']
%      I_ecrt=floor(NbC/3)+1:floor(2*NbC/3);
%      C_ecrt=Vit(:,I_ecrt);
%      save(Fich_ecrt,'C_ecrt')
% 
%      %3ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_3']
%      I_ecrt=floor(2*NbC/3)+1:NbC;
%      C_ecrt=Vit(:,I_ecrt);
%      save(Fich_ecrt,'C_ecrt')
%     
% 
