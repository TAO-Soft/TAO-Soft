        %% Conservation de la masse
        vh_N(:,1:N-1)=(h_(:,1:N-1)+h_(:,2:N)).*v_N(:,1:N-1)/2;
        vh_N(:,N)=h_(:,N).*v_N(:,N);
        vh_M(1:M-1,:)=(h_(1:M-1,:)+h_(2:M,:)).*v_M(1:M-1,:)./2;
        vh_M(M,:)=h_(M,:).*v_M(M,:);

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

        q=(q.*h_+(dq_rm_M+dq_rp_M-dq_sm_M-dq_sp_M)...
           +(dq_rm_N+dq_rp_N-dq_sm_N-dq_sp_N))./(h_+Dzeta) ; 
      

