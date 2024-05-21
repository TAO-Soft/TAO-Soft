BolSauvegarde=0;
figure(1),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.9 34.8])
    if(BolSauvegarde==1)
        saveName=[Dossier 'MH_Point'];saveas(gcf,saveName,'jpg')
    end
figure(2),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.9 34.8])
    if(BolSauvegarde==1)
      saveName=[Dossier 'Jusant_Point'];saveas(gcf,saveName,'jpg')
    end
figure(3),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.9 34.8])
    if(BolSauvegarde==1)
      saveName=[Dossier 'MB_Point'];saveas(gcf,saveName,'jpg')
    end
figure(4),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.4 34.4])
    if(BolSauvegarde==1)
      saveName=[Dossier 'Flot_Point'];saveas(gcf,saveName,'jpg')
    end

%t=1:size(ConcDomaine,3);
%t=t+348;
t=t_sauv;
for ind_K=1:K
figure;clf
    hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source,N_source,ind_K,:))/100*415/1500*1000,'r')
    hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source-1,N_source,ind_K,:))/100*415/1500*1000,'k')
    hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+4,N_source+3,ind_K,:))/100*415/1500*1000,'g')
    hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+2,N_source+1,ind_K,:))/100*415/1500*1000,'m')
    hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+1,N_source,ind_K,:))/100*415/1500*1000,'c')
end
% for ind_K=1:K
% figure;clf
%     hold on,plot(T_sauv(3:3:end)/24,squeeze(ConcDomaine(M_source,N_source,ind_K,3:3:end)),'r')
%     hold on,plot(T_sauv(3:3:end)/24,squeeze(ConcDomaine(M_source-1,N_source,ind_K,3:3:end)),'k')
%     hold on,plot(T_sauv(3:3:end)/24,squeeze(ConcDomaine(M_source+4,N_source+3,ind_K,3:3:end)),'g')
%     hold on,plot(T_sauv(3:3:end)/24,squeeze(ConcDomaine(M_source+2,N_source+1,ind_K,3:3:end)),'m')
%     hold on,plot(T_sauv(3:3:end)/24,squeeze(ConcDomaine(M_source+1,N_source,ind_K,3:3:end)),'c')
% end
%axis([0 15 24.8 29])
box on

if(BolSauvegarde==1)
    saveName=[Dossier 'VarTempConc'];
    saveas(gcf,saveName,'fig');saveas(gcf,saveName,'jpg')
end
%save SauvegardeD1_1500 Conc0 ConcDomaine lat_ lon_ lat lon masqueP masque rmask rmask_ q