clear all
close all
DeleersExtend_DefinitionNom
ParcMarin_InitialisationDomaine
close all
Enertime_DefinitionSource
load SauvegardeD1_3600.mat
t_sauv=1:size(Conc0,3);
Zeta_Verif=[t_sauv t_sauv(end)];
Enertime_Dessin
load SauveCote.mat
figure(5),pcolor(tlon,tlat,tz*25.3)
% tz(isnan(tz)==1)=0;
% contour(tlon,tlat,tz,'w')
shading interp