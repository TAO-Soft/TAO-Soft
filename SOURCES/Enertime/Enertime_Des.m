if (exist('ConcDomaine')~=0)
%         cosa = cos(angle_);
%         sina = sin(angle_);
%         u = v_N.*cosa - v_M.*sina;
%         v = v_M.*cosa + v_N.*sina;
%         ii=2;
%         quiver(lon_(1:ii:M,1:ii:N),lat_(1:ii:M,1:ii:N),...
%                u(1:ii:M,1:ii:N),v(1:ii:M,1:ii:N),2,'c')

        pcolor(lon_,lat_,squeeze(ConcDomaine(:,:,Tdessin)).*Masque),axis equal,shading flat, 
        hold on 
        axis equal,colorbar,%axis([10.7 11.5 34.5 35.1])
%         contour(lon,lat,masqueP,0.99,'--k','LineWidth',2)
%         quiver(lon_(1:end-1,1:end-1),lat_(1:end-1,1:end-1),ubar1(1:end-1,:),...
%                vbar1(:,1:end-1),2)
%         quiver(lon_(2:end-1,2:end-1),lat_(2:end-1,2:end-1),...
%                (ubar1(2:end-1,1:end-1)+ubar1(2:end-1,2:end))/2, ...
%                (vbar1(1:end-1,2:end-1)+vbar1(2:end,2:end-1))/2,...
%                2)

%         axis([5.538 5.541 43.208 43.211])
%         caxis([0. .1])
caxis([0 250])
        xlabel('Longitude'),ylabel('Latitude')
        title(['T = ' num2str(T_sauv(Tdessin))])

        saveas(gcf,saveName,'fig');
figure(2*ind+1),pcolor(lon_,lat_,real(log(ConcDomaine(:,:,Tdessin)))),
   caxis([-1 5]),colorbar,axis equal
   shading flat
end
%     saveas(gcf,saveName,'jpg')

