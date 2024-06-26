% DossierResultats=...
%     '/home/cristele/Documents/NouvelleCaledonie/Modele/SimulationsArticle/';
% Hisgrid=[DossierResultats 'Houle_030/his.0000.nc'];
% Hisname=[DossierResultats 'Houle_066/his.0500.nc'];
Model='Croco';
DossierResultats=...
    '/Volumes/Plastique/MayotteUsine/Simulations/GrandDomaine/IR0/';
Hisgrid=[DossierResultats 'his_ir0_v1.00000.nc'];
Nom=[...
   DossierResultats 'his_ir0_v1.00000.nc';...
   DossierResultats 'his_ir0_v1.00720.nc';...
   DossierResultats 'his_ir0_v1.01440.nc';...
   DossierResultats 'his_ir0_v1.02160.nc';...
   DossierResultats 'his_ir0_v1.02880.nc';...
   DossierResultats 'his_ir0_v1.03600.nc';...
   DossierResultats 'his_ir0_v1.04320.nc';...
   DossierResultats 'his_ir0_v1.05040.nc';...
   DossierResultats 'his_ir0_v1.05760.nc';...
   DossierResultats 'his_ir0_v1.06480.nc';...
   DossierResultats 'his_ir0_v1.07200.nc';...
   DossierResultats 'his_ir0_v1.07920.nc';...
 ];

 
 Titre=[...
       'Mayotte ';...
       ];
      
FichSauvegarde=[...
    'Mayotte';...
    ];

 clear temp
for ind=1:size(FichSauvegarde,1)
    temp(ind,:)=['../DessinsEtSauvegarde/FichiersSauvegarde/' FichSauvegarde(ind,:)];
end
FichSauvegarde=temp;

Hauteur=[...
         0.3 ...
         ];

Nb_Houle=size(Hauteur,2);
    
nx=1;

clear iT0Connexion Maree
MultiFichier=true;  
NbFich_=size(Nom,1);
Tsauvegarde=1*3600;
TempsSpinup=1;

CoordonneeZ=false;
CoordonneeSigma=true;

N_T2Max=3;