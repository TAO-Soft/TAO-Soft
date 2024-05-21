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


zeta1(zeta1==99)=0;
ZZ=reshape(zeta1,Mx*Nx,1);ZZ=ZZ(RR_rmaskZ==1);
   ZZ=[ZZ;0*XXz_(iTerre_z)];
Zeta1=griddata(XXz,YYz,ZZ,Xz_,Yz_);

ZZ=reshape(ubar1(:,1:end-1),Mx*(Nx-1),1);ZZ=ZZ(RR_rmaskU==1);
   ZZ=[ZZ;0*XXu_(iTerre_u)];
Ubar1=griddata(XXu,YYu,ZZ,Xu_,Yu_);

ZZ=reshape(vbar1(1:end-1,:),(Mx-1)*Nx,1);ZZ=ZZ(RR_rmaskV==1);
   ZZ=[ZZ;0*XXv_(iTerre_v)];
Vbar1=griddata(XXv,YYv,ZZ,Xv_,Yv_);

zeta2(zeta2==99)=0;
ZZ=reshape(zeta2,Mx*Nx,1);ZZ=ZZ(RR_rmaskZ==1);
   ZZ=[ZZ;0*XXz_(iTerre_z)];
Zeta2=griddata(XXz,YYz,ZZ,Xz_,Yz_);

ZZ=reshape(ubar2(:,1:end-1),Mx*(Nx-1),1);ZZ=ZZ(RR_rmaskU==1);
   ZZ=[ZZ;0*XXu_(iTerre_u)];
Ubar2=griddata(XXu,YYu,ZZ,Xu_,Yu_);

ZZ=reshape(vbar2(1:end-1,:),(Mx-1)*Nx,1);ZZ=ZZ(RR_rmaskV==1);
   ZZ=[ZZ;0*XXv_(iTerre_v)];
Vbar2=griddata(XXv,YYv,ZZ,Xv_,Yv_);

zeta1=Zeta1;ubar1=Ubar1;vbar1=Vbar1;
zeta2=Zeta2;ubar2=Ubar2;vbar2=Vbar2;

h=hh;

