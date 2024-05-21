LonLat=load('PositionMouillages');
LonSource=LonLat(:,1);
LatSource=LonLat(:,2);
for ii=1:size(LonSource);[NMA(ii),MMA(ii)]=Enertime_TrouveCoordSource(Lon,Lat,LonSource(ii),-LatSource(ii));disp([num2str(NMA(ii)) '  ' num2str(MMA(ii))]),end
DT=93*24-3;
T=0:1:size(aa,2);size(T)
clear aa

Age=squeeze(sum(AgeMat.*ConcMat./sum(ConcMat,3),3));
for ii=1:size(NMA,2),aa(ii,:)=squeeze((Age(NMA(ii),MMA(ii),:)))'/3600/24;end
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];

plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
save AgeStationTemps AA -ascii


iMilieu=3;
for ii=1:size(NMA,2),aa(ii,:)=squeeze((AgeMat(NMA(ii),MMA(ii),iMilieu,:)))'/3600/24;end
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];

figure,plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
save AgeStationTempsLagon AA -ascii

for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),iMilieu,:)))'*100/30;end
plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];
save ProportionStationTempsLagon AA -ascii

iMilieu=2;
for ii=1:size(NMA,2),aa(ii,:)=squeeze((AgeMat(NMA(ii),MMA(ii),iMilieu,:)))'/3600/24;end
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];

figure,plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
save AgeStationTempsRecif AA -ascii

for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),iMilieu,:)))'*100/30;end
plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];
save ProportionStationTempsRecif AA -ascii

iMilieu=1;
for ii=1:size(NMA,2),aa(ii,:)=squeeze((AgeMat(NMA(ii),MMA(ii),iMilieu,:)))'/3600/24;end
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];

figure,plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
save AgeStationTempsOcean AA -ascii

for ii=1:size(NMA,2),aa(ii,:)=squeeze((ConcMat(NMA(ii),MMA(ii),iMilieu,:)))'*100/30;end
plot(T(2:DT+1)/24+21,aa(:,2*DT+1:3*DT))
AA=[T(2:DT+1)/24+21;aa(:,2*DT+1:3*DT)];
save ProportionStationTempsOcean AA -ascii