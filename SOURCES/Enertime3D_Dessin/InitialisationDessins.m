% Categorie='Entero';
% Categorie='Coli';
BolVit=0;
BolRapide=1;
Zoom=1;
% Categorie='DCO';
% Categorie='Coli';
       

%DCO=ConcDomaine/100*415/1500*1000;

%% Lecture des parametres initiaux et des sorties du modele
LectureConcentration

%% Definition Axes :
if Zoom==1
        Axes=[5.111 5.17 43.316 43.335];
        Axes=[5.1 5.20 43.315 43.34];
else
    Axes=[min(min(lon_(26:end,51:end))) max(max(lon_(26:end,51:end)))...
        min(min(lat_(26:end,51:end))) max(max(lat_(26:end,51:end)))];
    Axes=[min(min(lon_)) max(max(lon_))...
        min(min(lat_)) max(max(lat_))];
end


%% Preparation Raffinement :
if Raffinement
    dlon=min(min(diff(lon')));dlat=min(min(diff(lat)));
    lon_=min(min(lon)):dlon/20:max(max(lon));
    lat_=min(min(lat)):dlat/20:max(max(lat));
    [lon_,lat_]=meshgrid(lon_,lat_);
    lon=lon_;lat=lat_;
else
    lon_=lon;lat_=lat;
end
    
%% Lecture Vent : 
load Vent
% TauX=interp1(t_sauv(3:3:end)',TauX,t_sauv);
% TauY=interp1(t_sauv(3:3:end)',TauY,t_sauv);
       rhoA=1.225;Cd=1.6E-3;
       Intensite=sqrt(sqrt(TauX.^2+TauY.^2)/Cd/rhoA);
       angle_=atan(TauY./TauX)*180/pi-1/2*(sign(TauX)-1)*180;
       angle=mod((-angle_+270),360);
       Tvent=t_sauv;

%% Segmentaion des panaches : 
% Attention s'il existe déjà des fichiers Panache* Cette commande n'est pas
% remise à jour
SegmentationPanorama  

if exist([PanacheSelec '.mat'])
    load([PanacheSelec '.mat'])
else
    Ndist=20;
    ind_K=1;
    for Cas=1:size(DCO,4);%NbPoints;
      Point.DCO(Cas,:)=griddata(lon(M_source-Ndist:M_source+Ndist,...
                                    N_source-Ndist:N_source+Ndist),...
                                 lat(M_source-Ndist:M_source+Ndist,...
                                    N_source-Ndist:N_source+Ndist),...
                                 DCO(M_source-Ndist:M_source+Ndist,...
                                    N_source-Ndist:N_source+Ndist,...
                                    ind_K,Cas),Point.Lon,Point.Lat);
      [temp,Panache(Cas)]=max(Point.DCO(Cas,:));
    end
    save(PanacheSelec,'Point','Panache')
end

mask=rmask_./rmask_;
NbCas=size(DCO,4);
cote=NaN*ones(size(rmask_));cote(1:end-1,:)=rmask_(1:end-1,:).*(1-rmask_(2:end,:));
