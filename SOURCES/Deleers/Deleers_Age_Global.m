close all
clear all

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
Hisgrid='../Houle_030/his.0000.nc';
Hisname='../Houle_020/his.0500.nc';
dt =250;
IndexMax=1E5;
Decroissance=1/exp(2); Concentration0=30;

ParcMarin_InitialisationDomaine
Deleers_InitialisationConc

Deleers_AgeOfWater
  
Deleers_Dessin

close(nc),close(ng)

figure(6),title('H=0.2m');
AgeMoy_020=AgeMoy;
save Age_020b AgeMoy_020 age
figure,plot(AgeMoy/3600/24)