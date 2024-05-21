close all
clear all

% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
DeleersExtend_DefinitionNom
dt =250;
eps=5E-1;
Decroissance=1/exp(2);

ParcMarin_InitialisationDomaine

I=[11;26;46;66;86];Mred=5;
J=[3;8;13;18;23;28;33;38;42];Nred=9;
dx=5;
dy=5;
I=dx+1:2*dx:M-dx;Mred=size(I,2);
J=dy+1:2*dy:N-dy;Nred=size(J,2);

TempsRes=NaN*zeros(Mred,Nred);

for ind_x=1:Mred;
  for ind_y=1:Nred;
      I0=I(ind_x);dx0=dx;
      J0=J(ind_y);dy0=dy;
      if ((mean(mean(h(I0-dx0:I0+dx0,J0-dy0:J0+dy0)))<200) && ...
              (sum(sum(rmask(I0-dx0:I0+dx0,J0-dy0:J0+dy0)))>4*dx*dy/2))
          TempsRes(ind_x,ind_y)=mod(ind_x,2)*mod(ind_y,2)+1;
      end
  end
end
ParcMarin_Fin

TempsRes=zeros(Mred,Nred);

for ind_x=1:Mred;
  for ind_y=1:Nred;
      I0=I(ind_x);dx0=dx;
      J0=J(ind_y);dy0=dy;
      if ((mean(mean(h(I0-dx0:I0+dx0,J0-dy0:J0+dy0)))<20) && ...
              (sum(sum(rmask(I0-dx0:I0+dx0,J0-dy0:J0+dy0)))>4*dx*dy/2))
          disp(' ')
          disp(' ')
          disp(['Calcul du Temps de residence pour la zone  :  ' ...
                 num2str([I0 J0])])
          ParcMarin_InitialisationConc
      
          ParcMarin_TempsDeResidence
          TempsRes(ind_x,ind_y)=(T0+t0)/3600/24;
          disp(['Temps de Residence : ' num2str(TempsRes(ind_x,ind_y))])
      end
  end
end

ParcMarin_Fin

close(nc),close(ng)