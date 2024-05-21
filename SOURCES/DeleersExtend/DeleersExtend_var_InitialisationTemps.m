T_His=nc{Temps}(:);

if ~exist('Tmin','var')
    Tmin_=0;
else
    Tmin_=Tmin*3600;
end
if ~exist('Tmax','var')
    Tmax_=max(T_His);
else
    Tmax_=Tmax*3600;
end

iTemps=find(T_His >= Tmin_ & T_His <= Tmax_ & T_His >= T2);
if size(iTemps,1)>1
    N1_His=min(iTemps);
    N2_His=max(iTemps);
    FichierOK=true;
else
    FichierOK=false;
    N1_His=0;
    N2_His=0;
end    


