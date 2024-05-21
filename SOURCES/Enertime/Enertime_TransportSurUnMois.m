for ind_his=iT0Connexion:size(T_His)-1;
  if Enertime_OnContinue
    [ind_his,index,N_T2]

    T1=T_His(ind_his);
    ubar1=squeeze(nc{Ubar}(ind_his,Imin:Imax,Jmin:Jmax));
    vbar1=squeeze(nc{Vbar}(ind_his,Imin:Imax,Jmin:Jmax));
    zeta1=squeeze(nc{Zeta}(ind_his,Imin:Imax,Jmin:Jmax));    
    
    T2=T_His(ind_his+1);
    ubar2=squeeze(nc{Ubar}(ind_his+1,Imin:Imax,Jmin:Jmax));
    vbar2=squeeze(nc{Vbar}(ind_his+1,Imin:Imax,Jmin:Jmax));
    zeta2=squeeze(nc{Zeta}(ind_his+1,Imin:Imax,Jmin:Jmax));
    
%     ubar1=0.1*ones(size(ubar1));
%     vbar1=0*ones(size(vbar1));
%     zeta1=0*ones(size(zeta1));    
% 
%     T2=T_His(ind_his+1);
%     ubar2=0.1*ones(size(ubar1));
%     vbar2=0*ones(size(vbar1));
%     zeta2=0*ones(size(zeta1));    
%     h=10*ones(size(h));h_=h;
    Enertime_TransportSurUnPasDeTempsDuFichierHis
%    pcolor(lon_,lat_,q./rmask),colorbar, %caxis([25 35])
    
  end
end

% ParcMarin_Dessin
%   
% figure(8),clf
% pcolor(lon_,lat_,FlushingTime/3600/24./rmask(2:end-1,2:end-1)),shading interp, colorbar
% axis equal
% hold on
% plot(lon_(jj),lat_(jj),'*r')

