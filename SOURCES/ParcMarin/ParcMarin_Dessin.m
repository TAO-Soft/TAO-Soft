        cosa = cos(angle);
        sina = sin(angle);
        u = v_N.*cosa - v_M.*sina;
        v = v_M.*cosa + v_N.*sina;
        figure(5);clf
        pcolor(lon,lat,q./rmask),axis equal,shading interp, 
        hold on 
        ii=5;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),2,'c')
        axis equal,caxis([0. 30]),colorbar
        %axis([45.09 45.31 -12.82 -12.60])
%         figure(2),clf
%         pcolor(lon,lat,q./rmask),shading interp, 
%         %axis([45.1 45.175 -12.75 -12.70])
%         axis equal
%         hold on,quiver(lon,lat,u,v,5,'y')
%         colorbar
        
        x=x+1;
        tps=t/3600/24;
        Qmean(ind_his)=sum(sum(q));
        [t/3600/24  sum(sum(q))/1000];%,pause,
        Q(ind_his,:,:)=q;
        fichM=(['DessinMalou/', num2str(x)]);
        saveName=[fichM];
  
        %saveas(gcf,saveName,'fig')
        %saveas(gcf,saveName,'jpg')
