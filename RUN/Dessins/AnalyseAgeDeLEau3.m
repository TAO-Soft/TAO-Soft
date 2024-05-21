close all
DossierSauv='../DessinsEtSauvegarde/';

%Hauteur=0:0.1:1.2;Hmax=12;
DeleersExtend_DefinitionNom
clear AgeMoyen AgeMaximum RapportOrigine
for I_Houle=1:Nb_Houle;
  load (FichSauvegarde(I_Houle,:))
  AgeMoyen(I_Houle)=mean(AgeTotMoy(end-11:end))/3600/24;
  AgeMaximum(I_Houle)=max(max(AgeTot))/3600/24;
  RapportOrigine(I_Houle)=mean(100*Concentration(end-11:end,1)...
      ./(Concentration(end-11:end,1)+Concentration(end-11:end,2)));
      
end
figure, plot(Hauteur,RapportOrigine,'k')
  title('Impact de la hauteur de la houle sur l origine de l eau')
  xlabel('hauteur de la houle (m)')
  ylabel('Pourcentage de l eau oceanique')
  saveName=[DossierSauv 'ImpactHoule_sur_OrigineEau'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
figure, plot(Hauteur,AgeMoyen,'k',Hauteur,AgeMaximum,'r')
  title('Impact de la hauteur de la houle sur l age de l eau')
  xlabel('Hauteur de la houle (m)')
  ylabel('Age (jour)')
  legend('Age Moyen','Age maximum')
  saveName=[DossierSauv 'ImpactHoule_sur_AgeEau'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')

for I_Houle=1:Nb_Houle;
  load (FichSauvegarde(I_Houle,:))
  ParcMarin_InitialisationDomaine
  
  figure(1)
  age=AgeTot;age(Lagon_==0)=NaN;pcolor(lon,lat,age/3600/24)
    axis equal,shading interp,colorbar,caxis([0 25])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Age de l eau (jour) pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'AgeEau_Houle_' ...
        num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'AgeEau_Houle_Mur'];
    end
        
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
            
  figure (2)
  rapp=Q(:,:,2)./Qtot*100;rapp(Lagon_==0)=NaN;pcolor(lon,lat,rapp)
    axis equal,shading interp,colorbar,caxis([0 100])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Pourcentage de l eau oceanique pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'OrigineEau_Houle_' num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'OrigineEau'];
    end
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')

  figure(4)
  age=Age(:,:,2);age(Lagon_==0)=NaN;pcolor(lon,lat,age/3600/24)
    axis equal,shading interp,colorbar,caxis([0 16])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Duree (jour) depuis la côte pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'AgeEau_Houle_' ...
        num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'TempsCote'];
    end
        
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
            
end

