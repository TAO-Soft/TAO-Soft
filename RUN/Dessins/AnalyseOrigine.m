close all
DossierSauv='../DessinsEtSauvegarde/';

%Hauteur=0:0.1:1.2;Hmax=12;
DeleersExtend_DefinitionNom
clear AgeMoyen AgeMaximum RapportOrigine

for I_Houle=1:Nb_Houle;
  load (FichSauvegarde(I_Houle,:))
  ParcMarin_InitialisationDomaine
  
  figure(2)
  age=Age(:,:,1);age(Lagon_==0)=NaN;pcolor(lon,lat,age/3600/24)
    axis equal,shading interp,colorbar,caxis([0 16])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Duree (jour) depuis la côte pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'AgeEauOcean_Houle_' ...
        num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'AgeEauOcean_Mur'];
    end
        
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
           
  figure (3)
  rapp=Q(:,:,1)./Qtot*100;rapp(Lagon_==0)=NaN;pcolor(lon,lat,rapp)
    axis equal,shading interp,colorbar,caxis([0 100])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Pourcentage de l eau oceanique pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'OrigineEauOcean_Houle_' num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'OrigineEauOcean_Mur'];
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
    saveName=[DossierSauv 'AgeEauCote_Houle_' ...
        num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'AgeEauCote_Mur'];
    end
        
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
            
  figure (5)
  rapp=Q(:,:,2)./Qtot*100;rapp(Lagon_==0)=NaN;pcolor(lon,lat,rapp)
    axis equal,shading interp,colorbar,caxis([0 100])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Pourcentage de l eau cotiere pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'OrigineEauCote_Houle_' num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'OrigineEauCote_Mur'];
    end
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
            
  
  figure(6)
  age=Age(:,:,3);age(Lagon_==0)=NaN;pcolor(lon,lat,age/3600/24)
    axis equal,shading interp,colorbar,caxis([0 16])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Duree (jour) depuis la côte pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'AgeEauRecif_Houle_' ...
        num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'AgeEauRecif_Mur'];
    end
        
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
            
  figure (7)
  rapp=Q(:,:,3)./Qtot*100;rapp(Lagon_==0)=NaN;pcolor(lon,lat,rapp)
    axis equal,shading interp,colorbar,caxis([0 100])
    xlabel('Longitude')
    ylabel('Latitude')
    title(['Pourcentage de l eau récifale pour une houle de ' ...
            num2str(Hauteur(I_Houle))])
    saveName=[DossierSauv 'OrigineEauRecif_Houle_' num2str(Hauteur(I_Houle)*100,'%03d')];
    if (I_Houle==1)
      saveName=[DossierSauv 'OrigineEauRecif_Mur'];
    end
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
            
            
            

  figure(10)
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
            
end

