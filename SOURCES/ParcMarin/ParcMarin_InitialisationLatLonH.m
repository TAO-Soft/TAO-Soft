ng=netcdf(Hisgrid);  % Vars=var(nc);ncnames(Vars)';
if~exist('Model')
    Model='Croco'
end
if ~exist('nx')
  nx=1;disp('Aucune subdivision des mailles : nx = 1')
end
if ~exist('Imin')  | ~exist('Jmin') | ~exist('Imax')  | ~exist('Jmax')
    Imin=1;Jmin=1;
    if strcmp(Model,'Croco')==1
        temp=ng{'h'}(:);
    end
    if strcmp(Model,'Mars')==1 | strcmp(Model,'Mars3D')==1 
        temp=ng{'H0'}(:,:);
    end
    [Imax,Jmax]=size(temp);%Imax=Imax-1;Jmax=Jmax-1;
end

if strcmp(Model,'Croco')==1
    dm=ng{'pm'}(:,:);dn=ng{'pn'}(:,:);
        dl=mean([mean(mean(1./dm)) mean(mean(1./dn))]);
    lat=ng{'lat_rho'}(Imin:Imax,Jmin:Jmax);
       lon=ng{'lon_rho'}(Imin:Imax,Jmin:Jmax);
    rmask=ng{'mask_rho'}(Imin:Imax,Jmin:Jmax);
    angle=ng{'angle'}(Imin:Imax,Jmin:Jmax);
    h=ng{'h'}(Imin:Imax,Jmin:Jmax);
    [M,N]=size(lat);
    sigma=ng{'s_rho'}(:);
    
%     rmask(end-1:end,1:16)=0;
%     rmask(end-2:end,end-12:end)=0;
%     rmask(1:2,end)=0;
end
if strcmp(Model,'Mars')==1 | strcmp(Model,'Mars3D')==1 
    h=ng{'H0'}(:,:);
    rmask=ones(size(h));rmask(h<0)=NaN;
    pcolor(h.*rmask),shading flat
%    disp('Etes-vous OK ?'),pause
    if TestAvion
        lat=ng{'latitude'}(Imin:Imax,Jmin:Jmax);lon=ng{'longitude'}(Imin:Imax,Jmin:Jmax); %TestAvion
    else
        lat=ng{'latitude'}(Imin:Imax);lon=ng{'longitude'}(Jmin:Jmax); 
        [lon,lat]=meshgrid(lon,lat);
    end
    h=ng{'H0'}(Imin:Imax,Jmin:Jmax);
%     lat=ng{'latitude'}(:);lon=ng{'longitude'}(:);
%     h=ng{'H0'}(:,:);
    rmask=ones(size(h));rmask(h<0)=0;
    Rmask=rmask;
    rmask_=rmask;
    angle=0*ones(size(h));
    [M,N]=size(lon);
end
if strcmp(Model,'Mars3D')==1 
    sigma=ng{'SIG'}(:);sigma=(sigma-1);
end

x=0;
X=[1:M];Y=[1:N]; [X,Y]=meshgrid(X,Y); X=X';Y=Y';
X_=[1:1/nx:M];Y_=[1:1/nx:N]; [X_,Y_]=meshgrid(X_,Y_); X_=X_';Y_=Y_';
Ocean=double(h>20);


h(rmask==0)=0;
hh=griddata(X,Y,h,X_,Y_);
lat_=griddata(X,Y,lat,X_,Y_);
lon_=griddata(X,Y,lon,X_,Y_);
angle_=griddata(X,Y,angle,X_,Y_);angle=angle_;
dl=dl/nx;


if(nx>1)
    %Enertime3D_DiviseDomainePreparation
    if CoordonneeZ
        DiviseDomaine = true
        E3D_DiviseDomaine
        [Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);
    

            H_=hh;
        h_=dz*ones(size(h));
        Rmask__=Rmask;
        
        Unite3D=ones(size(Rmask__,1),size(Rmask__,2),K);
        Rmask_=Unite3D;ZZ_=0*Unite3D;dZZ=0*Unite3D;
        
        ZZ_(:,:,1)=0;
        for k=1:K
            rm=Rmask_(:,:,k);
                rm(Rmask__==0)=0;
                rm(hh<=-Z_(k))=0;
            zz_=-min(-Z_(k+1),hh);
            dzz=-(zz_-ZZ_(:,:,k)).*rm;
            Rmask_(:,:,k)=rm;
            ZZ_(:,:,k+1)=zz_;
            dZZ(:,:,k)=dzz;
        end
    end
    if CoordonneeSigma
        DiviseDomaine = true
        E3D_DiviseDomaineCroco
        hh=h_;H=hh;
        if strcmp(Model,'Mars3D')==1
            [Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);
        end
        Rmask_=floor(Rmask);
        rmask_=floor(Rmask);
    end

    
else % Attention : je ne sais pas si ca fonctionne pour Carry (à la base, il n'y avait pas le else, mais un end)
    DiviseDomaine = false
    if CoordonneeZ
        if strcmp(Model,'Mars3D')==1
            [Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);
        end
        H_=hh;
        h_=dz*ones(size(h));
        Rmask__=griddata(X,Y,rmask,X_,Y_);
        
        Unite3D=ones(size(Rmask__,1),size(Rmask__,2),K);
        Rmask_=Unite3D;ZZ_=0*Unite3D;dZZ=0*Unite3D;
        
        ZZ_(:,:,1)=0;
        for k=1:K
            rm=Rmask_(:,:,k);
                rm(Rmask__==0)=0;
                rm(h<=-Z_(k))=0;
            zz_=-min(-Z_(k+1),hh);
            dzz=-(zz_-ZZ_(:,:,k)).*rm;
            Rmask_(:,:,k)=rm;
            ZZ_(:,:,k+1)=zz_;
            dZZ(:,:,k)=dzz;
        end
    end
    if CoordonneeSigma
        if strcmp(Model,'Mars3D')==1
            [Mx,Nx]=size(X);[Mx_,Nx_]=size(X_);
        end
        rmask_=griddata(X,Y,rmask,X_,Y_);
        Rmask_=griddata(X,Y,rmask,X_,Y_);
    end
end

if CoordonneeZ
    dZZ(dZZ<=0.5)=0;
    ZZ_(:,:,1:end-1)=-1*cumsum(dZZ,3);
    zz=-1*ZZ_(:,:,end-1);zz(zz<H_ & H_>=-Z_(end))=H_(zz<H_ & H_>=-Z_(end));
    ZZ_(:,:,end)=-1*zz;
    Rmask__=ones(size(dZZ));Rmask__(dZZ==0)=0;
    hh=-ZZ_(:,:,end);H_=hh;
end
if CoordonneeSigma
    dZZ=1;
end
