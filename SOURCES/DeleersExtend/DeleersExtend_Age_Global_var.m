%close all
%clear all
film=0;

DeleersExtend_Global

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
dt =125;
DeleersExtend_DefinitionNom
nFrames = 500;

% Preallocate movie structure.
if (film==1)
   mov(1:nFrames) = struct('cdata', [],...
                        'colormap', []);
end
IndexMin=0;

Hisname=Nom(1,:);

ParcMarin_InitialisationDomaine
T2=0;DeleersExtend_var_InitialisationTemps

Decroissance=1/exp(5); 
Concentration0=30;
DeleersExtend_InitialisationConc

IndexMax=1E5;


DeleersExtend_var_AgeOfWater

DeleersExtend_Dessin

close(ng)
    save (FichSauvegarde,'AgeMoy','AgeTotMoy','Age','AgeTot',...
                                'Concentration','Q','Qtot',...
                                'Milieu','Lagon','DT',...
                                    'lon','lat')
    figure(1),title([{Titre} {'Pourcentage Eau Milieu 1'}]);
            saveName=[FichSauvegarde '_1'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(2),title([{Titre} {'Pourcentage Eau Milieu 2'}]);
            saveName=[FichSauvegarde '_2'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(4),title([{Titre} {'Concentration Totale'}]);
            saveName=[FichSauvegarde '_4'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(5),title([{Titre} {'Age de l eau du milieu 1'}]);
            saveName=[FichSauvegarde '_5'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(6),title([{Titre} {'Age de l eau du milieu 2'}]);
            saveName=[FichSauvegarde '_6'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')
    figure(7),title([{Titre} {'Age Total'}]);
            saveName=[FichSauvegarde '_7'];
            saveas(gcf,saveName,'fig')
            saveas(gcf,saveName,'jpg')

    Concentration(end,2)/(Concentration(end,1)+Concentration(end,2))
