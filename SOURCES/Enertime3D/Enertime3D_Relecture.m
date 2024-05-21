%Dossier='../DessinsEtSauvegarde/';
%Dossier='../DessinsEtSauvegarde/EColi/';
% Dossier='../DessinsEtSauvegarde/Sauvegarde/T90=48h/';
%N_T2=2;
% %Fich=['../DessinsEtSauvegarde/Sauvegarde/FichiersSauvegarde3D_' num2str(N_T2)];
% %Fich=['../DessinsEtSauvegarde/Sauvegarde/T2/FichiersSauvegarde3D_' num2str(N_T2)];
%Ndivision = 6;
 Fich=[DossierDomaine 'Domaine3D'];
 %Fich='Domaine3D';
 load(Fich)

Fich=[Dossier 'FichiersSauvegarde3D_' num2str(N_T2)];
iDebut=1;
nb2_=0; 
clear ConcDomaine
 for ii=1:Ndivision
     nb1_=nb2_+1;
     Fich_ecrt=[Fich num2str(ii)];disp(['Lecture : ' Fich_ecrt])
     load(Fich_ecrt)
     nb2_=size(T_ecrt,2)+nb1_-1;I_lect=nb1_:nb2_;
     ConcDomaine(:,:,:,I_lect)=C_ecrt;
     t_sauv(1,I_lect)=T_ecrt;
     Debit2016(1,I_lect)=Deb_ecrt;
     disp(['Indices  : ' ...
         '*** Debut de Fichier : ' num2str(t_sauv(I_lect(1:3))/3600/3) ...
         ' *** Fin de Fichier : ' num2str(t_sauv(I_lect(end-3:end))/3600/3) ...
         ' ***'])
     disp(['Pas de temps Début : ' num2str(size(T_ecrt)) ...
         ' *** Fin : ' num2str(size(t_sauv)) ' ***'])
     disp('  ')
end

%% Depot
if exist('_Depot0.03.mat','file')
    load('Depot0.03.mat')
else
    Ndivision = 23;

    Fich=[Dossier 'Depot_' num2str(N_T2)];
    clear DepotDomaine
     for ii=1:Ndivision
         nb1_=nb2_+1;
         Fich_ecrt=[Fich num2str(ii)];disp(['Lecture : ' Fich_ecrt])
         load(Fich_ecrt)
         nb2_=size(T_ecrt,2)+nb1_-1;I_lect=nb1_:nb2_;
         DepotDomaine(:,:,I_lect)=C_ecrt;
         t_sauv(1,I_lect)=T_ecrt;
         Debit2016(1,I_lect)=Deb_ecrt;
         disp(['Indices  : ' ...
             '*** Debut de Fichier : ' num2str(t_sauv(I_lect(1:3))/3600/3) ...
             ' *** Fin de Fichier : ' num2str(t_sauv(I_lect(end-3:end))/3600/3) ...
             ' ***'])
         disp(['Pas de temps Début : ' num2str(size(T_ecrt)) ...
             ' *** Fin : ' num2str(size(t_sauv)) ' ***'])
         disp('  ')
     end
end

%  %Premier tiers :
%  %---------------
%      Fich_ecrt=[Fich '_1']
%      load(Fich_ecrt)
%      nb1_=0; nb2_=size(T_ecrt,2);I_lect=nb1_+1:nb2_;
%      ConcDomaine(:,:,:,I_lect)=C_ecrt;
%      t_sauv(1,I_lect)=T_ecrt;
%      Debit2016(1,I_lect)=Deb_ecrt;
% 
%  %2 ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_2']
%      load(Fich_ecrt)
%      nb1_=nb2_; nb2_=nb1_+size(T_ecrt,2);I_lect=nb1_+1:nb2_;
%      ConcDomaine(:,:,:,I_lect)=C_ecrt;
%      t_sauv(1,I_lect)=T_ecrt;
%      Debit2016(1,I_lect)=Deb_ecrt;
% 
%  %3ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_3']
%      load(Fich_ecrt)
%      nb1_=nb2_; nb2_=nb1_+size(T_ecrt,2);I_lect=nb1_+1:nb2_;
%      ConcDomaine(:,:,:,I_lect)=C_ecrt;
%      t_sauv(1,I_lect)=T_ecrt;
%      Debit2016(1,I_lect)=Deb_ecrt;

K=size(ConcDomaine,3);

Fich=[DossierDomaine 'Domaine3D'];
rmask=Rmask;rmask_=Rmask_;
Rmask=Rmask_(:,:,1);Rmask(Rmask==0)=NaN;

Rmask=rmask_(:,:,1);rmask(rmask==0)=NaN;
t_sauv=mod(t_sauv/24/3600,365.6);

% load Vent.mat
% % TauY=interp1(t_sauv(3:3:end)',TauY,t_sauv);
% % TauX=interp1(t_sauv(3:3:end)',TauX,t_sauv);

