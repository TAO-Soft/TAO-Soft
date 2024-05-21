for ind=1:N_Milieu
  q_lim1_N=ones(M,1)*Concentration0;alpha_lim1_N=ones(M,1)*0;
  q_lim2_N=ones(M,1)*Concentration0;alpha_lim2_N=ones(M,1)*0;
  q_lim1_M=ones(1,N)*Concentration0;alpha_lim1_M=ones(1,N)*0;
  q_lim2_M=ones(1,N)*Concentration0;alpha_lim2_M=ones(1,N)*0;

  q=zeros(M,N).*rmask;alpha=zeros(M,N).*rmask;
  q(Milieu(:,:,ind)==1)=Concentration0;
  alpha(Milieu(:,:,ind)==1)=0;
  
  
  Q_lim1_N(:,:,ind)=q_lim1_N; Alpha_lim1_N(:,:,ind)=alpha_lim1_N;
  Q_lim2_N(:,:,ind)=q_lim2_N; Alpha_lim2_N(:,:,ind)=alpha_lim2_N;
  Q_lim1_M(:,:,ind)=q_lim1_M; Alpha_lim1_M(:,:,ind)=alpha_lim1_M;
  Q_lim2_M(:,:,ind)=q_lim2_M; Alpha_lim2_M(:,:,ind)=alpha_lim2_M;
  Q(:,:,ind)=q;
  Alpha(:,:,ind)=alpha;
end


