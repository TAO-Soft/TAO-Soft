%Ocean=ones(size(Dom,1),size(Dom,2));Ocean(Dom~=1)=0;    

load Masque
N_Milieu=2;
Milieu(:,:,1)=Ocean;
Milieu(:,:,2)=Recif;
%Milieu(:,:,3)=Usine;
% Milieu(:,:,4)=Riviere;
% Milieu(:,:,5)=ReefInt;
% Milieu(:,:,6)=LagonsAdjacents;
% 
%Milieu(:,:,3)=ReefInt+LagonsAdjacents;
rmask=Terre;

Lagon=rmask-sum(Milieu,3);
    % figure,pcolor(Lon,Lat,Milieu(:,:,1)+2*Milieu(:,:,2)+4*Milieu(:,:,3)+...
    %     8*Milieu(:,:,4)+16*Milieu(:,:,5)+32*Milieu(:,:,6)+64*Lagon)
    % figure,pcolor(Milieu(:,:,1)+2*Milieu(:,:,2)+4*Milieu(:,:,3)+...
    %     8*Milieu(:,:,4)+16*Milieu(:,:,5)+32*Milieu(:,:,6)+64*Lagon)


