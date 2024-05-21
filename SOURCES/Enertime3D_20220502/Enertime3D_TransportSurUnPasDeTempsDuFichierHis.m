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

for t=T1:dt:T2;
    v3D_N=(u3D_2*(t-T1)+(T2-t)*u3D_1)/(T2-T1);     v3D_N(:,:,N)=v3D_N(:,:,N-1);
    v3D_M=(v3D_2*(t-T1)+(T2-t)*v3D_1)/(T2-T1);     v3D_M(:,M,:)=v3D_M(:,M-1,:);
    h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);
    
    % Détermination de l'apport de la source
    Enertime3D_AjoutSource
    
    for k=1:K
        rmask_=Rmask_(:,:,k);
        q=q3D(:,:,k);
        
        v_N=squeeze(v3D_N(k,:,:));v_M=squeeze(v3D_M(k,:,:));
        ParcMarin_Transportb
%         figure(1),clf,pcolor(q),colorbar,caxis([0 5]),axis([150 165 130 160])
        q=q.*rmask_;
        q=max(q,0);
%         figure(2),pcolor(q),shading flat,colorbar,axis([155 190 140 175])
        q(zeta+h<=0)=0;
%         figure(2),clf,pcolor(q),colorbar,caxis([0 5]),axis([150 165 130 160])
        if conservation==1
            DQ=nansum(nansum(q3D(:,:,k)))-nansum(nansum(q));
        end
        
        q(1:10,:)=Conc_Domaine;
        q(:,1:10)=Conc_Domaine;
        qtemp=q;
        if conservation==1
            epsQ_=epsQ/floor((T2-T1)/dt);
            if(DQ>0)
                qtemp(q>epsQ_ & BolSource_==1)=...
                  q(q>epsQ_ & BolSource_==1)...
                    .*(1+DQ.*rampe(q>epsQ_ & BolSource_==1)...
                     /nansum(nansum(q(q>epsQ_).*BolSource_(q>epsQ_).*rampe(q>epsQ_))));
            else
                qtemp(q>epsQ_)=...
                    q(q>epsQ_).*(1+DQ/nansum(nansum(q(q>epsQ_))));
            end
            qtemp=max(qtemp,0);
    %            if(size(find(qtemp<0),1)>0)
    %             if(DQ<0)
    %                 disp(DQ)
    %                 Compteur(k)=Compteur(k)+1;
    %                 [k,Compteur(k)]
    %             end
    %         qtemp(q>epsQ)=q(q>epsQ)...
    %               .*(1+DQ/nansum(nansum(q(q>epsQ))));
        end
        qtemp(isnan(qtemp)==1)=0;
        q3D(:,:,k)=qtemp;
        if(T90~=0)
          q3D(:,:,k)=q3D(:,:,k)*exp(-log(10)*dt/T90);
        end
    end
    %h_=h__;
%     if t>=100
%         disp('oups')
%     end
end
if (size(find(q3D(:,:,k)>100*Conc_Source),1)) > 0
    q3D=q3D_;
    Erreur=[Erreur; T1];
else
    q3D_=q3D;
end
%figure(1),pcolor(q),shading flat,colorbar,axis([155 190 140 175])
if(mod(T2/3600/24,10*TpsEcrtEcran)==0)
    Zeta_Verif=[Zeta_Verif;zeta2(M_source(1),N_source(1))];
    figure(3),pcolor(q3D(:,:,1).*rmask_./rmask_),colorbar,shading flat,axis equal
    caxis([0 100])
    hold on, plot(N_source,M_source,'*r')
    figure(4),pcolor(q3D(:,:,1).*rmask_./rmask_),colorbar,shading flat,axis equal
    caxis([0 1000]),axis([0 250 100 250])%,axis([175 200 80 100])
    hold on, plot(N_source,M_source,'*r')
    title(num2str(T2/3600))
    pause(0.05)
end
%     clf,pcolor(lon_,lat_,q),colorbar,shading flat,axis equal
%     axis([5.538 5.542 43.2075 43.211])
%     pause(0.5)
%     ConcDomaine(120:140,125:135)
%     nt=ind_his;hold on,ech=1.5*5/1000;quiver(LonSource,LatSource,TauX(nt)*ech,TauY(nt)*ech,0,'w')
% %     quiver(LonD,LatD,e*squeeze((u3D_2(:,1:end-1,:)+u3D_2(:,2:end,:))/2),e*squeeze((v3D_2(:,:,1:end-1)+v3D_2(:,:,2:end))/2),'m')
%     pause(0.5)
% clf,pcolor(lon_,lat_,q),colorbar,shading flat,axis equal
% nt=ind_his;hold on,ech=1.5*5/1000;quiver(LonSource,LatSource,TauX(nt)*ech,TauY(nt)*ech,0,'w')
% quiver(LonD,LatD,e*squeeze((u3D_2(:,1:end-1,:)+u3D_2(:,2:end,:))/2),e*squeeze((v3D_2(:,:,1:end-1)+v3D_2(:,:,2:end))/2),'m')
% pause(0.5)
% disp(nt),

