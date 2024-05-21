close all
clear all

DeleersExtend_Global

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
echelle =[1/6 1/6 1/6 1/10];
ech =1/6;
ech =1/12;
DeleersExtend_DefinitionNom
Houle=[1,2,10,20];
for I_Houle=Houle(4);    
    Hisname=Nom(I_Houle,:);
    ParcMarin_InitialisationDomaine
    zeta=squeeze(nc{'zeta'}(:,132,44,:));
    T0_His=[1 4 7 10];
    T0_His=[4 10];
    for ind_his=T0_His
        v_N=squeeze(nc{'ubar'}(ind_his,:,:)); v_N(:,N)=v_N(:,N-1);
        v_M=squeeze(nc{'vbar'}(ind_his,:,:)); v_M(M,:)=v_M(M-1,:);

        cosa = cos(angle);
        sina = sin(angle);
        u = v_N.*cosa - v_M.*sina;
        v = v_M.*cosa + v_N.*sina;
        Q=sqrt(u.^2+v.^2);
        figure(1);clf
        pcolor(lon,lat,Q./rmask),axis equal,shading interp, 
        hold on 
        ii=4;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N)*ech,v(1:ii:M,1:ii:N)*ech,0,'k',...
               'LineWidth',1)
        axis equal,colorbar,caxis([0. 0.25])

        fichM=(['Article/DessinMalou/', num2str(I_Houle),...
                num2str(ind_his)]);
        saveName=[fichM];
  
        saveas(gcf,saveName,'fig')
    end
    close(nc)
end
