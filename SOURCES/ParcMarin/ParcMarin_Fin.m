TempsResidence=rmask;
TempsResidence(rmask==1)=NaN;
for ind_x=1:Mred;
  for ind_y=1:Nred;
      I0=I(ind_x);dx0=dx;
      J0=J(ind_y);dy0=dy;
      if ((mean(mean(h(I0-dx0:I0+dx0,J0-dy0:J0+dy0)))<20) && ...
              (sum(sum(rmask(I0-dx0:I0+dx0,J0-dy0:J0+dy0)))>4*dx*dy/2))
        TempsResidence(I0-dx0:I0+dx0,J0-dy0:J0+dy0)=...
               TempsRes(ind_x,ind_y)*ones(2*dx0+1,2*dy0+1);
      end
  end
end
TempsResidence=TempsResidence.*rmask;
close all,
pcolor(lon,lat,TempsResidence),shading interp, colorbar, axis equal
