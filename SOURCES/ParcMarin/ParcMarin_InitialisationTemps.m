nc=netcdf(Hisname);  % Vars=var(nc);ncnames(Vars)';
if strcmp(Model,'Croco')==1
    T_His=nc{'scrum_time'}(:);  %en seconde dans le fichier
end
%% Cristele : Bug dans le fichier 
%ind=1:size(T_His,1);        % a supprimer
%T_His=interp1([ind(1);ind(end)],[T_His(1);T_His(end)],ind); % a supprimer
%% 

if strcmp(Model,'Mars')==1 | strcmp(Model,'Mars3D')==1 
    T_His=nc{'time'}(:); %en seconde dans le fichier
end
if ~exist('iT0Connexion','var')
    iT0Connexion=1:size(T_His,1);    
    if exist('Maree','var')
        freq=0.0805114; Periode=1/freq;
        w=2*freq*pi;
        T2_His_=floor((T_His(end)-T_His(1))*freq/3600)*Periode*3600+T_His(1);
        [tempo,N2_His]=min(abs(T_His-T2_His_));N2_His=N2_His-1;
        iT0Connexion=1:N2_His;
    end
end

ii=find((T_His>TempsSpinup));T1_His_=max(TempsSpinup,T_His(ii(1)));
if indFich==1
    T2_His_=T_His(24*10);
else
    T2_His_=T_His(min(size(T_His,1),iT0Connexion(end)));
end
[tempo,N2_His]=min(abs(T_His-T2_His_));%N2_His=75;N2_His=N2_His-1;
[tempo,N1_His]=min(abs(T_His-T1_His_));
T_His=T_His-T_His(N1_His);
T1_His=T_His(N1_His);
T2_His=T_His(N2_His);
DT=diff(T_His);
T_His=T_His(N1_His:N2_His);


