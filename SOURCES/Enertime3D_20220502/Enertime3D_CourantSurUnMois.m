T2=iT0Connexion;
u3D_=squeeze(nc{Ubar}(1,:,Imin:Imax,Jmin:Jmax));
v3D_=squeeze(nc{Vbar}(1,:,Imin:Imax,Jmin:Jmax));
zeta=squeeze(nc{Zeta}(1,Imin:Imax,Jmin:Jmax));
Enertime3D_ChgtRepereVertical
Enertime3D_DiviseDomaine
    
for ind_his=iT0Connexion:size(T_His)-1;
  if Enertime_OnContinue
    [ind_his,index,N_T2]

    T=T_His(ind_his);
    u3D_=squeeze(nc{Ubar}(ind_his,:,Imin:Imax,Jmin:Jmax));
    v3D_=squeeze(nc{Vbar}(ind_his,:,Imin:Imax,Jmin:Jmax));
    zeta=squeeze(nc{Zeta}(ind_his,Imin:Imax,Jmin:Jmax));
    Enertime3D_ChgtRepereVertical
%     Enertime3D_DiviseDomaine
    

    index=index+1;
    NbSauv=1;
    if (mod(index,NbSauv)==0)% 348)
        for k=1:K
%          Umod(k,:,:,index/NbSauv)=u3D_2(k,:,:);
%          Vmod(k,:,:,index/NbSauv)=v3D_2(k,:,:);
          UmodG(k,:,:,index/NbSauv)=u3D(k,:,:);
          VmodG(k,:,:,index/NbSauv)=v3D(k,:,:);
        end
         t_sauv(index/NbSauv)=T+N_T2*(T2_His-T1_His);
         
    end
   
  end
end

