Lagon_RepereLagon
Lon=ng{'lon_rho'}(:,:);
Lat=ng{'lat_rho'}(:,:);
%save DataModele Lon Lat h rmask Milieu Lagon
LonLat=load('PositionMouillages');
LonSource=LonLat(:,1);
LatSource=LonLat(:,2);
%load('FichTotalConc.mat')
for ii=1:size(LonSource);[NMA(ii),MMA(ii)]=Enertime_TrouveCoordSource(Lon,Lat,LonSource(ii),-LatSource(ii));disp([num2str(NMA(ii)) '  ' num2str(MMA(ii))]),end
nc=netcdf('../FichiersSource/hisApresUsine_Old.00000.nc');
Zeta=nc{'ubar'}(:,:,:);
ZetaPtF=Zeta(:,NMA(4),MMA(4));
ZetaPtB=Zeta(:,NMA(2),MMA(2));
plot(ZetaPtB)
nc=netcdf('../FichiersSource/hisApresUsine_Old.00000.nc');
    Zeta_v1=nc{'ubar'}(:,:,:);
    Temps_v1=nc{'scrum_time'}(:)/3600/24;
close(nc)
ZetaPtF_v1=Zeta_v1(:,NMA(4),MMA(4));
plot(ZetaPtF_v1)
nc=netcdf('../FichiersSource/his.00500.nc');
    Zeta_v2=nc{'ubar'}(:,:,:);
    Temps_v2=nc{'scrum_time'}(:)/3600/24;
close(nc)
ZetaPtF_v2=Zeta_v2(:,NMA(4),MMA(4));
ZetaPtB_v2=Zeta_v2(:,NMA(2),MMA(2));
hold on,plot(ZetaPtF_v2,'r')
hold on,plot(ZetaPtB_v2,'r')

for ii=1:size(LonSource);
    ZetaSt_v1=Zeta_v1(:,NMA(ii),MMA(ii));
    figure,plot(Temps_v1,ZetaSt_v1,'k')
    ZetaSt_v2=Zeta_v2(:,NMA(ii),MMA(ii));
    hold on,plot(Temps_v2,ZetaSt_v2,'r')
end


NMA
whos
close all
figure,pcolor(Lon,Lat,squeeze(ConcMat(:,:,3,end)))
ConcMat(NMA,MMA,3,:)
squeeze(ConcMat(NMA,MMA,3,:))
squeeze(ConcMat(NMA(1),MMA(1),3,:))
squeeze(ConcMat(NMA(1),MMA(1),3,:))'
squeeze(mean(ConcMat(NMA(1),MMA(1),3,:),4))'
squeeze(mean(ConcMat(NMA(2),MMA(2),3,:),4))'
for ii=1:size(NMA,1),squeeze(mean(ConcMat(NMA(2),MMA(2),3,:),4))',end
size(NMA,1)
size(NMA,2)
for ii=1:size(NMA,2),squeeze(mean(ConcMat(NMA(2),MMA(2),3,:),4))',end
for ii=1:size(NMA,2),squeeze(mean(ConcMat(NMA(ii),MMA(ii),3,:),4))'*100/30,end
for ii=1:size(NMA,2),aa(ii)=squeeze(mean(ConcMat(NMA(ii),MMA(ii),3,:),4))'*100/30;end
aa
save ProportionMoy aa -ascii
for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),3,:),4))'*100/30;end
for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),3,:),4)'*100/30;end
for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),3,:)))'*100/30;end
clear aa
for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),3,:)))'*100/30;end
size(aa)
figure,plot(aa)
figure,plot(aa')
save ProportionStation aa -ascii
save ProportionStation aa' -ascii
aa=aa';
save ProportionStation aa -ascii
start
nc=netcdf('../FichiersSource/hisApresUsine.00000.nc');
ncdump('../FichiersSource/hisApresUsine.00000.nc');
Zeta=nc{'zeta‘}(:,:,:);
nc=netcdf('../FichiersSource/hisApresUsine.00000.nc');
Zeta=nc{'zeta'}(:,:,:);
ZetaPtF=Zeta(:,NMA(4),MMA(4));
plot(ZetaPtF)
close
figure
plot(ZetaPtF)
hold on,
plot(aa)
plot(ZetaPtF*100)
plot(ZetaPtF*10 + 40)
size(ZetaPtF)
size(ZetaPtF)*3
size(aa)
ZetaPtF(1)
T=0:1:1443;
ZetaPtF_=[ZetaPtF;ZetaPtF;ZetaPtF];
size(ZetaPtF_)
AA=[T(2:end) ZetaPtF_(2:end) aa];
AA=[T(2:end)' ZetaPtF_(2:end)' aa];
size(T)
size(aa)
AA=[T(2:end-1)' aa];
save ProportionStationTemps AA -ascii
T=0:1:size(ZetaPtF);
size(T)
482*3
481*3
aa(1,:)
aa=[aa(1,:); aa];
size(aa)
size(T)
T=T(1:end-1);
bb=[T ZetaPtF;T ZetaPtF;T ZetaPtF];
bb=[T ZetaPtF];
bb=[T' ZetaPtF;T' ZetaPtF;T' ZetaPtF];
size(bb)
size(aa)
AA=[bb aa];
save ProportionStationTemps AA -ascii
t=nc{'time'}(:);t(1)
t=nc{'time'}(:);t(1:5)
figure,plot(T/24,ZetaPtF,'.')
figure,plot(T/24,ZetaPtF)
hold on,plot(4+T/24,ZetaPtF)
hold on,plot(3.9+T/24,ZetaPtF)
hold on,plot(3.83+T/24,ZetaPtF)
hold on,plot(3.85+T/24,ZetaPtF)
hold on,plot(3.86+T/24,ZetaPtF)
hold on,plot(3.86-7+T/24,ZetaPtF)
hold on,plot(3.86-14+T/24,ZetaPtF)
hold on,plot(3.9-14+T/24,ZetaPtF)
hold on,plot(3.88-14+T/24,ZetaPtF)
3.88-14
0.88*24