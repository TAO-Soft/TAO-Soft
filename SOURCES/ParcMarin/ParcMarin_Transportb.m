%         q=5*ones(size(q)).*rmask_;
        %q=q*dl*dl.*h_;
        clear vh_N vh_N dq_sm_N dq_sp_N dq_rm_N dq_rp_N 
        clear vh_M vh_M dq_sm_M dq_sp_M dq_rm_M dq_rp_M
        clear Diff

        vh_N(:,1:N-1)=(h_(:,1:N-1)+h_(:,2:N)).*v_N(:,1:N-1)/2;
        vh_N(:,N)=h_(:,N).*v_N(:,N);
        vh_M(1:M-1,:)=(h_(1:M-1,:)+h_(2:M,:)).*v_M(1:M-1,:)./2;
        vh_M(M,:)=h_(M,:).*v_M(M,:);

        %% Conservation de la masse
        % pour tout m (de 1:M) sur N
        % vitesse v_N
        dq_sm_N(:,1)=max(-vh_N(:,1)/dl*dt, 0);
        dq_sm_N(:,2:N)=max(-vh_N(:,1:N-1)/dl*dt, 0);
        dq_sp_N(:,1:N)=max(vh_N(:,1:N)/dl*dt, 0);

        dq_rm_N(:,1)=max(vh_N(:,1)/dl*dt, 0);
        dq_rm_N(:,2:N)=max(vh_N(:,1:N-1)/dl*dt, 0);
        dq_rp_N(:,1:N-1)=max(-vh_N(:,1:N-1)/dl*dt, 0);
        dq_rp_N(:,N)=max(-vh_N(:,N)/dl*dt, 0);

        % pour tout n (de 1:M) sur M
        % vitesse u
        dq_sm_M(1,:)=max(-vh_M(1,:)/dl*dt, 0);
        dq_sm_M(2:M,:)=max(-vh_M(1:M-1,:)/dl*dt, 0);
        dq_sp_M(1:M,:)=max(vh_M(1:M,:)/dl*dt, 0);

        dq_rm_M(1,:)=max(vh_M(1,:)/dl*dt, 0);
        dq_rm_M(2:M,:)=max(vh_M(1:M-1,:)/dl*dt, 0);
        dq_rp_M(1:M-1,:)=max(-vh_M(1:M-1,:)/dl*dt, 0);
        dq_rp_M(M,:)=max(-vh_M(M,:)/dl*dt, 0);
        
        Dzeta=(((dq_rm_M+dq_rp_M-dq_sm_M-dq_sp_M)...
           +(dq_rm_N+dq_rp_N-dq_sm_N-dq_sp_N)));
       
%        dq_rm_M_=dq_rm_M;
%        dq_rp_M_=dq_rp_M;
%        dq_sm_M_=dq_sm_M;
%        dq_sp_M_=dq_sp_M;
%        dq_rm_N_=dq_rm_N;
%        dq_rp_N_=dq_rp_N;
%        dq_sm_N_=dq_sm_N;
%        dq_sp_N_=dq_sp_N;
        
        %% Conservation de la masse
        % pour tout m (de 1:M) sur N
        % vitesse v_N
        dq_sm_N(:,1)=max(-vh_N(:,1).*q(:,1)/dl*dt, 0);
        dq_sm_N(:,2:N)=max(-vh_N(:,1:N-1).*q(:,2:N)/dl*dt, 0);
        dq_sp_N(:,1:N)=max(vh_N(:,1:N).*q(:,1:N)/dl*dt, 0);

        dq_rm_N(:,1)=max(vh_N(:,1).*q_lim1_N/dl*dt, 0);
        dq_rm_N(:,2:N)=max(vh_N(:,1:N-1).*q(:,1:N-1)/dl*dt, 0);
        dq_rp_N(:,1:N-1)=max(-vh_N(:,1:N-1).*q(:,2:N)/dl*dt, 0);
        dq_rp_N(:,N)=max(-vh_N(:,N).*q_lim2_N/dl*dt, 0);

        % pour tout n (de 1:M) sur M
        % vitesse u
        dq_sm_M(1,:)=max(-vh_M(1,:).*q(1,:)/dl*dt, 0);
        dq_sm_M(2:M,:)=max(-vh_M(1:M-1,:).*q(2:M,:)/dl*dt, 0);
        dq_sp_M(1:M,:)=max(vh_M(1:M,:).*q(1:M,:)/dl*dt, 0);

        dq_rm_M(1,:)=max(vh_M(1,:).*q_lim1_M/dl*dt, 0);
        dq_rm_M(2:M,:)=max(vh_M(1:M-1,:).*q(1:M-1,:)/dl*dt, 0);
        dq_rp_M(1:M-1,:)=max(-vh_M(1:M-1,:).*q(2:M,:)/dl*dt, 0);
        dq_rp_M(M,:)=max(-vh_M(M,:).*q_lim2_M/dl*dt, 0);
        
        %% Diffusion
        % Diff=zeros(i2-i1+1,j2-j1+1);
        Diff=zeros(size(h_));
        Diff(2:end-1,2:end-1)=A*(...
             ((q(3:end,2:end-1)-q(2:end-1,2:end-1))...
                   .*rmask_(3:end,2:end-1).*rmask_(2:end-1,2:end-1)...
             -(q(2:end-1,2:end-1)-q(1:end-2,2:end-1))...
                   .*rmask_(2:end-1,2:end-1).*rmask_(1:end-2,2:end-1))...
            +((q(2:end-1,3:end)-q(2:end-1,2:end-1))...
                   .*rmask_(2:end-1,3:end).*rmask_(2:end-1,2:end-1)...
            -(q(2:end-1,2:end-1)-q(2:end-1,1:end-2))...
                   .*rmask_(2:end-1,2:end-1).*rmask_(2:end-1,1:end-2))...
         )/dl/dl*dt.*h_(2:end-1,2:end-1);
         Diff(1,:)=0;Diff(end,:)=0;
         Diff(:,1)=0;Diff(:,end)=0;
        
%         q1=q;
        Dzeta(rmask_==0)=0.;
        %Dzeta=Dzeta*0;
        q=(q.*h_+(dq_rm_M+dq_rp_M-dq_sm_M-dq_sp_M)...
           +(dq_rm_N+dq_rp_N-dq_sm_N-dq_sp_N)+Diff)./...
           (h_+Dzeta) ; 
        q(rmask_==0)=0;
        %q=q/dl/dl;
      %figure,pcolor(lon_,lat_,q.*RR), caxis([4.9999999 5.00000001]),axis([5.5385 5.5405 43.2088 43.2094])
      % h_=h__;
       

