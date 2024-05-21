for t=T1:dt:T2-dt;
    v_N=(ubar2*(t-T1)+(T2-t)*ubar1)/(T2-T1);     v_N(:,N)=v_N(:,N-1);
    v_M=(vbar2*(t-T1)+(T2-t)*vbar1)/(T2-T1);     v_M(M,:)=v_M(M-1,:);
    h__=h+(zeta2*(t-T1)+(T2-t)*zeta1)/(T2-T1);

     for ind=1:N_Milieu
         DeleersExtend_ConsMasse
          q=Q(:,:,ind);
          alpha=Alpha(:,:,ind);
        
         [Q(:,:,ind),Alpha(:,:,ind)]=DeleersExtend_EquationTransport(...
                Q(:,:,ind),...
                Q_lim1_N(:,:,ind),Q_lim2_N(:,:,ind),...
                Q_lim1_M(:,:,ind),Q_lim2_M(:,:,ind),...
                Alpha(:,:,ind),...
                Alpha_lim1_N(:,:,ind),Alpha_lim2_N(:,:,ind),...
                Alpha_lim1_M(:,:,ind),Alpha_lim2_M(:,:,ind));
    end
    for ind=1:N_Milieu
      q=Q(:,:,ind);
      alpha=Alpha(:,:,ind);
      for ind_int=1:N_Milieu
          if (ind==ind_int)
             q(Milieu(:,:,ind)==1)=Concentration0;
             alpha(Milieu(:,:,ind)==1)=0;
          else
             q(Milieu(:,:,ind_int)==1)=0;
             alpha(Milieu(:,:,ind_int)==1)=0;              
          end
      end
      Q(:,:,ind)=q;
      Alpha(:,:,ind)=alpha;
    end
     Age=Alpha./Q;

     h_=h__;
     
     if (mod(t,Tsauvegarde)==0)
         disp(['          Sauvegarde - t=' num2str(t/3600) ' - index =' num2str(index)])
         index_=max(1,index-IndexMin);
         TMat(index_)=t;
            Qtot=sum(Q,3);AgeTot=sum(Alpha,3)./Qtot;
         AgeTotMoy(index_)=nansum(nansum(h_(Lagon==1).*AgeTot(Lagon==1)))/...
                          nansum(nansum(h_(Lagon==1))); 

         if (film==1)
             DeleersExtend_Film
         end

         for ind=1:N_Milieu
             age=Age(:,:,ind);
             q=Q(:,:,ind);
             AgeMoy(index_,ind)=nansum(nansum(h_(Lagon==1).*age(Lagon==1)))/...
                           nansum(nansum(h_(Lagon==1))); 
             Concentration(index_,ind)=nansum(nansum(h_(Lagon==1).*q(Lagon==1)))/... 
                           nansum(nansum(h_(Lagon==1))); 
             AgeMat(:,:,ind,index_)=Age(:,:,ind);
             ConcMat(:,:,ind,index_)=Q(:,:,ind);
         end
         index=index+1;         
      end
end

Lag=Lagon;Lag(Lagon==0)=NaN;
        %QtotVerif_OnContinue=nansum(nansum(abs(Qtot-Concentration0).*Lag));
QtotVerif_OnContinue=max(max(abs(Qtot-Concentration0).*Lag));
DeleersExtend_OnContinue=(QtotVerif_OnContinue ...
                     /Concentration0...
                               > Decroissance);     


