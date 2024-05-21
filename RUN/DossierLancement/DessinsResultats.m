nc=netcdf('../FichiersSource/hisApresUsine_Old.00000.nc');
Zeta=nc{'ubar'}(:,:,:);
close(nc)
Lagon_RepereLagon
LonLat=load('PositionMouillages');
LonSource=LonLat(:,1);
LatSource=LonLat(:,2);
Lon=ng{'lon_rho'}(:,:);
Lat=ng{'lat_rho'}(:,:);
for ii=1:size(LonSource);[NMA(ii),MMA(ii)]=Enertime_TrouveCoordSource(Lon,Lat,LonSource(ii),-LatSource(ii));disp([num2str(NMA(ii)) '  ' num2str(MMA(ii))]),end
hold on,for ii=1:size(LonSource);plot(MMA(ii),NMA(ii),'+r'),end
plot(MMA(2),NMA(2),'+r')

figure,pcolor(Lon,Lat,h),hold on,plot(Lon(MMA(2),NMA(2)),Lat(MMA(2),NMA(2)),'or')
ZetaPtB_v2=Zeta(:,MMA(2),NMA(2));
figure,plot(ZetaPtB_v2)
nc=netcdf('../FichiersSource/his.00000.nc');
Ubar=nc{'ubar'}(:,:,:);
close(nc)
hold on,plot(Ubar(:,MMA(2),NMA(2)),'r')