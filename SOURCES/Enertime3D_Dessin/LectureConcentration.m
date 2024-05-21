Zoom=0;
DossierSauvGl='../Dessins/Configuration/';
BolSauvegarde=1;
BolDesEchantillonage=0;

DossierDomaine='../DessinsEtSauvegarde/Vitesses/';
Dossier='../DessinsEtSauvegarde/Vitesses/';
    if FirstVitesse
       Enertime3D_RelectureVitesse
       FirstVitesse=false;
    end
load PanelCouleur
ind_K=1;
if (strcmp(Categorie,'Entero')==1)
    Dossier='../DessinsEtSauvegarde/Entero/';N_T2=1;
    if FirstEntero
       Enertime3D_Relecture
       FirstEntero=false;
       FirstColi=true;
       FirstMES=false;
       FirstPanache=true;
    end
    DossierSauv=[DossierSauvGl 'Entero/'];
   % DCO=ConcDomaine*12770/180000;
   % DCO=ConcDomaine*3216/180000;
     DCO=ConcDomaine/399000*12770;
    DCO_Min=0;DCO_Max=400;NbEtape=4;DcoMin=0;
    %DCO_Min=0;DCO_Max=10;NbEtape=5;DcoMin=0;
    Seuil1=100;Seuil2=370;
    PanacheSelec='PanacheSelecEntero';
elseif (strcmp(Categorie,'Coli')==1)
    Dossier='../DessinsEtSauvegarde/EColi/';N_T2=2;
    if FirstColi
       Enertime3D_Relecture
       FirstEntero=true;
       FirstColi=false;
       FirstMES=false;
       FirstPanache=true;
    end
    DCO=ConcDomaine*653000*7.3;
    DCO_Min=0;DCO_Max=1200;NbEtape=6;DcoMin=0;
    %DCO_Min=0;DCO_Max=100;NbEtape=5;DcoMin=0;
    Seuil1=100;Seuil2=1000;
    PanacheSelec='PanacheSelecColi';
    DossierSauv=[DossierSauvGl 'Coli/'];
elseif (strcmp(Categorie,'MES')==1)
    Dossier='../DessinsEtSauvegarde/MES/';N_T2=2;
    if FirstMES
       Enertime3D_Relecture
       FirstEntero=true;
       FirstColi=true;
       FirstMES=false;
       FirstPanache=true;
    end
    DCO=ConcDomaine;
    DCO_Min=0;DCO_Max=1200;NbEtape=6;DcoMin=0.015;
    %DCO_Min=0;DCO_Max=100;NbEtape=5;DcoMin=0;
    Seuil1=0.2;Seuil2=2;
    PanacheSelec='PanacheSelecMES';
    DossierSauv=[DossierSauvGl 'Coli/'];
else
    Dossier='../DessinsEtSauvegarde/DCO/';N_T2=1;
    Dossier='../DessinsEtSauvegarde/';N_T2=1;
    if FirstPanache
       Enertime3D_Relecture
       FirstEntero=true;
       FirstColi=true;
       FirstPanache=false;
       FirstMES=false;
    end
    DossierSauv=[DossierSauvGl 'DCO/'];
    DCO_Min=0;DCO_Max=5;
    %DCO=ConcDomaine/180000*415/1500*1000; %en mg/l
    DCO=ConcDomaine*10; % en 1 g d eau usée par m3 d'eau ou en mg/l 
    DCO_Min=0;DCO_Max=10;
    PanacheSelec='PanacheSelecPanache';
end
