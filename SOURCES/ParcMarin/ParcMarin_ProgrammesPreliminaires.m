close all
clear all

I0=86;J0=3;
%Imin=76;Imax=95;
  Imin=56;Imax=75;
% Imin=36;Imax=55;
% Imin=16;Imax=35;
IO=[9;26;46;66;86];M=5;
dx=[8;10;10;10;10];

J0=[3;8;13;18;23;28;33;38;42];N=9;
dy=[2;2; 2; 2; 2; 2; 2; 2; 2];
% Imin=1;Imax=15;
% Jmin=1; Jmax=5;
% Jmin=6; Jmax=10;
% Jmin=11; Jmax=15;
% Jmin=16; Jmax=20;
% Jmin=21; Jmax=25;
% Jmin=26; Jmax=30;
% Jmin=31; Jmax=35;
% Jmin=36; Jmax=40;
% Jmin=39; Jmax=44;
Decroissance=1/exp(1);

%% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
dt =10;
Hisname='R_his.0000.nc';
nc=netcdf(Hisname);  % Vars=var(nc);ncnames(Vars)';
dm=nc{'pm'};dn=nc{'pn'};dl=250;
lat=nc{'lat_rho'}(:);lon=nc{'lon_rho'}(:);
T_His=nc{'scrum_time'}(:);
rmask=nc{'mask_rho'}(:,:);
angle=nc{'angle'}(:,:);
h=nc{'h'}(:,:);
x=0;
[M,N]=size(lat);
X=[1:M];Y=[1:N]; [X,Y]=meshgrid(X,Y); X_=X';Y_=Y';
q=zeros(M,N).*rmask;
q_lim1_N=ones(M,1)*0;
q_lim2_N=ones(M,1)*0;
q_lim1_M=ones(1,N)*0;
q_lim2_M=ones(1,N)*0;
%     q(13,10)=30;
%      q(34,18)=30;
%      q(81,6)=30;
%      q(65,3)=30;
      q(Imin:Imax,Jmin:Jmax)=30*rmask(Imin:Imax,Jmin:Jmax);
      Concentration0=sum(sum(q));
      Concentration=sum(sum(q));
      section=Concentration0/30
%      q(90,40)=30;
%q=ones(M,N).*rmask;
   Qmean=0*ones(size(T_His,1)-1);  
   T2=0;T1=0;N_T2=0;

while (Concentration > Concentration0 * Decroissance)
  N_T2*(T2-T1)
  ParcMarin_Transport
  ParcMarin_Dessin
  N_T2=N_T2+1;
end
