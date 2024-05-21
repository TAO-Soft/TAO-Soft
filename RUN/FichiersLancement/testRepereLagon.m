nc=netcdf('../../Entree/Imm3DRa/grd_T10.nc');
h=nc{'h'}(:);
Latr=nc{'lat_rho'}(:);
Lonr=nc{'lon_rho'}(:);
rmask=nc{'mask_rho'}(:);

H=h;
H(rmask==0)=NaN;
for i=1:size(H,1)
    J=find(H(i,:)<2.5);
if ~isempty(J)
    if J(1)<45, H(i,1:J(1))=NaN; end
end
end

H(1:25,:)=NaN;
H(185:194,1:58)=NaN;
H(20:30,85:end)=NaN;

% H(132:194,:)=NaN;
% H(110:132,60:end)=NaN;

Iisie_=[33 37];Jisie_=[123 127];
Iisie=32:37;Jisie=123:128;
Isie=[Jisie;Iisie]';
 
Iouarai_=[37 43];Jouarai_=[146 152];
Iouarai=37:43;Jouarai=146:152;
Ouarai=[Jouarai;Iouarai]';

Itenia_=[44 60];Jtenia_=[36 36];
Itenia=44:60;Jtenia=53*ones(1,(60-44)+1,1);
Tenia=[Jtenia;Itenia]';

for i=1:size(Isie,1);
    H(Isie(i,1),1:Isie(i,2)-1)=NaN;
end
for i=1:size(Ouarai,1);
    H(Ouarai(i,1),1:Ouarai(i,2)-1)=NaN;
end

figure,pcolor(H),axis equal
