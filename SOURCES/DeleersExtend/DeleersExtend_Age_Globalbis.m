%close all
%clear all
film=0;

DeleersExtend_Global

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
dt =10;
DeleersExtend_DefinitionNom
nFrames = 500;

% Preallocate movie structure.
if (film==1)
   mov(1:nFrames) = struct('cdata', [],...
                        'colormap', []);
end
IndexMin=277;

for I_Houle=1:Nb_Houle;    
    Hisname=Nom(I_Houle,:);

    ParcMarin_InitialisationDomaine

    Decroissance=1/exp(5); 
    Decroissance=1/4; 
    Concentration0=30;
    DeleersExtend_InitialisationConc

    IndexMax=1E5;


    DeleersExtend_AgeOfWater

    DeleersExtend_Dessin

    close(nc),close(ng)
    save ('Fich_MSK','AgeMoy','AgeTotMoy','Age','AgeTot',...
                                'Concentration','Q','Qtot',...
                                'Milieu','Lagon','DT',...
                                    'lon','lat','TMat','ConcMat','AgeMat')

    figure(1),title([{Titre(I_Houle,:)} {'Pourcentage Eau Milieu 1'}]);
            saveName=[FichSauvegarde(I_Houle,:) '_1'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(2),title([{Titre(I_Houle,:)} {'Pourcentage Eau Milieu 2'}]);
            saveName=[FichSauvegarde(I_Houle,:) '_2'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(4),title([{Titre(I_Houle,:)} {'Concentration Totale'}]);
            saveName=[FichSauvegarde(I_Houle,:) '_4'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(5),title([{Titre(I_Houle,:)} {'Age de l eau du milieu 1'}]);
            saveName=[FichSauvegarde(I_Houle,:) '_5'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(6),title([{Titre(I_Houle,:)} {'Age de l eau du milieu 2'}]);
            saveName=[FichSauvegarde(I_Houle,:) '_6'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(7),title([{Titre(I_Houle,:)} {'Age Total'}]);
            saveName=[FichSauvegarde(I_Houle,:) '_7'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')

    Concentration(end,2)/(Concentration(end,1)+Concentration(end,2))
end