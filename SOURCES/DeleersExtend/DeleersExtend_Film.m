        cosa = cos(angle);
        sina = sin(angle);
        u = v_N.*cosa - v_M.*sina;
        v = v_M.*cosa + v_N.*sina;

        figure(4);clf
        Qlagon=Qtot;Qlagon(Lagon==0)=NaN;
         image(Ylong,Xlat,Photo),axis('equal'),axis xy, hold on
        pcolor(lon,lat,Qlagon./rmask),axis equal,shading interp, 
        axis([165.7 166 -22 -21.7])
        ii=2;
        quiver(lon(1:ii:M,1:ii:N),lat(1:ii:M,1:ii:N),...
               u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),2,'c')
        axis equal,caxis([0. 30]),colorbar
        mov(index) = getframe(gcf);
