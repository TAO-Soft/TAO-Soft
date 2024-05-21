conservation=0; % pourquoi ?

epsQ=0.0001;
h_=min(dz*ones(size(h)),h);
for k=1:K
    rmask_=Rmask_(:,:,k);dzz=dZZ(:,:,k);
    %q=q3D(:,:,k).*rmask_;q(h<=-Z(k)-dz(k)/2)=0; % Attention dz - à verif on risque de vider la maille à prox du fond
    q=q3D(:,:,k).*rmask_;q(dzz<dz)=0; % En passant au 3D avec plusieurs mailles, jai changé la ligne du dessus en celle là : à valider
      if conservation==1
        DQ=nansum(nansum(q3D(:,:,k)))-nansum(nansum(q));
        qtemp=q;
        if(DQ>0)
          qtemp(q>epsQ & BolSource==1)= ...
                    q(q>epsQ & BolSource==1)...
                    .*(1+DQ/nansum(nansum(q(q>epsQ).*BolSource(q>epsQ))));
        else
                    disp(DQ)
                    Compteur(k)=Compteur(k)+1;
                    [k,Compteur(k)]
        end   
        q3D(:,:,k)=qtemp;
    else
        q3D(:,:,k)=q;
    end
        
end

for t=T1:dt_:T2;
    for nn = 1: N2dH 
        Enertime3D_TransportSurUnPasDeTempsDuFichierHis_2DH
        % figure(1)
        %     pcolor(lon_,lat_,sqrt(squeeze(u3D_1.^2+v3D_1.^2))./rmask_)
        %     colorbar
        %  figure(2)
        %     pcolor(lon_,lat_,q3D./rmask_),colorbar

    end
    for k = 1: K 
        if (size(find(abs(q3D(:,:,k))>100*Conc_Source | q3D(:,:,k) < 0 | ...
                sum(sum(isnan(q3D(:,:,k)))) >0 ),1)  > 0)
            q3D(:,:,k)=q3D_(:,:,k);
            Erreur=[Erreur; t];
        else
            q3D_(:,:,k)=q3D(:,:,k);
        end
    end
    for nn = 1: N1dV 
        Enertime3D_TransportSurUnPasDeTempsDuFichierHis_1DV
    end
    for k = 1: K 
        if (size(find(abs(q3D(:,:,k))>100*Conc_Source | q3D(:,:,k) < 0 | ...
                sum(sum(isnan(q3D(:,:,k)))) >0 ),1)  > 0)
            q3D(:,:,k)=q3D_(:,:,k);
            Erreur=[Erreur; t];
        else
            q3D_(:,:,k)=q3D(:,:,k);
        end
    end
end

if(mod(T2/3600/24,10*TpsEcrtEcran)==0)
    Zeta_Verif=[Zeta_Verif;zeta2(M_source(1),N_source(1))];
    figure(3),pcolor(q3D(:,:,1).*Rmask_(:,:,1)./Rmask_(:,:,1)),colorbar,shading flat,axis equal
    caxis([0 100])
    hold on, plot(N_source,M_source,'*r')
    figure(4),pcolor(q3D(:,:,1).*Rmask_(:,:,1)./Rmask_(:,:,1)),colorbar,shading flat,axis equal
    caxis([0 1000]),axis([0 250 100 250])%,axis([175 200 80 100])
    hold on, plot(N_source,M_source,'*r')
    title(num2str(T2/3600))
    pause(0.05)
end

