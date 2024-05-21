        cosa = cos(angle);
        sina = sin(angle);
        u = v_N.*cosa - v_M.*sina;
        v = v_M.*cosa + v_N.*sina;

for indMilieu=1:N_Milieu        
        figure(2*indMilieu-1);clf
        pcolor(lon,lat,Q(:,:,indMilieu)./Qtot./rmask*100),axis equal,shading interp, 
        hold on 
        ii=2;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
        title(['Concentration Tracer ' num2str(indMilieu) ...
               ' - ' num2str(T2/3600/24)])
        axis equal,caxis([0. 100]),colorbar
end
        
%         figure(2);clf
%         pcolor(lon,lat,Q(:,:,min(N_Milieu,2))./Qtot./rmask*100),axis equal,shading flat, 
%         hold on 
%         ii=2;
%         quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
%                u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
%         title(['Concentration Tracer 2 - ' num2str(T2/3600/24)])
%         axis equal,caxis([0. 100]),colorbar
%         
%         figure(3);clf
%         pcolor(lon,lat,Q(:,:,min(N_Milieu,3))./Qtot./rmask*100),axis equal,shading flat, 
%         hold on 
%         ii=2;
%         quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
%                u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
%         title(['Concentration Tracer 3 - ' num2str(T2/3600/24)])
%         axis equal,caxis([0. 100]),colorbar

        figure(2*N_Milieu+1);clf
        pcolor(lon,lat,Qtot./rmask),axis equal,shading interp, 
        hold on 
        ii=2;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
        title(['Concentration Tracer - ' num2str(T2/3600/24)])
        axis equal,caxis([0. 30]),colorbar
        
  for indMilieu=1:N_Milieu        
        figure(2*indMilieu);clf
        pcolor(lon,lat,Age(:,:,indMilieu)./rmask/3600/24)
        axis equal,shading interp, 
        hold on 
        ii=2;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
        title(['Age Tracer 1 - ' num2str(T2/3600/24)])
        axis equal,colorbar, %caxis([0. 30]),
  end
  
%         figure(6);clf
%         pcolor(lon,lat,Age(:,:,min(N_Milieu,2))./rmask/3600/24)
%         axis equal,shading interp, 
%         hold on 
%         ii=2;
%         quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
%                u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
%         title(['Age Tracer 2 - ' num2str(T2/3600/24)])
%         axis equal,colorbar, %caxis([0. 30]),
%         
%         figure(7);clf
%         pcolor(lon,lat,Age(:,:,min(N_Milieu,3))./rmask/3600/24)
%         axis equal,shading interp, 
%         hold on 
%         ii=2;
%         quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
%                u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
%         title(['Age Tracer 3 - ' num2str(T2/3600/24)])
%         axis equal,colorbar, %caxis([0. 30]),

        figure(2*N_Milieu+2);clf
        pcolor(lon,lat,AgeTot./rmask/3600/24)
        axis equal,shading interp, 
        hold on 
        ii=2;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),1,'c')
        axis equal,colorbar, %caxis([0. 30]),
        title(['Age - ' num2str(T2/3600/24)])
        
        %axis([45.09 45.31 -12.82 -12.60])
%         figure(2),clf
%         pcolor(lon,lat,q./rmask),shading interp, 
%         %axis([45.1 45.175 -12.75 -12.70])
%         axis equal
%         hold on,quiver(lon,lat,u,v,5,'y')
%         colorbar
        
%         x=x+1;
%         tps=t/3600/24;
%         Qmean(ind_his)=sum(sum(q));
%         [t/3600/24  sum(sum(q))/1000];%,pause,
%         Q(ind_his,:,:)=q;
%         fichM=(['DessinMalou/', num2str(x)]);
%         saveName=[fichM];
  
        %saveas(gcf,saveName,'fig')
        %saveas(gcf,saveName,'jpg')
