% %Dossier='../DessinsEtSauvegarde/';
%Dossier='../DessinsEtSauvegarde/EColi/';
% Dossier='../DessinsEtSauvegarde/Sauvegarde/T90=48h/';
%N_T2=2;
% %Fich=['../DessinsEtSauvegarde/Sauvegarde/FichiersSauvegarde3D_' num2str(N_T2)];
% %Fich=['../DessinsEtSauvegarde/Sauvegarde/T2/FichiersSauvegarde3D_' num2str(N_T2)];
Fich=[Dossier 'Vitesse'];
Ndivision = 6;
iDebut=1;
nb2_=0; 
clear ConcDomaine
 for ii=1:Ndivision
     nb1_=nb2_+1;
     Fich_ecrt=[Fich num2str(ii)];disp(['Lecture : ' Fich_ecrt])
     load(Fich_ecrt)
     nb2_=size(C_ecrt,2)+nb1_-1;I_lect=nb1_:nb2_;
     for it=nb1_:nb2_;
         VitesseU(:,:,:,it)=squeeze(C_ecrt(it-nb1_+1).u);
         VitesseV(:,:,:,it)=squeeze(C_ecrt(it-nb1_+1).v);
     end
%      disp(num2str(t_sauv(I_lect(1:3))/3600/3))
%      disp(num2str(t_sauv(I_lect(end-3:end))/3600/3))
%      disp([num2str(size(T_ecrt)) ' ' num2str(size(t_sauv))])
 end
disp(' ')
% 
%  %Premier tiers :
%  %---------------
%      Fich_ecrt=[Fich '_1']
%      load(Fich_ecrt)
%      C_ecrt=Vit;
%      nb1_=0; nb2_=size(C_ecrt,2);I_lect=nb1_+1:nb2_;
%      for it=nb1_+1:nb2_;
%          VitesseU(:,:,it)=squeeze(C_ecrt(it).u);
%          VitesseV(:,:,it)=squeeze(C_ecrt(it).v);
%      end
% 
%  %2 ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_2']
%      load(Fich_ecrt)
%      nb1_=nb2_; nb2_=nb1_+size(C_ecrt,2);I_lect=nb1_+1:nb2_;
%      for it=nb1_+1:nb2_;
%          VitesseU(:,:,it)=squeeze(C_ecrt(it-nb1_).u);
%          VitesseV(:,:,it)=squeeze(C_ecrt(it-nb1_).v);
%      end
% 
%  %3ieme tiers :
%  %---------------
%      Fich_ecrt=[Fich '_3']
%      load(Fich_ecrt)
%      nb1_=nb2_; nb2_=nb1_+size(C_ecrt,2);I_lect=nb1_+1:nb2_;
%      for it=nb1_+1:nb2_;
%          VitesseU(:,:,it)=squeeze(C_ecrt(it-nb1_).u);
%          VitesseV(:,:,it)=squeeze(C_ecrt(it-nb1_).v);
%      end
% 
%  Fich=[Dossier 'Domaine3D'];
% %Fich='Domaine3D';
%  load(Fich)
% K=3;
% Rmask=rmask_;Rmask(Rmask==0)=NaN;
% 
% 
% % load Vent.mat
% % % TauY=interp1(t_sauv(3:3:end)',TauY,t_sauv);
% % % TauX=interp1(t_sauv(3:3:end)',TauX,t_sauv);
% 
