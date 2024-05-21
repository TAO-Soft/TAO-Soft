% [Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);
% iTerre=find(Rmask==0);XX_=reshape(X_,Mx_*Nx_,1);YY_=reshape(Y_,Mx_*Nx_,1);
% XX=[reshape(X,Mx*Nx,1);XX_(iTerre)];
% YY=[reshape(Y,Mx*Nx,1);YY_(iTerre)];
% 
% ZZ=[reshape(zeta1,Mx*Nx,1);0*XX_(iTerre)];
% zeta1=griddata(XX,YY,ZZ,X_,Y_);
% 
% ZZ=[reshape(zeta2,Mx*Nx,1);0*XX_(iTerre)];
% zeta2=griddata(XX,YY,ZZ,X_,Y_);
% % ubar1=[ubar1 ubar1(:,end)];ubar1=griddata(X,Y,ubar1,X_(:,1:end-1),Y_(:,1:end-1));
% % vbar1=[vbar1; vbar1(end,:)];vbar1=griddata(X,Y,vbar1,X_(1:end-1,:),Y_(1:end-1,:));
% % ubar2=[ubar2 ubar2(:,end)];ubar2=griddata(X,Y,ubar2,X_(:,1:end-1),Y_(:,1:end-1));
% % vbar2=[vbar2; vbar2(end,:)];vbar2=griddata(X,Y,vbar2,X_(1:end-1,:),Y_(1:end-1,:));
% ubar1_=griddata((X(:,1:end-1)+X(:,2:end))/2,(Y(:,1:end-1)+Y(:,2:end))/2,ubar1(:,1:end-1),X_(:,1:end-1),Y_(:,1:end-1));
% vbar1_=griddata((X(:,1:end-1)+X(:,2:end))/2,(Y(:,1:end-1)+Y(:,2:end))/2,vbar1(:,1:end-1),X_(1:end-1,:),Y_(1:end-1,:));
% % vbar1=[vbar1; vbar1(end,:)];vbar1=griddata(X,Y,vbar1,X_(1:end-1,:),Y_(1:end-1,:));
% % ubar2=[ubar2 ubar2(:,end)];ubar2=griddata(X,Y,ubar2,X_(:,1:end-1),Y_(:,1:end-1));
% % vbar2=[vbar2; vbar2(end,:)];vbar2=griddata(X,Y,vbar2,X_(1:end-1,:),Y_(1:end-1,:));
% % h=hh;
% XX=[reshape((X(:,1:end-1)+X(:,2:end))/2,Mx*(Nx-1),1);XX_(iTerre)];
% YY=[reshape((Y(:,1:end-1)+Y(:,2:end))/2,Mx*(Nx-1),1);YY_(iTerre)];
% ZZ=[reshape(ubar1(:,1:end-1),Mx*(Nx-1),1);0*XX_(iTerre)];
% ubar1=griddata(XX,YY,...
%                 ZZ,X_(:,1:end-1),Y_(:,1:end-1));
% ZZ=[reshape(ubar2(:,1:end-1),Mx*(Nx-1),1);0*XX_(iTerre)];
% ubar2=griddata(XX,YY,...
%                 ZZ,X_(:,1:end-1),Y_(:,1:end-1));
% 
% XX=[reshape((X(1:end-1,:)+X(2:end,:))/2,(Mx-1)*Nx,1);XX_(iTerre)];
% YY=[reshape((Y(1:end-1,:)+Y(2:end,:))/2,(Mx-1)*Nx,1);YY_(iTerre)];
% ZZ=[reshape(vbar1(1:end-1,:),(Mx-1)*Nx,1);0*XX_(iTerre)];
% vbar1=griddata(XX,YY,...
%                 ZZ,X_(1:end-1,:),Y_(1:end-1,:));
% ZZ=[reshape(vbar2(1:end-1,:),(Mx-1)*Nx,1);0*XX_(iTerre)];
% vbar2=griddata(XX,YY,...
%                 ZZ,X_(1:end-1,:),Y_(1:end-1,:));


if CoordonneeZ
    zeta(zeta==99)=0;
    ZZ=reshape(zeta,Mx*Nx,1);ZZ=ZZ(RR_rmaskZ==1);
       ZZ=[ZZ;0*XXz_(iTerre_z)];
    zeta2=griddata(XXz,YYz,ZZ,Xz_,Yz_);
    
    
    
    for k=1:K
        %Utemp=squeeze(u3D(k,:,1:end-1));
        %ZZ=reshape(Utemp,Mx*(Nx-1),1);ZZ=ZZ(RR_rmaskU==1);
        Utemp=squeeze(u3D(k,:,1:end));
        ZZ=reshape(Utemp,Mx*(Nx),1);ZZ=ZZ(RR_rmaskU==1);
           ZZ=[ZZ;0*XXu_(iTerre_u)];
        U2(k,:,:)=griddata(XXu,YYu,ZZ,Xu_,Yu_);
    
        %ZZ=reshape(v3D(k,1:end-1,:),(Mx-1)*Nx,1);ZZ=ZZ(RR_rmaskV==1);
        ZZ=reshape(v3D(k,1:end,:),(Mx)*Nx,1);ZZ=ZZ(RR_rmaskV==1);
           ZZ=[ZZ;0*XXv_(iTerre_v)];
        V2(k,:,:)=griddata(XXv,YYv,ZZ,Xv_,Yv_);
    end
        
    u3D_2=U2;v3D_2=V2;
    zeta=zeta2;
    
    h=hh;
end

if CoordonneeSigma
    zeta(zeta==99)=0;
    zeta2=griddata(X,Y,zeta,X_,Y_);
    
    
    
    for k=1:K
        U2(k,:,:)=griddata(X,Y,squeeze(u3D(k,:,:)),X_,Y_);
        V2(k,:,:)=griddata(X,Y,squeeze(v3D(k,:,:)),X_,Y_);
    end
        
    u3D_2=U2;v3D_2=V2;
    zeta=zeta2;
    
    h=hh;
end
