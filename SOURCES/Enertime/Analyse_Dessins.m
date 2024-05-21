%% Definition :
% =============
% load ../DessinsEtSauvegarde/FichiersSauvegarde3D_1.mat
load cote.mat;
K=3;
Stations

c1=['*r';'*k';'*g';'*m';'*c'];
c2=['r';'k';'g';'m';'c'];
TdessinMax=size(ConcDomaine,3);
% Dossier='../Dessins/Test1/';
Dossier='../Dessins/DebitVariable/';
Cristele=TdessinMax;
T_sauv=t_sauv-t_sauv(2);

Masque=Rmask;Masque(Rmask==0)=NaN;

%%Spatiale :
%%==========
ConcDomainMean=mean(ConcDomaine,4);
ConcDomainMin=min(ConcDomaine,[],4);
ConcDomainMax=max(ConcDomaine,[],4);

%% Conversion en Particules
%===========================
% DCO  --> 415kg   Débit--> 1500m3 : conv=DCO/1500
% Débit Modele = 100*1500 DCO Modele=Conc/100*DCO/1500
DCOMean=ConcDomainMean/100*415/1500*1000;
DCOMin=ConcDomainMin/100*415/1500*1000;
DCOMax=ConcDomainMax/100*415/1500*1000;
DCO=ConcDomaine/100*415/1500*1000;

%%Moules :
%%--------
saveDossier=[Dossier 'Moule2008_'];
for ind_K=1:K
    figure(2*(ind_K-1)+2),clf,hold on
    figure(2*(ind_K-1)+1),clf,hold on
    pcolor(lon_(26:end,51:end),lat_(26:end,51:end),DCOMean(26:end,51:end,ind_K)); axis equal, shading flat
    caxis([0 30]),colorbar
    box on
    axis([5.52 5.551 43.202 43.214])
    for ind=1:size(St_Moule,2)
        figure(2*(ind_K-1)+1)
        plot(St_Moule(ind).lon,St_Moule(ind).lat,c1(ind,:));
        figure(2*(ind_K-1)+2)
        hold on,plot((t_sauv-t_sauv(1))/24,squeeze(DCO(St_Moule(ind).M,St_Moule(ind).N,ind_K,:)),c2(ind,:))
    end
% % Aucun interet car au même endroit que les autres
%     for ind=1:size(St_MouleB,2)
%         figure(2*(ind_K-1)+1)
%         plot(St_Moule(ind).lon,St_Moule(ind).lat,'+k');
%         figure(2*(ind_K-1)+2)
%         hold on,plot((t_sauv-t_sauv(1))/24,squeeze(DCO(St_Moule(ind).M,St_Moule(ind).N,ind_K,:)),c2(ind,:))
%     end
    figure(2*(ind_K-1)+1)
    saveName=[saveDossier 'DCO_2DH' num2str(ind_K)];saveas(gcf,saveName,'jpg')
    figure(2*(ind_K-1)+2)
    box on
    saveName=[saveDossier 'DCO_Temp' num2str(ind_K)];saveas(gcf,saveName,'jpg')
end
pause

%% Sediment :
%%--------
saveDossier=[Dossier '/Sediment2008_'];
for ind_K=1%:K
    figure(2*(ind_K-1)+2),clf,hold on
    figure(2*(ind_K-1)+1),clf,hold on
    pcolor(lon_(26:end,51:end),lat_(26:end,51:end),DCOMean(26:end,51:end,ind_K)); axis equal, shading flat
    caxis([0 30]),colorbar
    box on
    axis([5.52 5.551 43.202 43.214])
    for ind=1:size(St_Sed,2)
        figure(2*(ind_K-1)+1)
        plot(St_Sed(ind).lon,St_Sed(ind).lat,c1(ind,:));
        figure(2*(ind_K-1)+2)
        hold on,plot((t_sauv-t_sauv(1))/24,squeeze(DCO(St_Sed(ind).M,St_Sed(ind).N,ind_K,:)),c2(ind,:))
    end
% % Aucun interet car au même endroit que les autres
    for ind=1:size(St_SedB,2)
        figure(2*(ind_K-1)+1)
        plot(St_SedB(ind).lon,St_SedB(ind).lat,c1(ind,:));
        figure(2*(ind_K-1)+2)
        hold on,plot((t_sauv-t_sauv(1))/24,squeeze(DCO(St_SedB(ind).M,St_SedB(ind).N,ind_K,:)),c2(ind,:))
    end
    figure(2*(ind_K-1)+1)
    saveName=[saveDossier 'DCO_2DH' num2str(ind_K)];saveas(gcf,saveName,'jpg')
    figure(2*(ind_K-1)+2)
    box on
    saveName=[saveDossier 'DCO_Temp' num2str(ind_K)];saveas(gcf,saveName,'jpg')
end
pause
%% DCO :
%%--------
saveDossier=[Dossier '/'];
%     figure(6),clf,
%     figure(6),clf,
for ind_K=1:K
    figure(2*(ind_K-1)+2),clf,hold on
    figure(2*(ind_K-1)+1),clf,hold on
    %figure(5)
    %subplot(3,1,ind_K)
    pcolor(lon_(26:end,51:end),lat_(26:end,51:end),DCOMean(26:end,51:end,ind_K)); axis equal, shading flat
    caxis([0 30]),colorbar
    box on
    axis([5.52 5.551 43.202 43.214])
    Enertime_PlotSource

       figure(2*(ind_K-1)+2)
     %figure(6),subplot(3,1,ind_K)
     hold on,plot((t_sauv-t_sauv(1))/24/3600,squeeze(DCO(M_source,N_source,ind_K,:)),'r')
     hold on,plot((t_sauv-t_sauv(1))/24/3600,squeeze(DCO(M_source-1,N_source,ind_K,:)),'k')
     hold on,plot((t_sauv-t_sauv(1))/24/3600,squeeze(DCO(M_source+4,N_source+3,ind_K,:)),'g')
     hold on,plot((t_sauv-t_sauv(1))/24/3600,squeeze(DCO(M_source+2,N_source+1,ind_K,:)),'m')
     hold on,plot((t_sauv-t_sauv(1))/24/3600,squeeze(DCO(M_source+1,N_source,ind_K,:)),'c')
 
    figure(2*(ind_K-1)+1)
    saveName=[Dossier 'DCO_2DH' num2str(ind_K)];saveas(gcf,saveName,'jpg')
    axis([5.538 5.542 43.2080 43.21])
    saveName=[Dossier 'DCO_2DHZoom' num2str(ind_K)];saveas(gcf,saveName,'jpg')

    figure(2*(ind_K-1)+2)
    box on
    saveName=[Dossier 'DCO_Temp' num2str(ind_K)];saveas(gcf,saveName,'jpg')
end



% t=t_sauv;
% figure;clf
% hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source,N_source,:)),'r')
% plot(T_sauv(Cristele)/24,squeeze(ConcDomaine(M_source,N_source,Cristele)),'*k')
% 
% hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source-1,N_source,:)),'k')
% hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+4,N_source+3,:)),'g')
% hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+2,N_source+1,:)),'m')
% hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+1,N_source,:)),'c')
% 
% %axis([0 15 24.8 29])
% box on
% 
% saveName=[Dossier 'VarTempConc'];
% saveas(gcf,saveName,'fig');saveas(gcf,saveName,'jpg')
% %save SauvegardeD1_1500 Conc0 ConcDomaine lat_ lon_ lat lon masqueP masque rmask rmask_ q