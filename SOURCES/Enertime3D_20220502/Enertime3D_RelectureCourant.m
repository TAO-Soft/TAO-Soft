Dossier='../DessinsEtSauvegarde/';
N_T2=0;
%Fich=['../DessinsEtSauvegarde/Sauvegarde/FichiersSauvegarde3D_' num2str(N_T2)];
%Fich=['../DessinsEtSauvegarde/Sauvegarde/T2/FichiersSauvegarde3D_' num2str(N_T2)];
Fich=[Dossier 'FichiersSauvegardeCourant3D_' num2str(N_T2)];

 %Premier tiers :
 %---------------
     Fich_ecrt=[Fich '_1']
     load(Fich_ecrt)
     nb1_=0; nb2_=size(T_ecrt,2);I_lect=nb1_+1:nb2_;
     Umod(:,:,:,I_lect)=U_ecrt;
     Vmod(:,:,:,I_lect)=V_ecrt;
     UmodG(:,:,:,I_lect)=U_ecrtG;
     VmodG(:,:,:,I_lect)=V_ecrtG;
     t_sauv(1,I_lect)=T_ecrt;

 %2 ieme tiers :
 %---------------
     Fich_ecrt=[Fich '_2']
     load(Fich_ecrt)
     nb1_=nb2_; nb2_=nb1_+size(T_ecrt,2);I_lect=nb1_+1:nb2_;
     Umod(:,:,:,I_lect)=U_ecrt;
     Vmod(:,:,:,I_lect)=V_ecrt;
     UmodG(:,:,:,I_lect)=U_ecrtG;
     VmodG(:,:,:,I_lect)=V_ecrtG;
     t_sauv(1,I_lect)=T_ecrt;

 %3ieme tiers :
 %---------------
     Fich_ecrt=[Fich '_3']
     load(Fich_ecrt)
     nb1_=nb2_; nb2_=nb1_+size(T_ecrt,2);I_lect=nb1_+1:nb2_;
     Umod(:,:,:,I_lect)=U_ecrt;
     Vmod(:,:,:,I_lect)=V_ecrt;
     UmodG(:,:,:,I_lect)=U_ecrtG;
     VmodG(:,:,:,I_lect)=V_ecrtG;
     t_sauv(1,I_lect)=T_ecrt;

 Fich=[Dossier 'Domaine3D'];
 %Fich='Domaine3D';
 load(Fich)
K=3;
Rmask=rmask_;Rmask(Rmask==0)=NaN;
% load Vent.mat
% % TauY=interp1(t_sauv(3:3:end)',TauY,t_sauv);
% % TauX=interp1(t_sauv(3:3:end)',TauX,t_sauv);

