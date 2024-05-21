%%
TdessinMax=size(ConcDomaine,4);
Dossier='../Dessins/Test1/';
% %Pour Gabes :
% ------------
% Cristele=[2128 2137 2146 2155]%+4322;
% Cristele=[1103  1112 1121 1130]%+4322;
% Cristele=[min(943,TdessinMax-31)  min(953,TdessinMax-21) ...
%     min(964,TdessinMax-10) min(974,TdessinMax)]%+4322;
Cristele=[floor(TdessinMax/4) floor(2*TdessinMax/4) ...
          floor(3*TdessinMax/4) TdessinMax]%+4322;
Cristele=[1 981 1013]%+4322;
Cristele=[1 floor(TdessinMax/2-1)  TdessinMax]%+4322;
T_sauv=t_sauv-t_sauv(2);
T_sauv=t_sauv;
Masque=Rmask;Masque(Rmask==0)=NaN;

for ind=1:size(Cristele,2)
    Tdessin=Cristele(ind); saveName=[Dossier 'MH'];
    Enertime3D_Des
end

%Enertime3D_DessinPlus
