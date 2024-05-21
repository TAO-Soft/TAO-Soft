%%
TdessinMax=size(ConcDomaine,3);
Dossier='../Dessins/Test1/';
% %Pour Gabes :
% ------------
% Cristele=[2128 2137 2146 2155]%+4322;
% Cristele=[1103  1112 1121 1130]%+4322;
% Cristele=[min(943,TdessinMax-31)  min(953,TdessinMax-21) ...
%     min(964,TdessinMax-10) min(974,TdessinMax)]%+4322;
Cristele=[floor(TdessinMax/4) floor(2*TdessinMax/4) ...
          floor(3*TdessinMax/4) TdessinMax]%+4322;
Cristele=[14660 15180 15470 15770 16590 17210 17540]
Cristele=[981 1013]%+4322;
T_sauv=t_sauv-t_sauv(2);

Masque=Rmask;Masque(Rmask==0)=NaN;

for ind=1:size(Cristele,2)
    figure(2*ind)
    Tdessin=Cristele(ind); saveName=[Dossier 'MH'];
    Enertime_Des
end

Enertime_DessinPlus
