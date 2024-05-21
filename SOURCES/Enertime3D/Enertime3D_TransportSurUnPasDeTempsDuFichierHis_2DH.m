% Détermination de l'apport de la source
Enertime3D_AjoutSource

% %% Reduire le domaine

if(ReductionDomaine)
    ConcTot=sum(q3D,3);
    ii=find(ConcTot>ConcMin);
    [x,y]=ind2sub(size(h),ii);
    i1=max(min(x)-10,2);i2=min(max(x)+10,size(h,1)-1);j1=max(min(y)-10,2);j2=min(max(y)+10,size(h,2)-1);
    
            Q3d=q3D;
            q3D=q3D(i1:i2,j1:j2,:);
            hs_=h_;h_=h_(i1:i2,j1:j2);
            Rmask__=Rmask_;Rmask_=Rmask_(i1:i2,j1:j2,:);
            N_=N;M_=M;
            q_lim1_N_=q_lim1_N;q_lim2_N_=q_lim2_N;
            q_lim1_M_=q_lim1_M;q_lim2_M_=q_lim2_M;
            q_lim1_N_3d=squeeze(Q3d(i1:i2,j1-1,:));q_lim2_N_3d=squeeze(Q3d(i1:i2,j2+1,:));
            q_lim1_M_3d=squeeze(Q3d(i1-1,j1:j2,:));q_lim2_M_3d=squeeze(Q3d(i2+1,j1:j2,:));
            M=i2-i1+1;N=j2-j1+1;
    
    v3D_N=(u3D_2(:,i1:i2,j1:j2)*(t-T1)+(T2-t)*u3D_1(:,i1:i2,j1:j2))/(T2-T1); 
    v3D_M=(v3D_2(:,i1:i2,j1:j2)*(t-T1)+(T2-t)*v3D_1(:,i1:i2,j1:j2))/(T2-T1); 
    h__=h(i1:i2,j1:j2)+(zeta2(i1:i2,j1:j2)*(t-T1)+(T2-t)*zeta1(i1:i2,j1:j2))/(T2-T1);
else
    v3D_N=(u3D_2*(t-T1)+(T2-t)*u3D_1)/(T2-T1);     v3D_N(:,:,N)=v3D_N(:,:,N-1);
    v3D_M=(v3D_2*(t-T1)+(T2-t)*v3D_1)/(T2-T1);     v3D_M(:,M,:)=v3D_M(:,M-1,:);
    h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);
end
        

for k=1:K
    rmask_=Rmask_(:,:,k);
    q=q3D(:,:,k);
    v_N=squeeze(v3D_N(k,:,:));v_M=squeeze(v3D_M(k,:,:));
    if ReductionDomaine
        q_lim1_N=q_lim1_N_3d(:,k);q_lim2_N=q_lim2_N_3d(:,k);
        q_lim1_M=q_lim1_M_3d(:,k)';q_lim2_M=q_lim2_M_3d(:,k)';
    end

    QTotal=sum(sum(q));
        ParcMarin_Transportb
    q(abs(q)<eps)=0;
    q=q.*rmask_;

    %q(zeta+h<=0)=0;
%     if min(min(q)) < 0
%         disp('negatif')
%     end
    if conservation==1
        DQ=nansum(nansum(q3D(:,:,k)))-nansum(nansum(q));
    end

    if ~ReductionDomaine
         q=q*QTotal/sum(sum(q));
         q(1:3,:)=Conc_Domaine;
         q(:,end-3:end)=Conc_Domaine;
    end

    if conservation==1
        qtemp=q;
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
        q=qtemp;
    end

    q3D(:,:,k)=q;
    if(T90~=0)
      q3D(:,:,k)=q3D(:,:,k)*exp(-log(10)*dt/T90);
    end
end

if ReductionDomaine
    h_=hs_;N=N_;M=M_;Rmask_=Rmask__;
    Q3d(i1:i2,j1:j2,:)=q3D;q3D=Q3d;
end

