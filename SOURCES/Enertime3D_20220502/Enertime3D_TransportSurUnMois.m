% iT0Connexion=240;
% iT0Connexion=350;
% iT0Connexion=401;
T2=iT0Connexion;
u3D_=squeeze(nc{Ubar}(iT0Connexion(1),:,Imin:Imax,Jmin:Jmax-1));
v3D_=squeeze(nc{Vbar}(iT0Connexion(1),:,Imin:Imax-1,Jmin:Jmax));
zeta=squeeze(nc{Zeta}(iT0Connexion(1),Imin:Imax,Jmin:Jmax));
u3D_(u3D_>10)=0;
v3D_(v3D_>10)=0;
zeta(zeta>10)=0;

% u3D_=squeeze(nc{Ubar}(iT0Connexion(1),:,:,:));
% v3D_=squeeze(nc{Vbar}(iT0Connexion(1),:,:,:));
% zeta=squeeze(nc{Zeta}(iT0Connexion(1),:,:));
[kk,Iu,Ju]=size(u3D_);
[kk,Iv,Jv]=size(v3D_);
Enertime3D_ChgtRepereVertical
if(DiviseDomaine)
    Enertime3D_DiviseDomaine
else
    u3D_2=u3D(:,:,1:end-1);v3D_2=v3D(:,1:end-1,:);zeta2=zeta;
end

IndMax_His=size(T_His)-1;
if N_T2==N_Tmax,IndMax_His=100;end

q3D_=q3D;    
%for ind_his=iT0Connexion:size(T_His)-1;
for ind_his=iT0Connexion:IndMax_His;
  if Enertime_OnContinue
    if (mod(index,TpsEcrtEcran*8)==0)% 348)
        disp(['Heure : ',num2str(ind_his), ' ', num2str(index), ' ',num2str(N_T2)])
        disp(['Erreur : ', num2str(size(Erreur,1))])
        disp(' ')
        if(index)>=70
            disp('OK')
        end
    end

    T1=T_His(ind_his);
    u3D_1=u3D_2;
    v3D_1=v3D_2;
    zeta1=zeta2;    
    
    T2=T_His(ind_his+1);
    u3D_=squeeze(nc{Ubar}(ind_his+1,:,Imin:Imax,Jmin:Jmax-1));
    v3D_=squeeze(nc{Vbar}(ind_his+1,:,Imin:Imax-1,Jmin:Jmax));
    zeta=squeeze(nc{Zeta}(ind_his+1,Imin:Imax,Jmin:Jmax));
    u3D_(u3D_>10)=0;
    v3D_(v3D_>10)=0;
    zeta(zeta>10)=0;
    Enertime3D_ChgtRepereVertical
    if(DiviseDomaine)
        Enertime3D_DiviseDomaine
    else
        u3D_2=u3D(:,:,1:end-1);v3D_2=v3D(:,1:end-1,:);zeta2=zeta;
    end
    
    Enertime3D_TransportSurUnPasDeTempsDuFichierHis

    index=index+1;
%     if (index >1)% 348)
    NbSauv=1;
    if (mod(index,NbSauv)==0)% 348)
         ConcDomaine(:,:,:,index/NbSauv)=q3D;
         Conc0(index/NbSauv,:)=q3D(M_source(1),N_source(1),:);
         t_sauv(index/NbSauv)=t+N_T2*(T2_His-T1_His);
         Debit2016(index/NbSauv)=debit;
         Vit(index/NbSauv).u=u3D_1;
         Vit(index/NbSauv).v=v3D_1;
    end
    if (index==100)
       Enertime3D_Sauvegarde
    end
%     if (mod(index,500)==0)% 348)
%        Enertime3D_Sauvegarde
%     end
   
  end
end

% ParcMarin_Dessin
%   
% figure(8),clf
% pcolor(lon_,lat_,FlushingTime/3600/24./rmask(2:end-1,2:end-1)),shading interp, colorbar
% axis equal
% hold on
% plot(lon_(jj),lat_(jj),'*r')

