figure(1),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.9 34.8])
    saveName=[Dossier 'MH_Point'];saveas(gcf,saveName,'jpg')
figure(2),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.9 34.8])
    saveName=[Dossier 'Jusant_Point'];saveas(gcf,saveName,'jpg')
figure(3),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.9 34.8])
    saveName=[Dossier 'MB_Point'];saveas(gcf,saveName,'jpg')
figure(4),Enertime_PlotSource
    %axis([10.5 11.5 34.4 35.1]);
    %axis([10. 11 33.4 34.4])
    saveName=[Dossier 'Flot_Point'];saveas(gcf,saveName,'jpg')

%t=1:size(ConcDomaine,3);
%t=t+348;
t=t_sauv;
figure(5);clf
hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source,N_source,:)),'r')
plot(T_sauv(Cristele)/24,squeeze(ConcDomaine(M_source,N_source,Cristele)),'*k')

hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source-1,N_source,:)),'k')
hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+4,N_source+3,:)),'g')
hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+2,N_source+1,:)),'m')
hold on,plot(T_sauv/24,squeeze(ConcDomaine(M_source+1,N_source,:)),'c')

%axis([0 15 24.8 29])
box on

saveName=[Dossier 'VarTempConc'];
saveas(gcf,saveName,'fig');saveas(gcf,saveName,'jpg')
%save SauvegardeD1_1500 Conc0 ConcDomaine lat_ lon_ lat lon masqueP masque rmask rmask_ q