for ind_his=ind_deb:size(T_His)-1;
  jj=find(q(2:end-1,2:end-1)>Concentration0 * Decroissance);
  if ~isempty(jj)
    ind_his,

    T1=T_His(ind_his);
    ubar1=squeeze(nc{'ubar'}(ind_his,:,:));
    vbar1=squeeze(nc{'vbar'}(ind_his,:,:));
    zeta1=squeeze(nc{'zeta'}(ind_his,:,:));    
    
    T2=T_His(ind_his+1);
    ubar2=squeeze(nc{'ubar'}(ind_his+1,:,:));
    vbar2=squeeze(nc{'vbar'}(ind_his+1,:,:));
    zeta2=squeeze(nc{'zeta'}(ind_his+1,:,:));
    
    ParcMarin_Flush_TransportSurUnPasDeTempsDuFichierHis
%   pcolor(q),colorbar, caxis([25 35])
    
  end
end

  ParcMarin_Dessin
  
   jj=find(q(2:end-1,2:end-1)>Concentration0 * Decroissance)
   figure(8),clf
   pcolor(lon_,lat_,FlushingTime/3600/24./rmask(2:end-1,2:end-1)),shading interp, colorbar
   axis equal
   hold on
   plot(lon_(jj),lat_(jj),'*r')

